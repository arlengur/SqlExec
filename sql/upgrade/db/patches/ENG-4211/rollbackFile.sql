UPDATE `prodlims`.`script`
SET code = '
import com.natera.lims.datamodel.ivf.prod.*
// def states = [LimsState.NPT_AWAITING_SAMPLES, LimsState.NPT_IN_LAB_PROGRESS,LimsState.NPT_SANITY_CHECKS_FAILED,LimsState.NPT_HANDCALL,LimsState.NPT_GC_REVIEW, LimsState.NPT_REPORT_READY ]

def cases = caseFileDAO.getSession().createQuery("from CaseFile cf where cf.state not in (:state) and testType=''NPT''")
				.setParameterList("state",java.util.Arrays.asList(LimsState.ARCHIVE, LimsState.NPT_REPORT_SENT)).list()


println "MISSING REPORT for ${cases.size()} cases where testType=NPT and state!=ARCHIVE"
println ([''Case'',''State''.padRight(30),''org''.padRight(30),''DR'',''EDD'',''Coll'',''MA'',''NY'',''Categories''].join(''	''))

cases.each { cf ->
  
  String clinicName = cf.clinic?.name?.replace('','','' '') ?: ''''
  if (clinicName.size() > 30) clinicName = clinicName[0..29]
  
  println ([cf.id,
            cf.state.toString().padRight(30),
            clinicName.padRight(30),
            cf.physician == null ? "TRUE" : "",
            (cf.getExpectedDueDate()==null || cf.parentKits.any {it.gestationalAge==null}) ? "TRUE" : "",
            cf.biologicalMotherSamples.any{it.collectionDate == null} ? "TRUE" : "",
            cf.patient.dateOfBirth==null ? "TRUE" : "",
            cf.clinic?.address?.state==''NY'' ? "TRUE" : "",
            cf.categories.findAll{it.name!=''Commercial testing''}.collect { it.name }.join('','')
           ].join(''	''))
}

''''
'
WHERE id = 4;

UPDATE `prodlims`.`script`
SET code = 'import org.apache.poi.ss.usermodel.*
import org.apache.poi.xssf.usermodel.*
import com.natera.lims.datamodel.core.*
import com.natera.lims.datamodel.ivf.prod.*
import static com.natera.lims.datamodel.ivf.prod.PaternityFields.*
import org.apache.commons.lang.StringUtils
import java.text.SimpleDateFormat


def NL = "\n"

def nptKits = caseFileDAO.getSession().createQuery("from ParentKit pk inner join fetch  pk.caseFile cf where cf.closed is null and pk.state not in (:state) and testType=''NPT''")
        .setParameterList("state",java.util.Arrays.asList(LimsState.ARCHIVE, LimsState.NPT_REPORT_SENT)).list()

/*
row.createCell(0).setCellValue("Case id")
row.createCell(1).setCellValue("Opened")
row.createCell(2).setCellValue("Test")
row.createCell(3).setCellValue("Clinic name")
row.createCell(4).setCellValue("Physician last name")
row.createCell(5).setCellValue("Kit barcode")
row.createCell(6).setCellValue("Kit received")
row.createCell(7).setCellValue("Redraw reason")
row.createCell(8).setCellValue("Redraw categories")
row.createCell(9).setCellValue("Contact date")
row.createCell(10).setCellValue("Contact notes")
row.createCell(11).setCellValue("Contact user")
*/
def redrawRecords = sessionFactory.currentSession.createSQLQuery("select r.* from redrawcases r where ``Test`` = ''NPT''").list()

//[ parentkit.barcode, [ parentKit.barcode, parentKit.received, redraw reasons, redraw categories, contact notes, caseFile.opened, clinic name, doc last name, state,casefile id]]
def redrawLists = redrawRecords.groupBy{ it[5] }.collect{ kit, record->
    [(record[0][5]), [
            record[0][5],
            record[0][6],
            record.collect{ it[7] }.unique().join(", "),
            record.collect{ it[8] }.unique().join(", "),
            record.sort{ it[9] }.collect{ r-> (r[9] == null && r[11] == null && r[10] == null) ? "No contact notes found." : String.format("• %tD %<tR by %s: %s", r[9], r[11], r[10]) }.unique().join(NL),
            record[0][1],
            record[0][3],
            record[0][4],
            record[0][12],
            record[0][0],
    ]]}

def reportRows = []
nptKits.each { pk ->
	def cf = pk.caseFile;
    //Skip cases in the PreNATUS (118) or PreNATUS - MAIN (162) categories
    if (cf.categories.findAll { it.id == 118 || it.id == 162 }) return;

    def clinic = cf.clinic
    def pricePlan = clinic?.getOrganizationPricingPlan(TestType.NPT)
    def isBillToClinic = (pricePlan?.billToType == BillToType.CLINIC)
    def isBillToInsurance = (pricePlan?.billToType == BillToType.INSURANCE)
    def isInternational = (clinic?.address?.country != "USA")


    def patientName = (StringUtils.isBlank(cf.patient.lastname) || StringUtils.isBlank(cf.patient.firstname)) ? "MISSING" : ""
    String clinicName =  clinic?.name ?: "MISSING"

    def patientDob = ""
    def collectionDate = ""
    use (groovy.time.TimeCategory) {
        if (cf.patient.dateOfBirth==null ) { patientDob = "MISSING" }
        else {
            patientDob = cf.patient.dateOfBirth.after(16.years.ago) || cf.patient.dateOfBirth.before(50.years.ago) ? cf.patient.dateOfBirth.format("MM/dd/yyyy") : ""
        }

        if ( cf.biologicalMotherSamples.any{it.collectionDate == null} ) { collectionDate = "MISSING" }
        else if (  !(oldSamples = cf.biologicalMotherSamples.findAll{ (it.received - it.collectionDate).days > 6 || (it.received - it.collectionDate).days < 0 }).empty ) {
            oldSamples.each{ collectionDate += String.format("%s: %d days%n",  it.barcode, (it.received - it.collectionDate).days.longValue()) }
        }
    }

    def kitsWithMomSamples = cf.parentKits.findAll{  it.samples.any{  s->s.subject.familyPositions.any{  it == com.natera.lims.datamodel.ivf.FamilyPosition.patient}}}
    def eddOrGa = ""
    if (kitsWithMomSamples.any{it.gestationalAge==null && it.expectedBirthDate==null} ) { eddOrGa = "MISSING" }
    else {
        kitsWithMomSamples.findAll{ it.computedGestationalAge < 9 * 7 || it.computedGestationalAge > 40 * 7 }.each{
          eddOrGa += String.format("%s: ", it.barcode)
          if ( collectionDate == "MISSING" || it.computedGestationalAge == null ) {
            eddOrGa +=  "Can''t calc."
          } else {
            eddOrGa += String.format("%dw%dd", (it.computedGestationalAge/7).longValue(), (it.computedGestationalAge%7).longValue())
          }
          eddOrGa += NL
        }
    }
    if (eddOrGa == "") {
      use (groovy.time.TimeCategory) {
        kitsWithMomSamples.findAll { it.expectedBirthDate != null && it.received != null && (it.expectedBirthDate.before(it.received) || it.expectedBirthDate.after(it.received.plus(40.weeks))) }.each {
            eddOrGa += String.format("%s: EDD %s", it.barcode, it.expectedBirthDate.format("MM/dd/yyyy"))
        }
      }
    }

    //aMDx is clinic 817
    def isAMDx = (817 == clinic?.id)
    
    //Quest clinics
    def isQuest = (clinic?.name?.startsWith("Quest Diagnostics"))

    def patientAddress = !isAMDx && isBillToInsurance && (StringUtils.isBlank(cf.patient.defaultAddress.street1) || StringUtils.isBlank(cf.patient.defaultAddress.city) ||
            StringUtils.isBlank(cf.patient.defaultAddress.state) || StringUtils.isBlank(cf.patient.defaultAddress.postcode) )  ? "MISSING" : ""


    // bill-to-clinic cases won''t have doctors
    def physician = (cf.physician == null && !isBillToClinic) ? "MISSING" : ""
    def physicianLastName = cf.physician?.lastname ?: ""

    def nyOrMa = (clinic?.address?.state==''NY'' || clinic?.address?.state==''MA'') ? "YES" : ""
    def nyWaiverMissing = cf.requiresNYWaiver && (cf.paternityFields.receivedNYWaiver == null || !cf.paternityFields.receivedNYWaiver) ? "MISSING" : ""

    def docSig =  (isBillToClinic || isInternational || cf.physician?.signatureOnFile || cf.paternityFields?.consentSignature) ? "" : "MISSING"

    def pregnant = cf.paternityFields?.pregnant == QuestionnaireChoice.N ? "YES" : (cf.paternityFields?.pregnant == null ? (isQuest || isInternational ? "" : "MISSING") : "")
    def eggDonor = cf.paternityFields?.eggDonorUsed == QuestionnaireChoice.Y ? "YES" : (cf.paternityFields?.eggDonorUsed == null ? (isQuest || isInternational ? "" : "MISSING") : "")
    def surrogate = cf.paternityFields?.surrogateUsed == QuestionnaireChoice.Y ? "YES" : (cf.paternityFields?.surrogateUsed == null ? (isQuest || isInternational ? "" : "MISSING") : "")
    def multi = cf.paternityFields?.multiplePregnancy == QuestionnaireChoice.Y ? "YES" : (cf.paternityFields?.multiplePregnancy == null ? (isQuest || isInternational ? "" : "MISSING") : ( cf.paternityFields?.multiplePregnancy == QuestionnaireChoice.UNSURE ? "UNSURE" :""))
    
    def missingInsurance = cf.paternityFields?.missingInsurance ? "YES" : ""
    def missingDeliveryDestination = [com.natera.lims.datamodel.core.DeliveryMethod.values() as List].collectAll { cf?.getDeliveryDestinations(it) }.flatten().findAll { it != null && it != "" }.size() == 0 ? "MISSING" : ""

    def redrawsForCase = redrawLists.findAll{ it[0] == pk.barcode }
    
    // 165: Receiver escalation
    // 164: Out of Spec-Hold
    // 109: Redraw mother
    def hasCheckedCategory = !cf.categories.findAll { it.id == 165 || it.id == 164 || it.id == 109 }.empty

    // do not include those cases with no missing information
    if (!((clinicName == "MISSING" || clinicName == "Clinic Unknown") ||
            patientName != "" ||
            patientAddress != "" ||
            physician != "" ||
            eddOrGa != "" ||
            collectionDate != "" ||
            patientDob != "" ||
            (nyOrMa == "YES" && docSig == "MISSING") ||
            nyWaiverMissing != "" ||
            missingInsurance != "" ||
            missingDeliveryDestination != "" ||
            docSig != "" ||
            pregnant != "" ||
            eggDonor != "" ||
            surrogate != "" ||
            multi != "" ||
            hasCheckedCategory)
            && redrawsForCase.empty) { return; }

    if (redrawsForCase.empty) {
        //add a dummy row with N/A for redraw-specific columns
        redrawsForCase << [cf.id, ["N/A", "N/A","N/A","N/A","N/A"]]
    }

    //cf columns var below
    redrawsForCase.collect{ it[1] }.each{  reportRows << [
            cf.id,
            clinicName,
            cf.opened,
            pk.state.toString(),
            it[0],
            it[1],
            it[2],
            it[3],
            it[4],
            patientName,
            patientAddress,
            physicianLastName,
            physician,
            eddOrGa,
            collectionDate,
            patientDob,
            nyOrMa,
            nyWaiverMissing,
            docSig,
            missingInsurance,
            missingDeliveryDestination,
            pregnant,
            eggDonor,
            surrogate,
            multi,
            isInternational,
            cf.categories.findAll{it.name != ''Commercial testing'' && it.name != ''Use Clinic Default Billing'' }.collect { it.name }.join('','')
            ]}
    redrawLists -= redrawsForCase
}

//cf columns var below
redrawLists.each{  reportRows << [
        it[1][9],
        it[1][6],
        it[1][5],
        it[1][8],
        it[1][0],
        it[1][1],
        it[1][2],
        it[1][3],
        it[1][4],
        "N/A",
        "N/A",
        it[1][7],
        "N/A",
        "N/A",
        "N/A",
        "N/A",
        "N/A",
        "N/A",
        "N/A",
        "N/A",
        "N/A",
        "N/A",
        "N/A",
        "N/A",
        "N/A",
        "N/A",
        "N/A"]
}

reportRows.sort{ a,b -> a[1].compareTo(b[1]) }

def headers = [
  ''Responsible Party'',
  ''Support if "Clinic Unknown"'',
  ''N/A'',
  ''N/A'',
  ''N/A'',
  ''N/A'',
  ''Bo'',
  ''Bo'',
  ''N/A'',
  ''Support'',
  ''Support'',
  ''Support'',
  ''Support'',
  ''Bo if <9wks; Support if "Missing"'',
  ''Bo'',
  ''Support'',
  ''Support'',
  ''Support'',
  ''Support'',
  ''Support'',
  ''Support'',
  ''Bo if "Yes"'',
  ''Bo if "Yes"'',
  ''Bo if "Yes"'',
  ''Bo if "Yes"'',
  ''Support'',
  ''N/A''
]
def columns = [
  ''Case'',
  ''Clinic'',
  ''Opened'',
  ''State'',
  ''Kit Barcode'',
  ''Kit Recevied'',
  ''Redraw Reason'',
  ''Redraw Categories'',
  ''Contact Notes'',
  ''Pat. Name'',
  ''Pat. Address'',
  ''Dr Last Name'',
  ''DR'',
  ''EDD or GA'',
  ''Collection Date'',
  ''Patient DOB'',
  ''NY or MA'',
  ''NY Waiver'',
  ''Doc Sig'',
  ''Missing Ins.'',
  ''No Del. Dest.'',
  ''OoS:NotPreg'',
  ''OoS:Egg'',
  ''OoS:Surr'',
  ''OoS:Multi'',
  ''International'',
  ''Categories''
]

def dateColumns = [''Opened'', ''Kit Recevied'']
def wrapColumns = [''Contact Notes'', ''Collection Date'',''EDD or GA'']


Workbook wb = new XSSFWorkbook()
CreationHelper createHelper = wb.getCreationHelper()
Sheet sheet = wb.createSheet("Missing Info and Redraw Cases")

Row header = sheet.createRow((short) 0)
headers.eachWithIndex { c, i -> header.createCell(i).setCellValue(c) }

Row row = sheet.createRow((short) 1)
columns.eachWithIndex { c,i-> row.createCell(i).setCellValue(c) }

reportRows.eachWithIndex { dataRow, rowCount ->
    row = sheet.createRow((short) rowCount + 2)
    dataRow.eachWithIndex { data, columnCount->
        def colName = columns[columnCount]
        def cell = row.createCell(columnCount)
        cell.setCellValue(data)
        if (dateColumns.contains(colName)) {
            cs = wb.createCellStyle();
            cs.setDataFormat(
                    createHelper.createDataFormat().getFormat("mm/dd/yyyy"))
            cell.setCellStyle(cs)
        } else if (wrapColumns.contains(colName)) {
            def cs = wb.createCellStyle()
            cs.setWrapText(true)
            cell.setCellStyle(cs)
        }
    }
}

columns.eachWithIndex { c,i-> sheet.autoSizeColumn((short) i)}
// column 8 is the contact notes column, set it to 50 chars
sheet.setColumnWidth((short) 8, 50 * 256 )

ByteArrayOutputStream out = new ByteArrayOutputStream()
wb.write(out)
def date = new SimpleDateFormat("yyyy-MM-dd").format(new Date())
secureEmailSender.send(java.util.Arrays.asList(toAddresses), "Missing Info & Redraw Report for ${date} (${reportRows.size()} unarchived NPT cases)", "", "missing-data-redraws-${date}.xlsx", out.toByteArray(), false)'
WHERE id = 8;

UPDATE `prodlims`.`script`
SET code = 'import org.apache.poi.ss.usermodel.*
import org.apache.poi.xssf.usermodel.*
import org.apache.commons.lang.time.DateUtils
import java.util.*
import java.text.SimpleDateFormat

theDay = org.apache.commons.lang.StringUtils.isBlank(theDay) ? new Date() : java.text.DateFormat.getDateInstance(java.text.DateFormat.SHORT).parse(theDay)
  
def receivedKits = new TreeSet(new com.natera.lims.datamodel.Identifiable.ID_COMPARATOR())
receivedKits.addAll(caseFileDAO.getSession().createQuery(
  "select pk from com.natera.lims.datamodel.ivf.prod.ParentKit pk join fetch pk.receipts r join fetch pk.caseFile cf join fetch pk.samples sample where r.received between :start and :end and cf.testType = ''NPT''")
  .setParameter("start", DateUtils.truncate(theDay, Calendar.DATE) ).setParameter("end",  DateUtils.ceiling(theDay, Calendar.DATE)).list())

Workbook wb = new XSSFWorkbook()
CreationHelper createHelper = wb.getCreationHelper()
Sheet sheet = wb.createSheet("Missing Info and Redraw Cases")

Row header = sheet.createRow((short) 0)
def headerTexts = ["Case ID", "Kit Barcode", "Clinic", "Redraw Reason", "GA", "Collection Date", "Blood Volume"]
headerTexts.eachWithIndex { headerText, colCount -> header.createCell(colCount).setCellValue(headerText) }

receivedKits.sort { a, b -> a.caseFile.id.compareTo(b.caseFile.id) }.eachWithIndex { pk, rowCount ->
  row = sheet.createRow((short) rowCount + 1)
  [pk.caseFile.id,
  pk.barcode,
  pk.caseFile.clinic?.name,
  pk.receipts.collect { k, v -> v.redrawReason?.name }.findAll { it != null && it != "" }.join(", "),
  pk.receipts.find { k, v -> v.redrawReason?.name == "npt_lowGestationalAge" } || pk.computedGestationalAge == null ? 
      pk.computedGestationalAge == null ? "MISSING" : String.format("%dw%dd", (pk.computedGestationalAge/7).longValue(), (pk.computedGestationalAge%7).longValue()) : "",
  pk.receipts.find { k, v -> v.redrawReason?.name == "npt_sampleCollectionDateTooOld" } ?
      pk.samples.findAll { pk.caseFile.getFamilyPosition(it) == com.natera.lims.datamodel.ivf.FamilyPosition.patient }.collect { "${it.barcode}: ${new SimpleDateFormat(''yyyy-MM-dd'').format(it.collectionDate)}" }.join(", ") : "",
  pk.receipts.find { k, v -> v.redrawReason?.name == "npt_shortDraw" } ?
      pk.samples.findAll { pk.caseFile.getFamilyPosition(it) == com.natera.lims.datamodel.ivf.FamilyPosition.patient }.collect { "${it.barcode}: ${it.bloodVolume}" }.join(", ") : "",
  ].eachWithIndex { data, colCount -> row.createCell(colCount).setCellValue(data) }   
}


headerTexts.eachWithIndex { c,i-> sheet.autoSizeColumn((short) i) }

ByteArrayOutputStream out = new ByteArrayOutputStream()
wb.write(out)
secureEmailSender.send(java.util.Arrays.asList(toAddresses), String.format("%d Kits Received for %tD", receivedKits.size(), theDay), "", "received-cases-${new SimpleDateFormat(''yyyy-MM-dd'').format(theDay)}.xlsx", out.toByteArray(), false)'
WHERE id = 10;

UPDATE `prodlims`.`script`
SET code = 'import net.genesecurity.ivf.job.MatlabJob
import com.natera.lims.datamodel.ivf.FamilyPosition;
import com.natera.lims.datamodel.ivf.prod.IlluminaArray;
import com.natera.lims.datamodel.ivf.prod.IlluminaArrayType;
import com.natera.lims.datamodel.ivf.report.VariationEntry;
import com.natera.lims.datamodel.ivf.prod.VariationInfo;
import net.genesecurity.agentmanager.api.JobEntry;
import com.natera.lims.datamodel.ivf.Subject;

def matlabJob = _ctx.getBean("matlabJob", [MatlabJob.getUniqueName("C" + casefileid, MatlabJob.CNC_JOB_SUFFIX)] as Object[])

def cf = caseFileDAO.get(casefileid as Long);

matlabJob.caseFile = cf;

familyPositions.each { FamilyPosition fp -> 
    List<IlluminaArray> validatedArrays = cf.family.getMember(fp, true).getValidatedArrays(IlluminaArrayType.DEFAULT_ARRAY_TYPE)
    if (validatedArrays == null || validatedArrays.size() == 0) {
        throw new RuntimeException("No validated arrays for family position " + fp)
    }
    matlabJob.addArray(validatedArrays[0]) 
}

childSubjectNames.each { String child -> 
    Subject childSubject = cf.family.getChildMember(child)
    if (childSubject == null) {
        // If string doesn''t yield a subject, maybe it''s a sample barcode
        childSubject = sampleDAO.getByBarcode(child)?.subject
    }
    if (childSubject == null) {
       throw new RuntimeException("Child member/sample " + child + " not found")
    }
    
    List<IlluminaArray> validatedArrays = childSubject.getValidatedArrays(IlluminaArrayType.DEFAULT_ARRAY_TYPE)
    if (validatedArrays == null || validatedArrays.size() == 0) {
       throw new RuntimeException("No validated arrays for child member/sample " + child)
    }
    matlabJob.addTargetArray(validatedArrays[0]) 
}

if (useSperm) {
  cf.getValidatedSpermArrays().each { IlluminaArray array -> matlabJob.addSpermArray(array) }
}

matlabJob.variationEntries.each { VariationEntry ve -> 
  ve.measurementMethodVariationInfos.each { VariationInfo vi -> vi.allowBlastomeres = true }
  ve.amptargetVariationInfos.each { VariationInfo vi -> vi.allowBlastomeres = true }
}


matlabJob.createJobDirectory()
matlabJob.createInitFile()
matlabJob.createJobFiles()
matlabJob.createJobInfoFile()

def jobEntry = agentManager.createJob(matlabJob.getJobRunCommand(), matlabJob.getJobDirectory().getName(), matlabJob.getJobName(), null, JobEntry.JobType.PGD_WITH_POH, null);

println "Job ${jobEntry.id} created."
println "<a href=''http://lims.natera.local/prod-lims/app/jobs''>View Jobs Page</a>"
println "<a href=''http://lims.natera.local/handcaller-1.6.2/job/overview?job=${matlabJob.jobDirectory.name}''>View Handcaller Page (available after job is complete)</a>"
matlabJob.jobDirectory.name
'
WHERE id = 14;

UPDATE `prodlims`.`script`
SET code = '
def casefile = caseFileDAO.get(caseFileId)
def handcallresult = handcallResultId ? nptHandcallResultDAO.get(handcallResultId) : null
if (casefile == null && handcallresult != null && handcallresult.initFiles.size() > 0) casefile = handcallresult.initFiles.get(0).caseFile
def parentkit = (casefile == null ? parentKitDAO.getByBarcode(parentKitBarcode) : casefile.parentKits.find { it.barcode == parentKitBarcode } ?: (casefile.parentKits.size() == 1 ? casefile.parentKits.get(0) : null))

if (casefile == null) throw new RuntimeException("Could not get casefile")

def gcnote = null
if (customResultText || gcNoteText) {
  gcnote = new com.natera.lims.datamodel.npt.report.GCNote()
  gcnote.customSummary = customResultText
  if (customResultText) gcnote.customSummaryUsed = true
  if (gcNoteText) gcnote.note = gcNoteText
}
println "Generating report for case ${casefile.id} - ${casefile.clinic?.name}, " + 
	(handcallresult != null ? "HCR ${handcallresult.id}, " : "") + 
	(parentkit != null ? "ParentKit ${parentkit.id} " : "") + 
	(customResultText || gcNoteText ? "with custom summary text ''${customResultText}'' and GC note text ''${gcNoteText}" : "")

nptReportGenerator.generateFinalReport(casefile, net.genesecurity.ivf.report.service.NptReportGenerator.ReportSource.getInstance(handcallresult ?: parentkit), gcnote, null)
if (setCaseState) {
  casefile.state = com.natera.lims.datamodel.ivf.prod.LimsState.valueOf(setCaseState)
  caseFileDAO.saveOrUpdate(casefile)
  println "Changed case state to ''${setCaseState}''"
}
'
WHERE id = 17;

UPDATE `prodlims`.`script`
SET code = '
import com.natera.lims.datamodel.ivf.prod.*
import com.natera.lims.datamodel.core.*
import com.natera.lims.datamodel.ivf.*

def caseFile = new CaseFile(currentUserBean.currentUser)
caseFile.testType = TestType.RESEARCH

caseFile.thirdPartyId = familyId

samples.each { String sampleDefinition ->
  def (familyPosition, name, barcode) = sampleDefinition.split('':'')
  def subject = null
  if (familyPosition == "child") {
    subject = caseFile.family.getChildMember(name, true)
  } else {
  	subject = caseFile.family.getMember(FamilyPosition.valueOf(familyPosition), true)
  }
  Sample sample = new ResearchSample()
  sample.subject = subject
  subject.samples.add(sample)
  sample.barcode = barcode
  sample.sampleType = sampleTypeDAO.getByName("cell_line")
  
  subject.name = name
  subject.lastname = name
  
  sampleDAO.save(sample)
  subjectDAO.save(subject)
}

caseFileDAO.save(caseFile)

return "Created LIMS case ${caseFile.id} for Coriell family ${familyId}"
'
WHERE id = 18;

UPDATE `prodlims`.`script`
SET code = '
def prefix="hold_report"
def body="Cases with ''hold'' category which are not closed"

sql = """select casefile.id, cat.name, casefile.opened, testtype, organization.id, organization.name, p.barcode, p.received
from casefile 
join casefile_category cc on casefile.id = cc.CaseFile_id 
join category cat on cat.id = cc.categories_id 
left join organization ON organization.id = casefile.clinic_id
left join parentkit p on casefile.id = p.casefile_id
where cat.name like ''%hold%'' and closed is null"""

dateString= (new Date()).format(''yyyy-MM-dd'')

wb = sqlReportService.createWorkbook("${prefix}_${dateString} ",sql,true)
sqlReportService.emailWorkbook(java.util.Arrays.asList(recipients),"${prefix}_${dateString}", body, "${prefix}_${dateString}.xlsx", wb)
'
WHERE id = 21;

UPDATE `prodlims`.`script`
SET code = '
def sql = """
select 
casefile.testtype as test_type, 
casefile.id as accession, 
organization.id as clinic_id, 
organization.name as clinic_name, 
casefile.opened as case_opened, 
casefile.closed as case_closed, 
max(report_report.dateofreport) as last_report_date, 
user.email as ``user``, 
min(note.created) as first_note, 
max(note.created) as last_note 
from casefile join casefile_note on casefile_note.CaseFile_id = casefile.id join note on casefile_note.notes_id = note.id 
join user on user.id = note.user_id 
join organization on organization.id = casefile.clinic_id 
left join report_report on report_report.casefile_id = casefile.id 
where 
casefile.testtype in (''SINGLE_GENE_PLUS_21'', ''PRODUCT_1_2'', ''PRODUCT_1'') 
and user.email in (${users.collect { "''" + it + "''" }.join(", ") })
group by casefile.id, user.id 
order by user.id, casefile.testtype, casefile.id
"""
sqlReportService.emailWorkbook([toAddress], "PGD/PGS Cases Worked Report", "PGD/PGS Cases Worked Report, generated ${new Date()}", "pgd_pgs_cases_worked_${new Date().format("yyyy_MM_dd_hhmm")}.xls", 
                               sqlReportService.createWorkbook("Cases Worked", sql, true))'
WHERE id = 25;

UPDATE `prodlims`.`script`
SET code = '
/*
 ENG-4107: Added kit barcode and received date, and TAT for POC and Paraffin POC cases. - JD 10/15
 */

import com.natera.lims.datamodel.ivf.prod.ParentKit
import com.natera.lims.datamodel.ivf.prod.CaseFile
import com.natera.lims.service.npt.NPTParentKitValidator
import org.apache.poi.xssf.usermodel.XSSFWorkbook
import org.apache.poi.ss.usermodel.*
import com.natera.lims.datamodel.core.TestType
import com.natera.lims.service.horizon.support.HorizonParentKitValidator

def holidays = holidayService.getHolidayList(holidayDAO.getHolidays())

def today = new Date()
def subject = "Case Followup Report ${today.format("MM/dd/yyyy")}"
def body = "Case followup report from LIMS for ${today.format("MM/dd/yyyy")} attached."
def filename = "followup_report_${today.format("MM_dd_yyyy")}.xlsx"

def parentKits = new HashSet()

//NPT cases
parentKits.addAll(parentKitDAO.getAwaitingInfoPanoramaKits())
parentKits.addAll(parentKitDAO.getSupportFollowupPanoramaKits())

//CS2 cases
parentKits.addAll(parentKitDAO.getAwaitingInfoHorizonKits())
parentKits.addAll(parentKitDAO.getSupportFollowupHorizonKits())

def holdCategories = categoryGroupDAO.getByName("Hold Reasons").getCategories()

def caseFiles = new HashSet()
caseFiles.addAll(caseFileDAO.session.createQuery("select distinct cf from CaseFile cf join cf.categories cat where (cat.name like ''%hold%'' or cat in (:holdCategories))" +
        " and cf.closed is null and cf.testType not in (''RESEARCH'', ''NPT'', ''CARRIER_SCREENING_2'')")
        .setParameterList("holdCategories", holdCategories)
        .list())

/* Output:
All Cases:
- Case ID
- White glove
- Clinic name
- Clinic ID
- Region
- Test Type
- Missing Info Items for Kit (Panorama Only)
- Case Note
- Case Categories
- Case Opened Date
Panorama Only:
- Kit Barcode
- Kit State
- Kit Support State
- Kit TAT
- Kit Received Date

*/
def header = [''Case ID'', ''Clinic Case ID'', ''White Gloved'', ''Clinic Name'', ''Clinic ID'', ''Region'', ''Test Type'', ''Missing Info'', ''Dashboard Note'', ''Case Categories'', ''Case Opened'',
              ''Kit Barcode'', ''Kit State'', ''Kit TAT'', ''Kit Received Date'', ''LIMS link'', ''Orders link'']

def output = []
parentKits.each { pk ->
    if (caseFiles.contains(pk.caseFile)) caseFiles.remove(pk.caseFile)
    def validator = (pk.caseFile?.testType.isNPT()) ? NPTParentKitValidator.class : HorizonParentKitValidator.class
    output.add([pk.caseFile?.id,
                pk.caseFile?.thirdPartyId ?: "",
                pk.caseFile?.whitegloved ? "YES" : "",
                pk.caseFile?.clinic?.name,
                pk.caseFile?.clinic?.id,
                pk.caseFile?.clinic?.territory?.region,
                pk.caseFile?.testType?.name,
                _ctx.getBean(validator).getMissingInformation(pk)?.allErrors?.collect { it.defaultMessage }?.join("\n"),
                pk.caseFile?.dashboardNote,
                pk.caseFile?.dashboardCategories?.collect { it.name }?.join("\n"),
                pk.caseFile?.opened?.format("MM/dd/yyyy"),
                pk.barcode,
                pk.state?.getName(),
                holidayService.getTurnaroundTimeDays(pk.received, today, holidays),
                pk.received?.format("MM/dd/yyyy")])
}

caseFiles.each { cf ->

    def isPOCCase = cf.testType.isPOC();
    def parentKitBarcodes = "";
    def parentKitTATs = "";
    def parentKitReceivedDates = "";
    if (isPOCCase) {
        def pocKits = cf.getParentKits();
        pocKits.each {
            parentKitBarcodes += it.barcode + "\n";
            if (it.received != null) {
                parentKitTATs += holidayService.getTurnaroundTimeDays(it.received, today, holidays) + "\n"
                parentKitReceivedDates += it.received.format("MM/dd/yyyy").toString() + "\n"
            }
        }
    }


    output.add([cf.id,
                cf.thirdPartyId ?: "",
                cf.whitegloved ? "YES" : "",
                cf.clinic?.name,
                cf.clinic?.id,
                cf.clinic?.territory?.region,
                cf.testType?.name,
                null,
                cf.dashboardNote,
                cf.dashboardCategories?.collect { it.name }?.join("\n"),
                cf.opened?.format("MM/dd/yyyy"),
                (isPOCCase) ? parentKitBarcodes : null,
                null,
                (isPOCCase) ? parentKitTATs : null,
                (isPOCCase) ? parentKitReceivedDates : null])
}

output = output.sort { a, b -> a[2] <=> b[2] ?: a[0] <=> b[0] }
output.add(0, header)
def maxColumnCount = 0

def wb = new XSSFWorkbook()
def sheet = wb.createSheet("Support Followup Report")

output.eachWithIndex { r, i ->
    def row = sheet.createRow((short) i)
    r.eachWithIndex { c, j ->
        def cs = wb.createCellStyle()
        cs.setWrapText(true)
        def cell = row.createCell(j)
        cell.setCellValue(c == null ? "" : c)
        cell.setCellStyle(cs)
    }
    if (i > 0) {
        def cs = wb.createCellStyle()
        def hlink_font = wb.createFont()
        hlink_font.setUnderline(Font.U_SINGLE)
        hlink_font.setColor(IndexedColors.BLUE.getIndex())
        cs.setFont(hlink_font)

        def limsLinkCell = row.createCell(r.size())
        def limsLink = wb.creationHelper.createHyperlink(Hyperlink.LINK_URL);
        limsLink.setAddress("http://lims/prod-lims/app/case/view?id=${r[0]}");
        limsLinkCell.setCellValue("LIMS/LIMS Case")
        limsLinkCell.setHyperlink(limsLink);
        limsLinkCell.setCellStyle(cs);

        def ordersLinkCell = row.createCell(r.size() + 1)
        def ordersLink = wb.creationHelper.createHyperlink(Hyperlink.LINK_URL);
        ordersLink.setAddress("http://lims/extranet/app/case/show?caseId=${r[0]}");
        ordersLinkCell.setCellValue("LIMS/Orders Case")
        ordersLinkCell.setHyperlink(ordersLink);
        ordersLinkCell.setCellStyle(cs);
    }

    if (r.size() + 2 > maxColumnCount) maxColumnCount = r.size() + 2
}

(0 .. maxColumnCount - 1).each { sheet.autoSizeColumn(it) }

def outStream = new ByteArrayOutputStream()
try {
    wb.write(outStream)
    secureEmailSender.send(toAddresses as List, subject as String, body as String, filename as String, outStream.toByteArray(), false as Boolean)
} finally {
    outStream.close()
}

return "Sent to ${toAddresses.join(", ")}"

'
WHERE id = 28;

UPDATE `prodlims`.`script`
SET code = 'import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.NumberToTextConverter;
import org.apache.poi.ss.usermodel.DateUtil;

import java.io.IOException;
import javax.xml.datatype.DatatypeFactory;
import java.text.*;
import com.natera.lims.datamodel.ivf.*;
import com.natera.lims.datamodel.ivf.prod.*;


def inputFile = "/data/prod/OPS/"+file;

def YES = PaternityFields.QuestionnaireChoice.Y
def NO = PaternityFields.QuestionnaireChoice.N

//def sdf = new SimpleDateFormat("MM/dd/yyyy");

FileInputStream f = new FileInputStream(new File(inputFile));
//DataFormatter  dataFormatter = new DataFormatter();
Workbook workbook = WorkbookFactory.create(f);

Sheet sheet = workbook.getSheetAt(0);

int rowNum = sheet.getLastRowNum() + 1;

int colNum = sheet.getRow(0).getLastCellNum();

for (int i = 1; i < rowNum; i++) {
    // Get the row
    Row row = sheet.getRow(i);
    
	def thirdPartyId = null
	
	if (row.getCell(0).getCellType() == Cell.CELL_TYPE_NUMERIC) {
		thirdPartyId = NumberToTextConverter.toText(row.getCell(0).getNumericCellValue())        
	} else {
		thirdPartyId = row.getCell(0).toString().trim()		
	}

    if (thirdPartyId != null && !thirdPartyId.isEmpty()) {

        def cf = caseFileDAO.getSession().createQuery("from CaseFile cf where cf.thirdPartyId = :third")
                .setParameterList("third",thirdPartyId)
                .uniqueResult();				

        if (cf != null) {
             
			if (row.getCell(2).getCellType() == Cell.CELL_TYPE_NUMERIC)  {
				if (DateUtil.isCellDateFormatted(row.getCell(2))) {
					cf.paternityFields.pregnant = YES
				}			
			} 
 	        
            def reportGender = row.getCell(3).getStringCellValue().trim()
            if (!reportGender.isEmpty()) {
                cf.paternityFields.reportGender = reportGender.equalsIgnoreCase("yes")? true : false    
            }
            
            //Maternal Weight
			if (row.getCell(4).getCellType() == Cell.CELL_TYPE_NUMERIC) {
				def maternalWeight = row.getCell(4).getNumericCellValue()
				if (maternalWeight > 0) {
					cf.paternityFields.maternalWeight = maternalWeight
				}
			}            
                 
            //Surrogate used
            def surrogateUsed = row.getCell(5).getStringCellValue().trim()
            if (!surrogateUsed.isEmpty()) {
                cf.paternityFields.surrogateUsed = surrogateUsed.equalsIgnoreCase("yes")? YES : NO    
            }
            
            //Egg Donor used
            def eggDonorUsed = row.getCell(6).getStringCellValue().trim()
            if (!eggDonorUsed.isEmpty()) {
                cf.paternityFields.eggDonorUsed = eggDonorUsed.equalsIgnoreCase("yes")? YES : NO    
            }
            
            //Multiple Pregnancy
            def multiplePregnancy = row.getCell(7).getStringCellValue().trim()
            if (!multiplePregnancy.isEmpty()) {
                cf.paternityFields.multiplePregnancy = multiplePregnancy.equalsIgnoreCase("yes")? YES : NO    
            }
            
            //Father sample
            def fatherSample = row.getCell(8).getStringCellValue().trim()
            if (!fatherSample.isEmpty()) {
                cf.paternityFields.fatherSample = fatherSample.equalsIgnoreCase("yes")? YES : NO     
            }
             
            def subject = cf.family.getMember(FamilyPosition.partner, false)

            //Partner Last Name
            def lastname = row.getCell(9).getStringCellValue().trim()
            if (!lastname.isEmpty()) {
                subject.lastname = lastname
            }

            //Partner First Name
            def firstname = row.getCell(10).getStringCellValue().trim()
            if (!firstname.isEmpty()) {
                subject.firstname = firstname
            }
            			
        } else  {
            println "Casefile does not exist for "+thirdPartyId
        }        
    } else {
        println "Third party field is missing"
    } 		
}
f.close(); '
WHERE id = 30;

UPDATE `prodlims`.`script`
SET code = 'def prefix = "Information Required for Billing Clinics"

def listOfClinics = clinicIds.toString().replace("[","").replace("]","")

def body = "For Billing purposes"

def sql = """select c.id as Accession_Id, c.testtype, s.collectiondate as Sample_Collection_Date, max(cnc.senton) as Final_report_sent_Date, c.clinic_id,  org.name
, p.firstname as Physician_FirstName, p.lastname as Physician_LastName, o.billtotype, group_concat(distinct cat.name) , c.skipxifin, c.submissiondate
from casefile c join family_subject fs
on c.family_id = fs.families_id join sample s
on fs.members_id = s.subject_id join casefile_category cc
on c.id = cc.CaseFile_id join category cat 
on cc.categories_id = cat.id left join casefile_cncreportshipmentrecord c_cnc
on c.id = c_cnc.CaseFile_id  left join cncreportshipmentrecord cnc
on c_cnc.cncreportshipmentrecords_id = cnc.id join organization_organizationpricingplan oo
on c.clinic_id = oo.Organization_id join organizationpricingplan o
on oo.organizationpricingplans_id = o.id join provider p
on c.physician_id = p.id join organization org
on c.clinic_id = org.id
where c.clinic_id in (${listOfClinics})
and s.sampletype_id = 20
group by c.id"""

wb = sqlReportService.createWorkbook("${prefix}",sql,true)
sqlReportService.emailWorkbook(java.util.Arrays.asList(recipients),"${prefix}", body, "${prefix}.xlsx", wb)'
WHERE id = 34;

UPDATE `prodlims`.`script`
SET code = 'def CF_ONLY = "CF_ONLY"

def caseFiles = caseFileDAO.getSession().createQuery("from CaseFile cf where cf.opened > curdate() and cf.testType = ''CARRIER_SCREENING''").list()

caseFiles.each { caseFile ->

def testTypes = caseFile.getSubTestTypes()

if (testTypes.size() == 1 && testTypes.iterator().next().toString().equals(CF_ONLY)) {

  println caseFile.id  

}}'
WHERE id = 35;

UPDATE `prodlims`.`script`
SET code = '
import com.natera.lims.service.disposal.*
import com.natera.lims.datamodel.npt.*
import org.apache.poi.xssf.usermodel.XSSFWorkbook

doNotDisposeResults = new HashSet([SampleDisposalStatus.DisposalResult.MUST_RETAIN,
                                   SampleDisposalStatus.DisposalResult.UNKNOWN])
highRiskPanoramaCalls = new HashSet([ResultCode.HIGH_RISK_RESULT, ResultCode.HIGH_RISK_WITH_SINGLE_CHROM_NO_CALL,
                                     ResultCode.ABNORMAL_RESULT_SINGLE_CHROM, ResultCode.SUSPECTED_MULTIPLE_GESTATION_OR_TRIPLOIDY, 
                                     ResultCode.SUSPECTED_XXX, ResultCode.SUSPECTED_XXY, ResultCode.SUSPECTED_XYY])
highRiskMicrodelCalls = new HashSet([MicrodelResultCode.HIGH_RISK_RESULT])

output = []

def void checkSampleForDisposal(def sample, def plateBarcode, def index) {
    def caseFile = sample.getRootSourceSample().getCaseFileByParentKit()
    if (caseFile == null) return;

    def disposalResult = sampleDisposalService.runSampleRetentionPolicySet(sample).getDisposalResult()
    if (doNotDisposeResults.contains(disposalResult)) {
        output.add([caseFile.id, caseFile.testType.toString(), sample.barcode, findPosition(plateBarcode, index), disposalResult.toString(), ""])

        // check for high risk calls
    } else {
        def nptReport = caseFile.getLatestCncReportShipmentRecord()?.nptReport
        if (nptReport != null) {
            def nptHandcallResultCode = nptReport.nptHandcallResult?.resultCode
            def nptHandcallMicrodelResultCode = nptReport.nptHandcallMicrodelResult?.resultCode
            if (nptHandcallResultCode != null && highRiskPanoramaCalls.contains(nptHandcallResultCode)) {
                output.add([caseFile.id, caseFile.testType.toString(), sample.barcode, findPosition(plateBarcode, index), "", nptHandcallResultCode.toString()])
            } else if (caseFile.getMicrodelPanel().isMicrodeletionsOrdered() && nptHandcallMicrodelResultCode != null
                    && highRiskMicrodelCalls.contains(nptHandcallMicrodelResultCode)) {
                output.add([caseFile.id, caseFile.testType.toString(), sample.barcode, findPosition(plateBarcode, index), "", nptHandcallMicrodelResultCode.toString()])
            }
        }
    }
}

def String findPosition(def plateBarcode, def index) {
    return (index != null) ? plateBarcode + "_" + indexToLocation(index) + "-DNA" : ""
}

def String indexToLocation(int i) {
    int rows = 8
    if (rows == 0) rows = 1
    StringBuilder ret = new StringBuilder()
    ret.append((char) (((int) ''A'') + (i % rows)))
    int position = ((int)(i / rows)) + 1
    if (position < 10) ret.append(0)
    ret.append(position)
    return ret.toString()
}

println plateBarcodes

/* Output:
Case
Test Type
Sample Barcode
Position
Disposal Status
High Risk Call
*/

def subject = "R&D Sample Disposal Report"
def body = "R&D sample disposal report from LIMS attached."
def filename = "sample_disposal_report.xlsx"

def header = [''Case'', ''Test Type'',''Barcode'', ''Position'',''Disposal Status'', ''High Risk Call'']

plateBarcodes.each { plateBarcode ->
    def consolidationPlate = consolidationPlateDAO.getByBarcode(plateBarcode)
    def lib2Plate = lib2PlateDAO.getByBarcode(plateBarcode)
    if (consolidationPlate != null) {
        def samples = consolidationPlate.getSampleList()
        samples.each { sample ->
            checkSampleForDisposal(sample, consolidationPlate.barcode, null)
        }
    } else if (lib2Plate != null) {
        def samplesMap = lib2Plate.getSamples()
        for (def entry : samplesMap.entrySet()) {
            checkSampleForDisposal(entry.getValue(), lib2Plate.barcode, entry.getKey())
        }
    }
}

output.add(0, header)

def wb = new XSSFWorkbook()
def sheet = wb.createSheet("R&D Sample Disposal Report")

output.eachWithIndex { r, i ->
    def row = sheet.createRow((short) i)
    r.eachWithIndex { c, j ->
        def cs = wb.createCellStyle()
        cs.setWrapText(true)
        def cell = row.createCell(j)
        cell.setCellValue(c == null ? "" : c)
        cell.setCellStyle(cs)
    }
}

def outStream = new ByteArrayOutputStream()
try {
    wb.write(outStream)
    secureEmailSender.send(toAddresses as List, subject as String, body as String, filename as String, outStream.toByteArray(), false as Boolean)
} finally {
    outStream.close()
}
'
WHERE id = 36;

UPDATE `prodlims`.`script`
SET code = '
import com.natera.lims.datamodel.ivf.FamilyPosition
import org.apache.poi.xssf.usermodel.XSSFWorkbook
import com.natera.lims.datamodel.ivf.prod.*;


/*
 * 6/26/2015 Edited by Nathan to get Lib2 plate locations
 * 
 */
output = []

def header = ["Case", "Sample", "FamilyPosition", "StorageName/Lib2Plate", "IndexLocation"]
output.add(header)

caseFileIds.each { caseFileId ->

    def caseFile = caseFileDAO.get(caseFileId)
    if (caseFile != null) {
        def motherSamples = caseFile.family?.getMember(FamilyPosition.patient)?.samples
        def motherDNASamples = (motherSamples != null) ? filterPrepSamples(motherSamples, SampleType.DNA) : null
        addSamplesToOutput(caseFileId, FamilyPosition.patient.formName, motherSamples)
        addSamplesToOutput(caseFileId, FamilyPosition.patient.formName, motherDNASamples)

        def fatherSamples = caseFile.family?.getMember(FamilyPosition.partner)?.samples
        def fatherDNASamples = (fatherSamples != null) ? filterPrepSamples(fatherSamples, SampleType.DNA) : null
        addSamplesToOutput(caseFileId, FamilyPosition.partner.formName, fatherSamples)
        addSamplesToOutput(caseFileId, FamilyPosition.partner.formName, fatherDNASamples)

        def childSamples = caseFile.family?.getMember(FamilyPosition.child)?.samples
        def childDNASamples = (childSamples != null) ? filterPrepSamples(childSamples, SampleType.DNA) : null
        addSamplesToOutput(caseFileId, FamilyPosition.child.formName, childSamples)
        addChildDNASamplesToOutput(caseFileId, FamilyPosition.child.formName, childDNASamples)
    }

}

def filterPrepSamples(def samples, def sampleType) {
    def returnSamples = new HashSet<Sample>()
    samples.each { sample ->
        def prepSamples = sample.prepSamples
        prepSamples.each { prepSample ->
            if (prepSample.sampleType.name.equals(sampleType)) {
                returnSamples.add(prepSample)
            }
        }
    }
    return returnSamples
}

def addSamplesToOutput(def caseFileId, def familyPosition, def samples) {
    if (samples != null) {
        samples.each { sample ->
            def locations = sampleContainerDAO.getStorageLocations(sample)
            if (locations.size() != 0) {
                locations.each { location ->
                    def container = location.get("container")
                    def indexLocation = location.get("indexLocation")
                    output.add([caseFileId, sample.barcode, familyPosition, container.barcode, indexLocation])
                }
            } else {
                output.add([caseFileId, sample.barcode, familyPosition, "", ""])
            }
        }
    }
}

/* Find Lib2 plates for child DNA samples */
def addChildDNASamplesToOutput(def caseFileId, def familyPosition, def samples) {
    if (samples != null) {
        samples.each { sample ->
            def lib2Plates = lib2PlateDAO.getPlatesBySample(sample)
            lib2Plates.each { lib2Plate ->
                def wells = lib2Plate.wells
                def position = null
                for (def entry : wells.entrySet()) {
                    def pws = entry.getValue()
                    if (pws.sample == sample) {
                        position = entry.getKey()
                    }
                }

                position = indexToLocation(position)
                output.add([caseFileId, sample.barcode, familyPosition, lib2Plate.barcode, position])

            }
			if(!lib2Plates) {
			  def ss = sample.completedSequencingSamples[0]
			  if(ss) {
			    def plates = ss.clarityPlateMetaData
				for(def plate : plates) {
				  // if plate name ends in -LIB2
				  if(plate.plateBarcode.endsWith(''-LIB2'')) {
				    output.add([caseFileId, sample.barcode, familyPosition, plate.plateBarcode, plate.wellPosition.replace('':'', '''')])
				    break
				  }
				}
			  }
			}
        }
    }
}

def String indexToLocation(int i) {
    int rows = 8
    if (rows == 0) rows = 1
    StringBuilder ret = new StringBuilder()
    ret.append((char) (((int) ''A'') + (i % rows)))
    int position = ((int) (i / rows)) + 1
    if (position < 10) ret.append(0)
    ret.append(position)
    return ret.toString()
}

/* Output:
Case
Sample Barcode
Family Position
Container Name / Lib2Plate
Index Location
*/

def subject = "Case Sample Locations Report"
def body = "Case sample locations report from LIMS attached."
def filename = "case_sample_locations_report.xlsx"

def wb = new XSSFWorkbook()
def sheet = wb.createSheet("R&D Sample Disposal Report")

output.eachWithIndex { r, i ->
    def row = sheet.createRow((short) i)
    r.eachWithIndex { c, j ->
        def cs = wb.createCellStyle()
        cs.setWrapText(true)
        def cell = row.createCell(j)
        cell.setCellValue(c == null ? "" : c)
        cell.setCellStyle(cs)
    }
}

def outStream = new ByteArrayOutputStream()

try {
    wb.write(outStream)
    secureEmailSender.send(toAddresses as List, subject as String, body as String, filename as String, outStream.toByteArray(), false as Boolean)
} finally {
    outStream.close()
}

'
WHERE id = 37;

UPDATE `prodlims`.`script`
SET code = '
import com.natera.lims.datamodel.core.TestType
import com.natera.lims.datamodel.ivf.FamilyPosition
import com.natera.lims.datamodel.ivf.prod.Sample
import com.natera.lims.datamodel.ivf.prod.SampleType
import org.apache.poi.xssf.usermodel.XSSFWorkbook

def date = Date.parse(''yyyy-MM-dd'', receivedDate)

def parentKits = parentKitDAO.getSession()
        .createQuery(
        "select distinct pk from ParentKit pk " +
                "inner join fetch pk.caseFile caseFile " +
                "where DATE(pk.received) = :date " +
                "and caseFile.testType = :testType ")
        .setParameter("date", date)
        .setParameter("testType", TestType.NPT)
        .list();

def output = []
def header = ["Case", "Kit", "Kit Received", "Genomic Mom DNA Sample", "Prepped", "Star1 Plate/s",
              "Plasma Sample", "Plasma Isolation Complete Time", "cfDNA Sample", "Library Plate/s"]

output.add(0, header)

parentKits.each { parentKit ->

    def caseFile = parentKit.caseFile
    def parentKitSamples = parentKit.samples

    def addedSamples = new HashSet<Sample>()

    if (caseFile != null) {
        def motherSamples = caseFile.family?.getMember(FamilyPosition.patient)?.samples

        motherSamples?.each { motherSample ->

            if (parentKitSamples.contains(motherSample)) {

                def motherDNASamples = filterPrepSamples(motherSample, SampleType.DNA)
                motherDNASamples?.each { motherDNASample ->

                    def plasmaSamples = filterPrepSamples(motherSample, SampleType.PLASMA)
                    plasmaSamples?.each { plasmaSample ->

                        if (!addedSamples.contains(plasmaSample)) {

                            def childDNASamples = filterPrepSamples(plasmaSample, SampleType.DNA)
                            childDNASamples?.each { childDNASample ->

                                def star1PlateBarcodes  = combineBarcodes(getStar1Plates(motherDNASample))
                                def libPlateBarcodes = combineBarcodes(getLibPlates(childDNASample))
                                def logRecord = getAuditLogRecordForPlasmaVolume(plasmaSample)

                                output.add([caseFile.id, parentKit.barcode, parentKit.received.toString(), motherDNASample.barcode, motherDNASample.prepped.toString(), star1PlateBarcodes,
                                            plasmaSample.barcode, (logRecord != null) ? logRecord.timestamp.toString() : "null" , childDNASample.barcode, libPlateBarcodes])

                                addedSamples.add(motherDNASample)
                                addedSamples.add(plasmaSample)
                                addedSamples.add(childDNASample)

                            }

                        } else if (!addedSamples.contains(motherDNASample)) {
                            def star1PlateBarcodes  = combineBarcodes(getStar1Plates(motherDNASample))
                            output.add([caseFile.id, parentKit.barcode, parentKit.received.toString(), motherDNASample.barcode, motherDNASample.prepped.toString(), star1PlateBarcodes,
                                        "", "" , "", ""])

                        }
                    }
                }
            }
        }

        if (addedSamples.isEmpty()) {
            output.add([caseFile.id, parentKit.barcode, parentKit.received.toString(), "", "", "", "", "", "", ""])
        }
    }
}

def filterPrepSamples(def sample, def sampleType) {
    def returnSamples = new HashSet()
    def prepSamples = sample.prepSamples
    prepSamples.each { prepSample ->
        if (prepSample.sampleType.name.equals(sampleType)) {
            returnSamples.add(prepSample)
        }
    }
    return returnSamples
}

def getStar1Plates(def sample) {
    def star1Plates = star1PlateDAO.getSession()
            .createQuery("select distinct plate from Star1Plate plate join " +
            "plate.wells well " +
            "join well.sample sample " +
            "where sample = :sample").setParameter("sample", sample)
            .list();
    return star1Plates
}

def getLibPlates(def sample) {
    def libPlates = libPlateDAO.getSession()
            .createQuery("select distinct plate from LibPlate plate join " +
            "plate.wells well " +
            "join well.sample sample " +
            "where sample = :sample").setParameter("sample", sample)
            .list();
    return libPlates
}

def getAuditLogRecordForPlasmaVolume(def entity) {
    def auditLogRecords = auditLogRecordDAO.getSession()
            .createQuery("select distinct record from AuditLogRecord record " +
            "where record.entityId = :entityId and record.entityName = :entityName " +
            "and record.entityAttribute = :entityAttribute and record.message = :message " +
            "and record.newValue IS NOT NULL order by record.id desc ")
            .setParameter("entityId", entity.getId())
            .setParameter("entityName", entity.getClass().getSimpleName())
            .setParameter("entityAttribute", "plasmaVolume")
            .setParameter("message", "update")
            .list();

    if (auditLogRecords.size() > 0) return auditLogRecords[0]
    return null

}

def combineBarcodes(def list) {
    def str = ""
    int count = 0;
    list.each {
        count++
        def isLastItem = (count == list.size())
        str += (isLastItem) ? " " + it.barcode : " " + it.barcode + ", "
    }
    return str
}

/* Output:
Case
Kit
Kit Received
Genomic Mom DNA Sample
Prepped
Star1 Plate/s
Plasma Sample
Plasma Isolation Complete Time
cfDNA Sample
Library Plate/s
*/

def subject = "Sample Extraction Report on " + receivedDate
def body = "Sample extraction report on " + receivedDate + " from LIMS attached."
def filename = "sample_disposal_report_" + receivedDate + ".xlsx"

def wb = new XSSFWorkbook()
def sheet = wb.createSheet("Sample Extraction Report")

output.eachWithIndex { r, i ->
    def row = sheet.createRow((short) i)
    r.eachWithIndex { c, j ->
        def cs = wb.createCellStyle()
        cs.setWrapText(true)
        def cell = row.createCell(j)
        cell.setCellValue(c == null ? "" : c)
        cell.setCellStyle(cs)
    }
}

def outStream = new ByteArrayOutputStream()
try {
    wb.write(outStream)
    secureEmailSender.send(toAddresses as List, subject as String, body as String, filename as String, outStream.toByteArray(), false as Boolean)
} finally {
    outStream.close()
}

//date format: yyyy-MM-dd

'
WHERE id = 38;

UPDATE `prodlims`.`script`
SET code = '
import org.apache.poi.xssf.usermodel.XSSFWorkbook
import org.joda.time.*;

output = []

def header = ["Case", "Received Date", "ParentKit", "SubTestType", "ResultReceived","Patient_DateOfBirth"]
output.add(header)

def sDate = Date.parse(''yyyy-MM-dd'', startDate)

def parentKits;

if (onlyThisDay) {
    parentKits = parentKitDAO.session.createQuery(
            "select distinct parentKit from ParentKit parentKit left join fetch parentKit.outboundOrderStatuses o" +
                    " where DATE(o.resultReceived) = :date")
            .setDate("date", sDate).list()
} else {
    parentKits = parentKitDAO.session.createQuery(
            "select distinct parentKit from ParentKit parentKit left join fetch parentKit.outboundOrderStatuses o" +
                    " where o.resultReceived >= :date")
            .setDate("date", sDate).list()
}

parentKits.each { pk ->
    pk.outboundOrderStatuses.each { subTestType, outboundOrderStatus ->
        if (outboundOrderStatus.resultReceived >= sDate) {
            LocalDate date = new LocalDate(pk.received)
            output.add([pk.caseFile.id, date.toString(), pk.barcode, subTestType.toString(), outboundOrderStatus.resultReceived.toString(), pk.caseFile.getPatient().dateOfBirth.toString()])
        }
    }
}


/* Output:
Case
Received Date
ParentKit
SubTestType
ResultReceived
Patient_DateOfBirth
*/

def subject = "Received HL7 Results for Carrier Sreening"
def body = "Received HL7 results for Carrier Sreening from LIMS attached."
def filename = "received_hl7_result_report.xlsx"

def wb = new XSSFWorkbook()
def sheet = wb.createSheet("Received HL7 Results Report")

output.eachWithIndex { r, i ->
    def row = sheet.createRow((short) i)
    r.eachWithIndex { c, j ->
        def cs = wb.createCellStyle()
        cs.setWrapText(true)
        def cell = row.createCell(j)
        cell.setCellValue(c == null ? "" : c)
        cell.setCellStyle(cs)
    }
}

def outStream = new ByteArrayOutputStream()

try {
    wb.write(outStream)
    secureEmailSender.send(toAddresses as List, subject as String, body as String, filename as String, outStream.toByteArray(), false as Boolean)
} finally {
    outStream.close()
}

//startDate''s format: yyyy-MM-dd
'
WHERE id = 39;

UPDATE `prodlims`.`script`
SET code = '
/*
 * CHANGE LOG:
 * 5/18/2015 - jsheena - added support for missing ICD9 category
 */
 
/*
 * CHANGE LOG:
 * 6/26/2015 - dchettupuzha - added support for 7 Hold reasons (Verify test order,Identifier discrepancy,Sample discrepancy,Missing father sample,Non-readable,No HL7 case - creating HL7,Other hold reason)
 */

/*
 * CHANGE LOG:
 * 7/1/2015 - dchettupuzha - Moved 7 hold reasons columns to end
 */

/*
 * CHANGE LOG:
 * 9/28/2015 - jdavid - change "No ICD9" category''s name to "No ICD Code"
 */

/*
 * CHANGE LOG:
 * 12/11/2015 - dparsons - only report on CS2 cases where the kit state or support state requires follow-up
 *              (see pull request on ENG-4127)
 */

import com.natera.lims.service.horizon.support.HorizonParentKitValidator
import com.natera.lims.service.npt.NPTParentKitValidator
import org.apache.poi.ss.usermodel.Font
import org.apache.poi.ss.usermodel.Hyperlink
import org.apache.poi.ss.usermodel.IndexedColors
import org.apache.poi.xssf.usermodel.XSSFWorkbook

def holidays = holidayService.getHolidayList(holidayDAO.getHolidays())

def today = new Date()
def subject = "Case Followup Report ${today.format("MM/dd/yyyy")}"
def body = "Case followup report from LIMS for ${today.format("MM/dd/yyyy")} attached."
def filename = "followup_report_${today.format("MM_dd_yyyy")}.xlsx"

def parentKits = new HashSet()
//NPT cases
parentKits.addAll(parentKitDAO.getAwaitingInfoPanoramaKits())
parentKits.addAll(parentKitDAO.getSupportFollowupPanoramaKits())

//CS2 cases
parentKits.addAll(parentKitDAO.getAwaitingInfoHorizonKits())
parentKits.addAll(parentKitDAO.getSupportFollowupHorizonKits())

def caseFiles = new HashSet()
caseFiles.addAll(caseFileDAO.session.createQuery(
        "select distinct cf from CaseFile cf join cf.categories cat " +
                "where cat.name like ''%hold%'' " +
                "and cf.closed is null " +
                "and cf.testType not in (''RESEARCH'', ''NPT'', ''CARRIER_SCREENING_2'')").list())

/* Output:
All Cases:
- Case ID
- White glove
- Clinic name
- Clinic ID
- Test Type
- Missing Info Items for Kit (Panorama Only)
- Case Note
- Case Categories
- Case Opened Date
Panorama Only:
- Kit Barcode
- Kit State
- Kit Support State
- Kit TAT
- Kit Received Date

*/

def header = [''Case ID'', ''Clinic Case ID'', ''White Gloved'', ''Clinic Name'', ''Clinic ID'', ''Test Type'', ''Missing Info'', ''Dashboard Note'', ''Case Categories'', ''Case Opened'',
               ''Kit Barcode'', ''Kit State'', ''Kit TAT'', ''Kit Received Date'', ''Patient First Name Missing'', ''Patient Last Name Missing'', 
               ''Kit marked for Redraw'', ''Delivery destination missing'', ''Review Required'', ''Case on Hold'', ''Clinic missing or not valid'',''Historic pricing plan not defined'',
               ''Bill-to type is not defined for pricing plan'', ''Microdel Ordered but clinic not enabled'', ''Egg donor used'', ''Missing Insurance'', ''Missing payment Information'',
               ''Mother Microdeletion Carrier'', ''Multiple Pregnancy'', ''Patient not pregnant / Pregnancy not answered'', ''Missing Canadian Waiver'', ''Report Gender Issue(Case says report Gender, clinic says No)'',
               ''Surrogate Used'', ''Patient Date of Birth missing/has issues'', ''Patient address (or component) missing'', ''Physician or Signature missing'', ''Physician last name missing'', ''Gestational Age Invalid/Missing'',
               ''No ICD Code'',''Referral handwritten'', ''Parent kit has null receive date'', ''Patient sample collection date issue'', ''Child sample collection date issue'', 
               ''Verify test order'',''Identifier discrepancy'',''Sample discrepancy'',''Missing father sample'',''Non-readable'',''No HL7 case - creating HL7'',''Other hold reason'',
               ''LIMS link'', ''Orders link'']

def output = []
parentKits.each { pk ->
  if (caseFiles.contains(pk.caseFile)) caseFiles.remove(pk.caseFile)
  def errorMap = new HashMap()
  def validator = (pk.caseFile?.testType.isNPT()) ? NPTParentKitValidator.class : HorizonParentKitValidator.class
  def mi = _ctx.getBean(validator).getMissingInformation(pk)  
  if (mi != null) {
  	mi.allErrors.each { 
  		errorMap.put(it.field.replaceAll("\\[.*?\\]", ""),"true") 
  	}
  }
  output.add([pk.caseFile?.id, 
	      pk.caseFile?.thirdPartyId ?: "",
              pk.caseFile?.whitegloved ? "YES" : "", 
              pk.caseFile?.clinic?.name, 
              pk.caseFile?.clinic?.id, 
              pk.caseFile?.testType?.name,
              _ctx.getBean(NPTParentKitValidator.class).getMissingInformation(pk)?.allErrors?.collect { it.defaultMessage }?.join("\n"),
              pk.caseFile?.dashboardNote,
              pk.caseFile?.dashboardCategories?.collect { it.name }?.join("\n"),
              pk.caseFile?.opened?.format("MM/dd/yyyy"),
              pk.barcode,
              pk.state?.getName(),
              holidayService.getTurnaroundTimeDays(pk.received, today, holidays),
              pk.received?.format("MM/dd/yyyy"),
              errorMap[''caseFile.patient.firstname''],
              errorMap[''caseFile.patient.lastname''],
              errorMap[''redrawReceipts''],
              errorMap[''caseFile''],
              errorMap[''caseFile.CSReferralVersion''],
              errorMap[''caseFile.categories''],
              errorMap[''caseFile.clinic''],
              errorMap[''caseFile.historicPricingPlan''],
              errorMap[''caseFile.historicPricingPlan.billToType''],
              errorMap[''caseFile.microdelPanel''],
              errorMap[''caseFile.paternityFields.eggDonorUsed''],
              errorMap[''caseFile.paternityFields.missingInsurance''],
              errorMap[''caseFile.paternityFields.missingPaymentInformation''],
              errorMap[''caseFile.paternityFields.motherMicrodeletionCarrier''],
              errorMap[''caseFile.paternityFields.multiplePregnancy''],
              errorMap[''caseFile.paternityFields.pregnant''],
              errorMap[''caseFile.paternityFields.receivedCanadianWaiver''],
              errorMap[''caseFile.paternityFields.reportGender''],
              errorMap[''caseFile.paternityFields.surrogateUsed''],
              errorMap[''caseFile.patient.dateOfBirth''],
              errorMap[''caseFile.patient.defaultAddress''],              
              errorMap[''caseFile.physician''],
              errorMap[''caseFile.physician.lastname''],
              errorMap[''gestationalAge''],			  
			  (pk.caseFile?.findCategoryByName("No ICD Code") != null) ? "true" : "",
              errorMap[''handwritten''],
              errorMap[''received''],             
              errorMap[''patientSamples.collectionDate''],
              errorMap[''childSamples.collectionDate''],
              (pk.caseFile?.findCategoryByName("Verify test order") != null) ? "true" : "",
	      (pk.caseFile?.findCategoryByName("Identifier discrepancy") != null) ? "true" : "",
	      (pk.caseFile?.findCategoryByName("Sample discrepancy") != null) ? "true" : "",
	      (pk.caseFile?.findCategoryByName("Missing father sample") != null) ? "true" : "",
	      (pk.caseFile?.findCategoryByName("Non-readable") != null) ? "true" : "",
	      (pk.caseFile?.findCategoryByName("No HL7 case - creating HL7") != null) ? "true" : "",
	      (pk.caseFile?.findCategoryByName("Other hold reason") != null) ? "true" : ""])
}
caseFiles.each { cf ->
  output.add([cf.id, 
	      cf.thirdPartyId ?: "",
              cf.whitegloved ? "YES" : "", 
              cf.clinic?.name, 
              cf.clinic?.id,
              cf.testType?.name,
              null,
              cf.dashboardNote,
              cf.dashboardCategories?.collect { it.name }?.join("\n"),
              cf.opened?.format("MM/dd/yyyy"),              
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,
              null,			  
			  cf.findCategoryByName("No ICD Code") != null ? "true" : "",
              null,
              null,
              null,
              null,
		          cf.findCategoryByName("Verify test order") != null ? "true" : "",
		          cf.findCategoryByName("Identifier discrepancy") != null ? "true" : "",
		          cf.findCategoryByName("Sample discrepancy") != null ? "true" : "",
		          cf.findCategoryByName("Missing father sample") != null ? "true" : "",
		          cf.findCategoryByName("Non-readable") != null ? "true" : "",
		          cf.findCategoryByName("No HL7 case - creating HL7") != null ? "true" : "",
		          cf.findCategoryByName("Other hold reason") != null ? "true" : ""
              ])
}

output = output.sort { a, b -> a[2] <=> b[2] ?: a[0] <=> b[0] }
output.add(0, header)
def maxColumnCount = 0

def wb = new XSSFWorkbook()
def sheet = wb.createSheet("Support Followup Report")
sheet.createFreezePane(0, 1)  // lock the header row

output.eachWithIndex { r, i -> 
  def row = sheet.createRow((short) i)
  r.eachWithIndex { c, j ->
    def cs = wb.createCellStyle()
    cs.setWrapText(true)
    def cell = row.createCell(j)
    cell.setCellValue(c == null ? "" : c)
    cell.setCellStyle(cs)
  }
  if (i > 0) {
		def cs = wb.createCellStyle()
		def hlink_font = wb.createFont()
		hlink_font.setUnderline(Font.U_SINGLE)
		hlink_font.setColor(IndexedColors.BLUE.getIndex())
		cs.setFont(hlink_font)

		def limsLinkCell = row.createCell(r.size())
		def limsLink = wb.creationHelper.createHyperlink(Hyperlink.LINK_URL);
		limsLink.setAddress("http://lims/prod-lims/app/case/view?id=${r[0]}");
		limsLinkCell.setCellValue("LIMS/LIMS Case")
		limsLinkCell.setHyperlink(limsLink);
		limsLinkCell.setCellStyle(cs);
		
		def ordersLinkCell = row.createCell(r.size() + 1)
		def ordersLink = wb.creationHelper.createHyperlink(Hyperlink.LINK_URL);
		ordersLink.setAddress("http://lims/extranet/app/case/show?caseId=${r[0]}");
		ordersLinkCell.setCellValue("LIMS/Orders Case")
		ordersLinkCell.setHyperlink(ordersLink);
		ordersLinkCell.setCellStyle(cs);
  }

  if (r.size() + 2 > maxColumnCount) maxColumnCount = r.size() + 2
}

(0 .. maxColumnCount - 1).each { sheet.autoSizeColumn(it) }

def outStream = new ByteArrayOutputStream()
try {
	wb.write(outStream)
	secureEmailSender.send(toAddresses as List, subject as String, body as String, filename as String, outStream.toByteArray(), false as Boolean)
} finally {
	outStream.close()
}

return "Sent to ${toAddresses.join(", ")}"
'
WHERE id = 40;

UPDATE `prodlims`.`script`
SET code = '
import com.natera.lims.datamodel.core.TestType
import com.natera.lims.datamodel.ivf.FamilyPosition
import com.natera.lims.datamodel.ivf.prod.LimsState
import com.natera.lims.datamodel.ivf.prod.SampleType
import org.apache.poi.xssf.usermodel.XSSFWorkbook

def today = new Date();

def parentKits = parentKitDAO.getSession()
        .createQuery(
        "select distinct pk from ParentKit pk " +
                "inner join fetch pk.caseFile caseFile inner join caseFile.categories cat " +
                "where DATE(pk.received) < DATE(:date) " +
                "and pk.state not in (:states) " +
                "and caseFile.testType = :testType and caseFile.closed IS NULL and cat.name not in (''V2 Validation'')")
        .setParameter("date", today  - 5)
        .setParameterList("states", Arrays.asList(LimsState.NPT_REPORT_SENT, LimsState.NPT_RESEARCH_KIT))
        .setParameter("testType", TestType.NPT)
        .list();

def output = []

def rowHeights = new HashMap(); //row, heights
def rowCount = 0;


def header = [
        "Case", "Kit", "Kit Received", "TAT",
        "Kit State", "Microdel Kit State",
        "Genomic Mom DNA Sample", "Genomic Mom DNA Prepped",
        "Genomic Mom Star1 Plate", "Genomic Mom Star1 Plate Time",
        "Genomic Mom Bar Plate", "Genomic Mom Bar Plate Time",
        "Genomic Mom Pool", "Genomic Mom Pool Time",
        "Genomic Mom HiSeq Run", "Genomic Mom HiSeq Run Time",
        "Plasma Sample", "Plasma Isolation Complete Time",
        "cfDNA Sample", "cfDNA Extraction Complete Time",
        "Lib Plate", "Lib Plate Time",
        "cf Star1 Plate", "cf Star Plate Time",
        "cf Bar Plate", "cf Bar Plate Time",
        "cf Pool Plate", "cf Pool Plate Time",
        "cf HiSeq Run", "cf HiSeq Run Time"
]

output.add(rowCount, header)
rowHeights.put(rowCount, 1)
rowCount++



/*
Case
Kit
Kit Received
Current TAT (calendar)
Kit State
Microdel Kit State
Genomic Mom DNA Sample
Genomic DNA Prepped
Genomic Mom on Star PCR Plate/s
Genomic Mom on Star PCR Plate/s Time //created
Genomic Mom on Bar Plate/s
Genomic Mom on Bar Plate/s Time // created
Genomic POOL ID
Genomic Pool Time
Genomic Mom on HiSeq Run/s
Genomic Mom on HiSeq Run/s Time
Plasma Sample
Plasma Isolation Complete Time
cfDNA Sample
cfDNA Extraction Complete Time
Initial Library Plate/s
Initial Library Plate/s Time
cf Star plate
cf Star plate Time
cf BAR plate
cf BAR plate Time
cf POOL ID
cf Pool Time
cf HiSeq Run
cf HiSeq Run Time*/

def holidays = holidayService.getHolidayList(holidayDAO.getHolidays());
parentKits.each { parentKit ->
    def caseFile = parentKit?.caseFile
    if (parentKit != null && caseFile != null) {

        def currentTAT = holidayService.getTurnaroundTimeDays(parentKit.received, today, holidays)
        if (currentTAT > 5) {

            //genomic
            def motherDNASamples = []
            def motherStar1Plates = []
            def motherBarcodingPcrPlates = []
            def motherSamplePools = []
            def motherSeqRuns = []

            //child
            def childPlasmaSamples = []
            def childDNASamples = []
            def childLib1Plates = []
            def childStar1Plates = []
            def childBarcodingPcrPlates = []
            def childSamplePools = []
            def childSeqRuns = []

            def rowHeight = 1

            def motherSamples = []

            parentKit.samples.each { sample ->
                if (sample.subject.getFamilyPosition(caseFile.family) == FamilyPosition.patient) {
                    motherSamples.add(sample)
                    motherDNASamples.addAll(filterPrepSamples(sample, SampleType.DNA))
                }
            }

            motherStar1Plates.addAll(getStar1Plates(motherDNASamples))
            motherBarcodingPcrPlates.addAll(getBarcodingPcrPlates(motherDNASamples))
            motherSamplePools.addAll(getSamplePools(motherDNASamples))

            def motherSeqSamples = getSeqSamples(motherDNASamples)
            motherSeqSamples.each {
                motherSeqRuns.add(it.run)
            }

            // get plasma samples that were prepped from mother samples
            def childSamples = new HashSet()
            motherSamples.each { motherSample ->
                childSamples.addAll(filterPrepSamples(motherSample, SampleType.PLASMA))
            }

            // check for plasma samples directly accessioned in the parent kit
            parentKit.samples.each { sample ->
                if (sample.subject.getFamilyPosition(caseFile.family) == FamilyPosition.child) {
                    childSamples.add(sample)
                    //check if a plasma sample has been prepped directly from this parent kit''s plasma sample
                    childSamples.addAll(filterPrepSamples(sample, SampleType.PLASMA))
                }
            }

            childPlasmaSamples.addAll(childSamples)

            childPlasmaSamples.each { childPlasmaSample ->
                childDNASamples.addAll(filterPrepSamples(childPlasmaSample, SampleType.DNA))

            }

            childLib1Plates.addAll(getLibPlates(childDNASamples))
            childStar1Plates.addAll(getStar1Plates(childDNASamples))
            childBarcodingPcrPlates.addAll(getBarcodingPcrPlates(childDNASamples))
            childSamplePools.addAll(getSamplePools(childDNASamples))

            def childSeqSamples = getSeqSamples(childDNASamples)
            childSeqSamples.each {
                childSeqRuns.add(it.run)
            }

            if (motherDNASamples.size() > rowHeight) rowHeight = motherDNASamples.size();
            if (childPlasmaSamples.size() > rowHeight) rowHeight = childPlasmaSamples.size();
            if (childDNASamples.size() > rowHeight) rowHeight = childDNASamples.size();

            if (motherStar1Plates.size() > rowHeight) rowHeight = motherStar1Plates.size();
            if (motherBarcodingPcrPlates.size() > rowHeight) rowHeight = motherBarcodingPcrPlates.size();
            if (motherSamplePools.size() > rowHeight) rowHeight = motherSamplePools.size();
            if (motherSeqRuns.size() > rowHeight) rowHeight = motherSeqRuns.size();

            if (childLib1Plates.size() > rowHeight) rowHeight = childLib1Plates.size();
            if (childStar1Plates.size() > rowHeight) rowHeight = childStar1Plates.size();
            if (childBarcodingPcrPlates.size() > rowHeight) rowHeight = childBarcodingPcrPlates.size();
            if (childSamplePools.size() > rowHeight) rowHeight = childSamplePools.size();
            if (childSeqRuns.size() > rowHeight) rowHeight = childSeqRuns.size();


            rowHeights.put(rowCount, rowHeight)
            rowCount++

            output.add([

                    caseFile.id, parentKit.barcode, parentKit.received.toString(), currentTAT,
                    parentKit.state.toString(), (parentKit.microdelState != null) ? parentKit.microdelState.toString() : "no MD ordered" ,
                    combineByField(motherDNASamples, "barcode"), combineByField(motherDNASamples, "prepped"),
                    combineByField(motherStar1Plates, "barcode"), combineByField(motherStar1Plates, "created"),
                    combineByField(motherBarcodingPcrPlates, "barcode"),combineByField(motherBarcodingPcrPlates, "created"),
                    combineByField(motherSamplePools, "barcode"), combineByField(motherSamplePools, "created"),
                    combineByField(motherSeqRuns, "runId"), combineByField(motherSeqRuns, "runDate"),

                    combineByField(childPlasmaSamples, "barcode"), combineByField(childPlasmaSamples, "isolation"),
                    combineByField(childDNASamples, "barcode"), combineByField(childDNASamples, "prepped"),
                    combineByField(childLib1Plates, "barcode"), combineByField(childLib1Plates, "created"),
                    combineByField(childStar1Plates, "barcode"), combineByField(childStar1Plates, "created"),
                    combineByField(childBarcodingPcrPlates, "barcode"), combineByField(childBarcodingPcrPlates, "created"),
                    combineByField(childSamplePools, "barcode"), combineByField(childSamplePools, "created"),
                    combineByField(childSeqRuns, "runId"), combineByField(childSeqRuns, "runDate")

            ])


        }
    }
}

println "Total # of kits: " + (output.size() - 1)

def getSeqSamples(def samples) {
    def seqSamples = new ArrayList()
    samples.each {
        seqSamples.addAll(it.sequencingSamples)
    }
    return seqSamples
}
def filterPrepSamples(def sample, def sampleType) {
    def returnSamples = new HashSet()
    def prepSamples = sample.prepSamples
    prepSamples.each { prepSample ->
        if (prepSample.sampleType.name.equals(sampleType)) {
            returnSamples.add(prepSample)
        }
    }
    return returnSamples
}

def getLibPlates(def samples) {
    if (samples != null && !samples.isEmpty()) {
        return libPlateDAO.getSession()
                .createQuery("select distinct plate from LibPlate plate " +
                "join plate.wells well " +
                "join well.sample sample " +
                "where sample in (:samples) " +
                "order by plate.created desc")
                .setParameterList("samples", samples)
                .list()
    }
    return []
}

def getStar1Plates(def samples) {
    if (samples != null && !samples.isEmpty()) {
        return star1PlateDAO.getSession()
                .createQuery("select distinct plate from Star1Plate plate " +
                "join plate.wells well " +
                "join well.sample sample " +
                "where sample in (:samples) " +
                "order by plate.created desc")
                .setParameterList("samples", samples)
                .list()
    }
    return []
}

def getBarcodingPcrPlates(def samples) {
    if (samples != null && !samples.isEmpty()) {
        return barcodingPcrPlateDAO.getSession()
                .createQuery("select distinct plate from BarcodingPCRPlate plate " +
                "join plate.wells well " +
                "join well.sample sample " +
                "where sample in (:samples) " +
                "order by plate.created desc")
                .setParameterList("samples", samples)
                .list()
    }
    return []
}

def getSamplePools(def samples) {
    if (samples != null && !samples.isEmpty()) {
        return samplePoolDAO.getSession()
                .createQuery("select distinct pool from SamplePool pool " +
                "join fetch pool.barcodedSamples barcodedSample " +
                "join fetch barcodedSample.sample sample " +
                "where sample in (:samples) " +
                "order by pool.created desc")
                .setParameterList("samples", samples)
                .list();
    }
    return []
}

def combineByField(def list, String field) {
    def str = ""
    int count = 0;
    list.each {
        count++
        def isLastItem = (count == list.size())
        if (field.equals("barcode")) {
            str += (isLastItem) ? " " + it.barcode : " " + it.barcode + ",\n"
        } else if (field.equals("runId")) {
            str += (isLastItem) ? " " + it.runId : " " + it.runId + ",\n"
        } else if (field.equals("created")) {
            str += (isLastItem) ? " " + it.created : " " + it.created + ",\n"
        } else if (field.equals("received")) {
            str += (isLastItem) ? " " + it.received : " " + it.received + ",\n"
        } else if (field.equals("prepped")) {
            def prepped = (it.prepped != null) ? it.prepped : "not prepped yet"
            str += (isLastItem) ? " " + prepped : " " + prepped + ",\n"
        } else if (field.equals("runDate")) {
            def runDate = (it.runDate != null) ? it.runDate : "not run yet"
            str += (isLastItem) ? " " + runDate : " " + runDate + ",\n"
        } else if (field.equals("isolation")) {
            def plasmaVolume = getPlasmaVolume(it)
            if (plasmaVolume == null) plasmaVolume = "not isolated yet"
            str += (isLastItem) ? " " + plasmaVolume : " " + plasmaVolume + ",\n"
        }
    }
    return str
}

def getPlasmaVolume(def entity) {
    def auditLogRecords = auditLogRecordDAO.getSession()
            .createQuery("select distinct record from AuditLogRecord record " +
            "where record.entityId = :entityId and record.entityName = :entityName " +
            "and record.entityAttribute = :entityAttribute and record.message = :message " +
            "and record.newValue IS NOT NULL order by record.id desc ")
            .setParameter("entityId", entity.getId())
            .setParameter("entityName", entity.getClass().getSimpleName())
            .setParameter("entityAttribute", "plasmaVolume")
            .setParameter("message", "update")
            .list();

    if (auditLogRecords.size() > 0) {
        return auditLogRecords[0].timestamp.toString()
    } else {
        return "n/a"
    }
}

def subject = "TAT Report"
def body = "TAT Report from LIMS attached."
def filename = "TAT_report.xlsx"

def wb = new XSSFWorkbook()
def sheet = wb.createSheet("TAT Report")

output.eachWithIndex { r, i ->
    def row = sheet.createRow((short) i)
    r.eachWithIndex { c, j ->
        def cs = wb.createCellStyle()
        cs.setWrapText(true)

        def cell = row.createCell(j)
        cell.setCellValue(c == null ? "" : c)
        cell.setCellStyle(cs)
    }
    float newHeight = sheet.getDefaultRowHeightInPoints() * rowHeights.get(i)
    row.setHeightInPoints(newHeight)

}

for (def i = 0; i < header.size(); i++) {
    sheet.autoSizeColumn(i)
}

def outStream = new ByteArrayOutputStream()
try {
    wb.write(outStream)
    secureEmailSender.send(toAddresses as List, subject as String, body as String, filename as String, outStream.toByteArray(), false as Boolean)
} finally {
    outStream.close()
}
'
WHERE id = 41;

UPDATE `prodlims`.`script`
SET code = '
import com.natera.lims.datamodel.core.TestType
import com.natera.lims.datamodel.ivf.FamilyPosition
import com.natera.lims.datamodel.ivf.prod.LimsState
import com.natera.lims.datamodel.ivf.prod.SampleType
import org.apache.poi.xssf.usermodel.XSSFWorkbook

def parentKits = parentKitDAO.getSession()
        .createQuery(
        "select distinct pk from ParentKit pk " +
                "inner join fetch pk.caseFile caseFile inner join caseFile.categories cat " +
                "where DATE(pk.received) >= DATE(:fromDate) " +
                "and DATE(pk.received) < DATE(:toDate) " +
                "and pk.state in (:states) " +
                "and caseFile.testType = :testType and cat.name not in (''V2 Validation'')")
        .setParameter("fromDate", fromDate)
        .setParameter("toDate", toDate)
        .setParameterList("states", Arrays.asList(LimsState.NPT_REPORT_SENT))
        .setParameter("testType", TestType.NPT)
        .list();

def output = []

def rowHeights = new HashMap(); //row, heights
def rowCount = 0;


def header = [
        "Case", "Kit", "Kit Received", "TAT",
        "Kit State", "Microdel Kit State",
        "Genomic Mom DNA Sample", "Genomic Mom DNA Prepped",
        "Genomic Mom Star1 Plate", "Genomic Mom Star1 Plate Time",
        "Genomic Mom Bar Plate", "Genomic Mom Bar Plate Time",
        "Genomic Mom Pool", "Genomic Mom Pool Time",
        "Genomic Mom HiSeq Run", "Genomic Mom HiSeq Run Time",
        "Plasma Sample", "Plasma Isolation Complete Time",
        "cfDNA Sample", "cfDNA Extraction Complete Time",
        "Lib Plate", "Lib Plate Time",
        "cf Star1 Plate", "cf Star Plate Time",
        "cf Bar Plate", "cf Bar Plate Time",
        "cf Pool Plate", "cf Pool Plate Time",
        "cf HiSeq Run", "cf HiSeq Run Time"
]

output.add(rowCount, header)
rowHeights.put(rowCount, 1)
rowCount++



/*
Case
Kit
Kit Received
Current TAT (calendar)
Kit State
Microdel Kit State
Genomic Mom DNA Sample
Genomic DNA Prepped
Genomic Mom on Star PCR Plate/s
Genomic Mom on Star PCR Plate/s Time //created
Genomic Mom on Bar Plate/s
Genomic Mom on Bar Plate/s Time // created
Genomic POOL ID
Genomic Pool Time
Genomic Mom on HiSeq Run/s
Genomic Mom on HiSeq Run/s Time
Plasma Sample
Plasma Isolation Complete Time
cfDNA Sample
cfDNA Extraction Complete Time
Initial Library Plate/s
Initial Library Plate/s Time
cf Star plate
cf Star plate Time
cf BAR plate
cf BAR plate Time
cf POOL ID
cf Pool Time
cf HiSeq Run
cf HiSeq Run Time*/

def holidays = holidayService.getHolidayList(holidayDAO.getHolidays());
parentKits.each { parentKit ->
    def caseFile = parentKit?.caseFile
    if (parentKit != null && caseFile != null) {

        //def currentTAT = holidayService.getTurnaroundTimeDays(parentKit.received, today, holidays)
        //if (currentTAT > 5) {

            //genomic
            def motherDNASamples = []
            def motherStar1Plates = []
            def motherBarcodingPcrPlates = []
            def motherSamplePools = []
            def motherSeqRuns = []

            //child
            def childPlasmaSamples = []
            def childDNASamples = []
            def childLib1Plates = []
            def childStar1Plates = []
            def childBarcodingPcrPlates = []
            def childSamplePools = []
            def childSeqRuns = []

            def rowHeight = 1

            def motherSamples = []

            parentKit.samples.each { sample ->
                if (sample.subject.getFamilyPosition(caseFile.family) == FamilyPosition.patient) {
                    motherSamples.add(sample)
                    motherDNASamples.addAll(filterPrepSamples(sample, SampleType.DNA))
                }
            }

            motherStar1Plates.addAll(getStar1Plates(motherDNASamples))
            motherBarcodingPcrPlates.addAll(getBarcodingPcrPlates(motherDNASamples))
            motherSamplePools.addAll(getSamplePools(motherDNASamples))

            def motherSeqSamples = getSeqSamples(motherDNASamples)
            motherSeqSamples.each {
                motherSeqRuns.add(it.run)
            }

            // get plasma samples that were prepped from mother samples
            def childSamples = new HashSet()
            motherSamples.each { motherSample ->
                childSamples.addAll(filterPrepSamples(motherSample, SampleType.PLASMA))
            }

            // check for plasma samples directly accessioned in the parent kit
            parentKit.samples.each { sample ->
                if (sample.subject.getFamilyPosition(caseFile.family) == FamilyPosition.child) {
                    childSamples.add(sample)
                    //check if a plasma sample has been prepped directly from this parent kit''s plasma sample
                    childSamples.addAll(filterPrepSamples(sample, SampleType.PLASMA))
                }
            }

            childPlasmaSamples.addAll(childSamples)

            childPlasmaSamples.each { childPlasmaSample ->
                childDNASamples.addAll(filterPrepSamples(childPlasmaSample, SampleType.DNA))

            }

            childLib1Plates.addAll(getLibPlates(childDNASamples))
            childStar1Plates.addAll(getStar1Plates(childDNASamples))
            childBarcodingPcrPlates.addAll(getBarcodingPcrPlates(childDNASamples))
            childSamplePools.addAll(getSamplePools(childDNASamples))

            def childSeqSamples = getSeqSamples(childDNASamples)
            childSeqSamples.each {
                childSeqRuns.add(it.run)
            }

            if (motherDNASamples.size() > rowHeight) rowHeight = motherDNASamples.size();
            if (childPlasmaSamples.size() > rowHeight) rowHeight = childPlasmaSamples.size();
            if (childDNASamples.size() > rowHeight) rowHeight = childDNASamples.size();

            if (motherStar1Plates.size() > rowHeight) rowHeight = motherStar1Plates.size();
            if (motherBarcodingPcrPlates.size() > rowHeight) rowHeight = motherBarcodingPcrPlates.size();
            if (motherSamplePools.size() > rowHeight) rowHeight = motherSamplePools.size();
            if (motherSeqRuns.size() > rowHeight) rowHeight = motherSeqRuns.size();

            if (childLib1Plates.size() > rowHeight) rowHeight = childLib1Plates.size();
            if (childStar1Plates.size() > rowHeight) rowHeight = childStar1Plates.size();
            if (childBarcodingPcrPlates.size() > rowHeight) rowHeight = childBarcodingPcrPlates.size();
            if (childSamplePools.size() > rowHeight) rowHeight = childSamplePools.size();
            if (childSeqRuns.size() > rowHeight) rowHeight = childSeqRuns.size();


            rowHeights.put(rowCount, rowHeight)
            rowCount++

            output.add([

                    caseFile.id, parentKit.barcode, parentKit.received.toString(), currentTAT,
                    parentKit.state.toString(), (parentKit.microdelState != null) ? parentKit.microdelState.toString() : "no MD ordered" ,
                    combineByField(motherDNASamples, "barcode"), combineByField(motherDNASamples, "prepped"),
                    combineByField(motherStar1Plates, "barcode"), combineByField(motherStar1Plates, "created"),
                    combineByField(motherBarcodingPcrPlates, "barcode"),combineByField(motherBarcodingPcrPlates, "created"),
                    combineByField(motherSamplePools, "barcode"), combineByField(motherSamplePools, "created"),
                    combineByField(motherSeqRuns, "runId"), combineByField(motherSeqRuns, "runDate"),

                    combineByField(childPlasmaSamples, "barcode"), combineByField(childPlasmaSamples, "isolation"),
                    combineByField(childDNASamples, "barcode"), combineByField(childDNASamples, "prepped"),
                    combineByField(childLib1Plates, "barcode"), combineByField(childLib1Plates, "created"),
                    combineByField(childStar1Plates, "barcode"), combineByField(childStar1Plates, "created"),
                    combineByField(childBarcodingPcrPlates, "barcode"), combineByField(childBarcodingPcrPlates, "created"),
                    combineByField(childSamplePools, "barcode"), combineByField(childSamplePools, "created"),
                    combineByField(childSeqRuns, "runId"), combineByField(childSeqRuns, "runDate")

            ])


        //}
    }
}

println "Total # of kits: " + (output.size() - 1)

def getSeqSamples(def samples) {
    def seqSamples = new ArrayList()
    samples.each {
        seqSamples.addAll(it.sequencingSamples)
    }
    return seqSamples
}
def filterPrepSamples(def sample, def sampleType) {
    def returnSamples = new HashSet()
    def prepSamples = sample.prepSamples
    prepSamples.each { prepSample ->
        if (prepSample.sampleType.name.equals(sampleType)) {
            returnSamples.add(prepSample)
        }
    }
    return returnSamples
}

def getLibPlates(def samples) {
    if (samples != null && !samples.isEmpty()) {
        return libPlateDAO.getSession()
                .createQuery("select distinct plate from LibPlate plate " +
                "join plate.wells well " +
                "join well.sample sample " +
                "where sample in (:samples) " +
                "order by plate.created desc")
                .setParameterList("samples", samples)
                .list()
    }
    return []
}

def getStar1Plates(def samples) {
    if (samples != null && !samples.isEmpty()) {
        return star1PlateDAO.getSession()
                .createQuery("select distinct plate from Star1Plate plate " +
                "join plate.wells well " +
                "join well.sample sample " +
                "where sample in (:samples) " +
                "order by plate.created desc")
                .setParameterList("samples", samples)
                .list()
    }
    return []
}

def getBarcodingPcrPlates(def samples) {
    if (samples != null && !samples.isEmpty()) {
        return barcodingPcrPlateDAO.getSession()
                .createQuery("select distinct plate from BarcodingPCRPlate plate " +
                "join plate.wells well " +
                "join well.sample sample " +
                "where sample in (:samples) " +
                "order by plate.created desc")
                .setParameterList("samples", samples)
                .list()
    }
    return []
}

def getSamplePools(def samples) {
    if (samples != null && !samples.isEmpty()) {
        return samplePoolDAO.getSession()
                .createQuery("select distinct pool from SamplePool pool " +
                "join fetch pool.barcodedSamples barcodedSample " +
                "join fetch barcodedSample.sample sample " +
                "where sample in (:samples) " +
                "order by pool.created desc")
                .setParameterList("samples", samples)
                .list();
    }
    return []
}

def combineByField(def list, String field) {
    def str = ""
    int count = 0;
    list.each {
        count++
        def isLastItem = (count == list.size())
        if (field.equals("barcode")) {
            str += (isLastItem) ? " " + it.barcode : " " + it.barcode + ",\n"
        } else if (field.equals("runId")) {
            str += (isLastItem) ? " " + it.runId : " " + it.runId + ",\n"
        } else if (field.equals("created")) {
            str += (isLastItem) ? " " + it.created : " " + it.created + ",\n"
        } else if (field.equals("received")) {
            str += (isLastItem) ? " " + it.received : " " + it.received + ",\n"
        } else if (field.equals("prepped")) {
            def prepped = (it.prepped != null) ? it.prepped : "not prepped yet"
            str += (isLastItem) ? " " + prepped : " " + prepped + ",\n"
        } else if (field.equals("runDate")) {
            def runDate = (it.runDate != null) ? it.runDate : "not run yet"
            str += (isLastItem) ? " " + runDate : " " + runDate + ",\n"
        } else if (field.equals("isolation")) {
            def plasmaVolume = getPlasmaVolume(it)
            if (plasmaVolume == null) plasmaVolume = "not isolated yet"
            str += (isLastItem) ? " " + plasmaVolume : " " + plasmaVolume + ",\n"
        }
    }
    return str
}

def getPlasmaVolume(def entity) {
    def auditLogRecords = auditLogRecordDAO.getSession()
            .createQuery("select distinct record from AuditLogRecord record " +
            "where record.entityId = :entityId and record.entityName = :entityName " +
            "and record.entityAttribute = :entityAttribute and record.message = :message " +
            "and record.newValue IS NOT NULL order by record.id desc ")
            .setParameter("entityId", entity.getId())
            .setParameter("entityName", entity.getClass().getSimpleName())
            .setParameter("entityAttribute", "plasmaVolume")
            .setParameter("message", "update")
            .list();

    if (auditLogRecords.size() > 0) {
        return auditLogRecords[0].timestamp.toString()
    } else {
        return "n/a"
    }
}

def subject = "TAT Report"
def body = "TAT Report from LIMS attached."
def filename = "TAT_report.xlsx"

def wb = new XSSFWorkbook()
def sheet = wb.createSheet("TAT Report")

output.eachWithIndex { r, i ->
    def row = sheet.createRow((short) i)
    r.eachWithIndex { c, j ->
        def cs = wb.createCellStyle()
        cs.setWrapText(true)

        def cell = row.createCell(j)
        cell.setCellValue(c == null ? "" : c)
        cell.setCellStyle(cs)
    }
    float newHeight = sheet.getDefaultRowHeightInPoints() * rowHeights.get(i)
    row.setHeightInPoints(newHeight)

}

for (def i = 0; i < header.size(); i++) {
    sheet.autoSizeColumn(i)
}

def outStream = new ByteArrayOutputStream()
try {
    wb.write(outStream)
    secureEmailSender.send(toAddresses as List, subject as String, body as String, filename as String, outStream.toByteArray(), false as Boolean)
} finally {
    outStream.close()
}

// fromDate (inclusive) - toDate (exclusive)
// date format: yyyy-MM-dd
'
WHERE id = 42;

UPDATE `prodlims`.`script`
SET code = '
import com.natera.lims.datamodel.core.TestType
import com.natera.lims.datamodel.ivf.FamilyPosition
import com.natera.lims.datamodel.ivf.prod.LimsState
import com.natera.lims.datamodel.ivf.prod.SampleType
import org.apache.poi.xssf.usermodel.XSSFWorkbook
import java.text.*;

def today = new Date();

def tat = TATdays ? TATdays : 10

def parentKits = parentKitDAO.getSession()
        .createQuery(
        "select distinct pk from ParentKit pk " +
                "inner join fetch pk.caseFile caseFile left outer join caseFile.categories cat " +
                "where DATE(pk.received) < DATE(:date) " +
                "and pk.state not in (:states) " +
                "and caseFile.testType = :testType and caseFile.closed IS NULL and (cat is null or cat.name not in (''V2 Validation''))" +
				"order by pk.received ASC")
        .setParameter("date", today  - ((tat - 1) as int))
        .setParameterList("states", Arrays.asList(LimsState.NPT_REPORT_READY, LimsState.NPT_REPORT_SENT))
        .setParameter("testType", TestType.NPT)
        .list();

def output = []

def header = ["Case", "Clinic", "Kit", "Kit Received", "TAT", "State", "Microdel State", "Support State", "Categories", "Sticky Note"]

output.add(0, header)

println "Number of kits pulled by the query: " + parentKits.size()


/*
Case
Kit
Kit Received
Current TAT (calendar)
Kit State
Microdel Kit State
Support State
Categories
Sticky Note
*/

def holidays = holidayService.getHolidayList(holidayDAO.getHolidays());
def sdf = new SimpleDateFormat("dd/MM/yyyy");

parentKits.each { parentKit ->
    def caseFile = parentKit?.caseFile
    if (parentKit != null && caseFile != null) {

        def currentTAT = holidayService.getTurnaroundTimeDays(sdf.parse(sdf.format(parentKit.received)), today, holidays)
        if (currentTAT >= tat) {

            output.add([

                    caseFile.id, (caseFile.clinic != null) ? caseFile.clinic.name : "no clinic selected", parentKit.barcode, parentKit.received.toString(), currentTAT,
                    parentKit.state.toString(), (parentKit.microdelState != null) ? parentKit.microdelState.toString() : "no MD ordered" ,
                    parentKit.supportState.toString(), caseFile.dashboardCategories?.collect { it.name }?.join("\n"),, caseFile.dashboardNote
            ])


        }
    } else {
        println "no caseFile"
    }
}

println "Total # of kits: " + (output.size() - 1)

def subject = "Cases with TAT >= "+ tat +" Report"
def body = "Cases with TAT >= "+ tat +" from LIMS attached."
def filename = "Cases_with_"+ tat + "_plus_report.xlsx"

def wb = new XSSFWorkbook()
def sheet = wb.createSheet("TAT Report")

output.eachWithIndex { r, i ->
    def row = sheet.createRow((short) i)
    r.eachWithIndex { c, j ->
        def cs = wb.createCellStyle()
        cs.setWrapText(true)
        def cell = row.createCell(j)
        cell.setCellValue(c == null ? "" : c)
        cell.setCellStyle(cs)
    }
}

def outStream = new ByteArrayOutputStream()
try {
    wb.write(outStream)
    secureEmailSender.send(toAddresses as List, subject as String, body as String, filename as String, outStream.toByteArray(), false as Boolean)
} finally {
    outStream.close()
}

'
WHERE id = 43;

UPDATE `prodlims`.`script`
SET code = '
import com.natera.lims.datamodel.core.TestType
import com.natera.lims.datamodel.ivf.FamilyPosition
import com.natera.lims.datamodel.ivf.prod.LimsState
import com.natera.lims.datamodel.ivf.prod.SampleType
import org.apache.poi.xssf.usermodel.XSSFWorkbook

def today = new Date();

def parentKits = parentKitDAO.getSession()
        .createQuery(
        "select distinct pk from ParentKit pk " +
                "inner join fetch pk.caseFile caseFile inner join caseFile.categories cat " +
                "where DATE(pk.received) < DATE(:date) " +
                "and pk.state not in (:states) " +
                "and caseFile.testType = :testType and caseFile.closed IS NULL and cat.name not in (''V2 Validation'')")
        .setParameter("date", today  - 5)
        .setParameterList("states", Arrays.asList(LimsState.NPT_REPORT_SENT, LimsState.NPT_RESEARCH_KIT))
        .setParameter("testType", TestType.NPT)
        .list();

def output = []

def rowHeights = new HashMap(); //row, heights
def rowCount = 0;


def header = [
        "Case", "Kit", "Kit Received", "TAT",
        "Kit State", "Microdel Kit State",
        "Genomic Mom DNA Sample", "Genomic Mom DNA Prepped",
        "Genomic Mom Star1 Plate", "Genomic Mom Star1 Plate Time",
        "Genomic Mom Bar Plate", "Genomic Mom Bar Plate Time",
        "Genomic Mom Pool", "Genomic Mom Pool Time",
        "Genomic Mom HiSeq Run", "Genomic Mom HiSeq Run Time",
        "Plasma Sample", "Plasma Isolation Complete Time",
        "cfDNA Sample", "cfDNA Extraction Complete Time",
        "Lib Plate", "Lib Plate Time",
        "cf Star1 Plate", "cf Star Plate Time",
        "cf Bar Plate", "cf Bar Plate Time",
        "cf Pool Plate", "cf Pool Plate Time",
        "cf HiSeq Run", "cf HiSeq Run Time"
]

output.add(rowCount, header)
rowHeights.put(rowCount, 1)
rowCount++



/*
Case
Kit
Kit Received
Current TAT (calendar)
Kit State
Microdel Kit State
Genomic Mom DNA Sample
Genomic DNA Prepped
Genomic Mom on Star PCR Plate/s
Genomic Mom on Star PCR Plate/s Time //created
Genomic Mom on Bar Plate/s
Genomic Mom on Bar Plate/s Time // created
Genomic POOL ID
Genomic Pool Time
Genomic Mom on HiSeq Run/s
Genomic Mom on HiSeq Run/s Time
Plasma Sample
Plasma Isolation Complete Time
cfDNA Sample
cfDNA Extraction Complete Time
Initial Library Plate/s
Initial Library Plate/s Time
cf Star plate
cf Star plate Time
cf BAR plate
cf BAR plate Time
cf POOL ID
cf Pool Time
cf HiSeq Run
cf HiSeq Run Time*/

def holidays = holidayService.getHolidayList(holidayDAO.getHolidays());
parentKits.each { parentKit ->
    def caseFile = parentKit?.caseFile
    if (parentKit != null && caseFile != null) {

        def currentTAT = holidayService.getTurnaroundTimeDays(parentKit.received, today, holidays)
        if (currentTAT > 5) {

            //genomic
            def motherDNASamples = []
            def motherStar1Plates = []
            def motherBarcodingPcrPlates = []
            def motherSamplePools = []
            def motherSeqRuns = []

            //child
            def childPlasmaSamples = []
            def childDNASamples = []
            def childLib1Plates = []
            def childStar1Plates = []
            def childBarcodingPcrPlates = []
            def childSamplePools = []
            def childSeqRuns = []

            def rowHeight = 1

            def motherSamples = []

            parentKit.samples.each { sample ->
                if (sample.subject.getFamilyPosition(caseFile.family) == FamilyPosition.patient) {
                    motherSamples.add(sample)
                    motherDNASamples.addAll(filterPrepSamples(sample, SampleType.DNA))
                }
            }

            motherStar1Plates.addAll(getClarityPlates(motherDNASamples, "STAR1")) 
            motherBarcodingPcrPlates.addAll (getClarityPlates(motherDNASamples, "BC-PCR (indexing)"))
            motherSamplePools.addAll(getSamplePools(motherDNASamples))

            def motherSeqSamples = getSeqSamples(motherDNASamples)
            motherSeqSamples.each {
                motherSeqRuns.add(it.run)
            }

            // get plasma samples that were prepped from mother samples
            def childSamples = new HashSet()
            motherSamples.each { motherSample ->
                childSamples.addAll(filterPrepSamples(motherSample, SampleType.PLASMA))
            }

            // check for plasma samples directly accessioned in the parent kit
            parentKit.samples.each { sample ->
                if (sample.subject.getFamilyPosition(caseFile.family) == FamilyPosition.child) {
                    childSamples.add(sample)
                    //check if a plasma sample has been prepped directly from this parent kit''s plasma sample
                    childSamples.addAll(filterPrepSamples(sample, SampleType.PLASMA))
                }
            }

            childPlasmaSamples.addAll(childSamples)

            childPlasmaSamples.each { childPlasmaSample ->
                childDNASamples.addAll(filterPrepSamples(childPlasmaSample, SampleType.DNA))

            }

            childLib1Plates.addAll(getClarityPlates(childDNASamples, "Create LIB1 Plate"))
            childStar1Plates.addAll(getClarityPlates(childDNASamples, "OneSTAR")) 
            childBarcodingPcrPlates.addAll(getClarityPlates(childDNASamples, "BC-PCR (indexing)"))
            childSamplePools.addAll(getSamplePools(childDNASamples))

            def childSeqSamples = getSeqSamples(childDNASamples)
            childSeqSamples.each {
                childSeqRuns.add(it.run)
            }

            if (motherDNASamples.size() > rowHeight) rowHeight = motherDNASamples.size();
            if (childPlasmaSamples.size() > rowHeight) rowHeight = childPlasmaSamples.size();
            if (childDNASamples.size() > rowHeight) rowHeight = childDNASamples.size();

            if (motherStar1Plates.size() > rowHeight) rowHeight = motherStar1Plates.size();
            if (motherBarcodingPcrPlates.size() > rowHeight) rowHeight = motherBarcodingPcrPlates.size();
            if (motherSamplePools.size() > rowHeight) rowHeight = motherSamplePools.size();
            if (motherSeqRuns.size() > rowHeight) rowHeight = motherSeqRuns.size();

            if (childLib1Plates.size() > rowHeight) rowHeight = childLib1Plates.size();
            if (childStar1Plates.size() > rowHeight) rowHeight = childStar1Plates.size();
            if (childBarcodingPcrPlates.size() > rowHeight) rowHeight = childBarcodingPcrPlates.size();
            if (childSamplePools.size() > rowHeight) rowHeight = childSamplePools.size();
            if (childSeqRuns.size() > rowHeight) rowHeight = childSeqRuns.size();


            rowHeights.put(rowCount, rowHeight)
            rowCount++

            output.add([

                    caseFile.id, parentKit.barcode, parentKit.received.toString(), currentTAT,
                    parentKit.state.toString(), (parentKit.microdelState != null) ? parentKit.microdelState.toString() : "no MD ordered" ,
                    combineByField(motherDNASamples, "barcode"), combineByField(motherDNASamples, "prepped"),
                    combineByField(motherStar1Plates, "plateBarcode"), combineByField(motherStar1Plates, "plateCreated"),
                    combineByField(motherBarcodingPcrPlates, "plateBarcode"),combineByField(motherBarcodingPcrPlates, "plateCreated"),
                    combineByField(motherSamplePools, "barcode"), combineByField(motherSamplePools, "created"),
                    combineByField(motherSeqRuns, "runId"), combineByField(motherSeqRuns, "runDate"),

                    combineByField(childPlasmaSamples, "barcode"), combineByField(childPlasmaSamples, "isolation"),
                    combineByField(childDNASamples, "barcode"), combineByField(childDNASamples, "prepped"),
                    combineByField(childLib1Plates, "plateBarcode"), combineByField(childLib1Plates, "plateCreated"),
                    combineByField(childStar1Plates, "plateBarcode"), combineByField(childStar1Plates, "plateCreated"),
                    combineByField(childBarcodingPcrPlates, "plateBarcode"), combineByField(childBarcodingPcrPlates, "plateCreated"),
                    combineByField(childSamplePools, "barcode"), combineByField(childSamplePools, "created"),
                    combineByField(childSeqRuns, "runId"), combineByField(childSeqRuns, "runDate")

            ])


        }
    }
}

println "Total # of kits: " + (output.size() - 1)

def getSeqSamples(def samples) {
    def seqSamples = new ArrayList()
    samples.each {
        seqSamples.addAll(it.sequencingSamples)
    }
    return seqSamples
}
def filterPrepSamples(def sample, def sampleType) {
    def returnSamples = new HashSet()
    def prepSamples = sample.prepSamples
    prepSamples.each { prepSample ->
        if (prepSample.sampleType.name.equals(sampleType)) {
            returnSamples.add(prepSample)
        }
    }
    return returnSamples
}

def getLibPlates(def samples) {
    if (samples != null && !samples.isEmpty()) {
        return libPlateDAO.getSession()
                .createQuery("select distinct plate from LibPlate plate " +
                "join plate.wells well " +
                "join well.sample sample " +
                "where sample in (:samples) " +
                "order by plate.created desc")
                .setParameterList("samples", samples)
                .list()
    }
    return []
}

def getStar1Plates(def samples) {
    if (samples != null && !samples.isEmpty()) {
        return star1PlateDAO.getSession()
                .createQuery("select distinct plate from Star1Plate plate " +
                "join plate.wells well " +
                "join well.sample sample " +
                "where sample in (:samples) " +
                "order by plate.created desc")
                .setParameterList("samples", samples)
                .list()
    }
    return []
}

def getBarcodingPcrPlates(def samples) {
    if (samples != null && !samples.isEmpty()) {
        return barcodingPcrPlateDAO.getSession()
                .createQuery("select distinct plate from BarcodingPCRPlate plate " +
                "join plate.wells well " +
                "join well.sample sample " +
                "where sample in (:samples) " +
                "order by plate.created desc")
                .setParameterList("samples", samples)
                .list()
    }
    return []
}

def getSamplePools(def samples) {
    if (samples != null && !samples.isEmpty()) {
        return samplePoolDAO.getSession()
                .createQuery("select distinct pool from SamplePool pool " +
                "join fetch pool.barcodedSamples barcodedSample " +
                "join fetch barcodedSample.sample sample " +
                "where sample in (:samples) " +
                "order by pool.created desc")
                .setParameterList("samples", samples)
                .list();
    }
    return []
}
def getClarityPlates(def samples, def processType) {

    if (samples != null && !samples.isEmpty()) {
        def sampleBarcodes = []
        samples.each {
            sampleBarcodes.add(it.barcode)
        }
        return clarityPlateDAO.getSession()
                .createQuery("select plate from ClarityPlate plate " +
                "where processType=:processType and sampleBarcode in (:samples) ")
                .setParameterList("processType", processType)
                .setParameterList("samples", sampleBarcodes)
                .list()
    }
    return []
}

def combineByField(def list, String field) {
    def str = ""
    int count = 0;
    list.each {
        count++
        def isLastItem = (count == list.size())
        if (field.equals("barcode")) {
            str += (isLastItem) ? " " + it.barcode : " " + it.barcode + ",\n"
        } else if (field.equals("plateBarcode")) {
            str += (isLastItem) ? " " + it.plateBarcode : " " + it.plateBarcode + ",\n"
        }else if (field.equals("runId")) {
            str += (isLastItem) ? " " + it.runId : " " + it.runId + ",\n"
        } else if (field.equals("created")) {
            str += (isLastItem) ? " " + it.created : " " + it.created + ",\n"
        } else if (field.equals("plateCreated")) {
            str += (isLastItem) ? " " + it.plateCreated : " " + it.plateCreated + ",\n"
        }else if (field.equals("received")) {
            str += (isLastItem) ? " " + it.received : " " + it.received + ",\n"
        } else if (field.equals("prepped")) {
            def prepped = (it.prepped != null) ? it.prepped : "not prepped yet"
            str += (isLastItem) ? " " + prepped : " " + prepped + ",\n"
        } else if (field.equals("runDate")) {
            def runDate = (it.runDate != null) ? it.runDate : "not run yet"
            str += (isLastItem) ? " " + runDate : " " + runDate + ",\n"
        } else if (field.equals("isolation")) {
            def plasmaVolume = getPlasmaVolume(it)
            if (plasmaVolume == null) plasmaVolume = "not isolated yet"
            str += (isLastItem) ? " " + plasmaVolume : " " + plasmaVolume + ",\n"
        }
    }
    return str
}

def getPlasmaVolume(def entity) {
    def auditLogRecords = auditLogRecordDAO.getSession()
            .createQuery("select distinct record from AuditLogRecord record " +
            "where record.entityId = :entityId and record.entityName = :entityName " +
            "and record.entityAttribute = :entityAttribute and record.message = :message " +
            "and record.newValue IS NOT NULL order by record.id desc ")
            .setParameter("entityId", entity.getId())
            .setParameter("entityName", entity.getClass().getSimpleName())
            .setParameter("entityAttribute", "plasmaVolume")
            .setParameter("message", "update")
            .list();

    if (auditLogRecords.size() > 0) {
        return auditLogRecords[0].timestamp.toString()
    } else {
        return "n/a"
    }
}

def subject = "TAT Report"
def body = "TAT Report from LIMS attached."
def filename = "TAT_report.xlsx"

def wb = new XSSFWorkbook()
def sheet = wb.createSheet("TAT Report")

output.eachWithIndex { r, i ->
    def row = sheet.createRow((short) i)
    r.eachWithIndex { c, j ->
        def cs = wb.createCellStyle()
        cs.setWrapText(true)

        def cell = row.createCell(j)
        cell.setCellValue(c == null ? "" : c)
        cell.setCellStyle(cs)
    }
    float newHeight = sheet.getDefaultRowHeightInPoints() * rowHeights.get(i)
    row.setHeightInPoints(newHeight)

}

for (def i = 0; i < header.size(); i++) {
    sheet.autoSizeColumn(i)
}

def outStream = new ByteArrayOutputStream()
try {
    wb.write(outStream)
    secureEmailSender.send(toAddresses as List, subject as String, body as String, filename as String, outStream.toByteArray(), false as Boolean)
} finally {
    outStream.close()
}
'
WHERE id = 46;

UPDATE `prodlims`.`script`
SET code = 'def prefix = "Report for new PGD cases"

def body = "Report for new PGD cases"

def sql = """select c.id as CaseFile, c.testtype as TestType, c.opened from casefile c where c.opened > curdate() and c.testtype in (''PRODUCT_1'', ''PRODUCT_1_2'', ''SINGLE_GENE_PLUS_21'')"""

wb = sqlReportService.createWorkbook("${prefix}",sql,true)
sqlReportService.emailWorkbook(java.util.Arrays.asList(toAddresses),"${prefix}", body, "${prefix}.xlsx", wb)'
WHERE id = 47;

UPDATE `prodlims`.`script`
SET code = 'def prefix = "LIMS Report for Cases Worked"

def body = "Number of cases worked on by each person"

def sql = """select s.id, s.created, u.email, cn.CaseFile_id, c.testtype from note s join user u on s.user_id = u.id join casefile_note cn
on s.id = cn.notes_id join casefile c on cn.CaseFile_id = c.id	
where u.email = ''${user}'' and s.created between ''${fromDate}'' and ''${toDate}''"""

wb = sqlReportService.createWorkbook("${prefix}",sql,true)
sqlReportService.emailWorkbook(java.util.Arrays.asList(toAddresses),"${prefix}", body, "${prefix}.xlsx", wb)'
WHERE id = 48;

UPDATE `prodlims`.`script`
SET code = 'import com.natera.lims.datamodel.ivf.FamilyPosition
import org.apache.poi.xssf.usermodel.XSSFWorkbook
import com.natera.lims.datamodel.ivf.prod.*;

/*
 * 9/15/2015 Script modified by Nathan Fleming to retrieve ALL child samples for patient (across cases)
 */
output = []

def header = ["Case", "Sample", "FamilyPosition", "StorageName/Lib2Plate", "IndexLocation"]
output.add(header)

caseFileIds.each { caseFileId ->

    def caseFile = caseFileDAO.get(caseFileId)
    if (caseFile != null) {
        def motherSamples = caseFile.family?.getMember(FamilyPosition.patient)?.samples
        def motherDNASamples = (motherSamples != null) ? filterPrepSamples(motherSamples, SampleType.DNA) : null
        addSamplesToOutput(caseFileId, FamilyPosition.patient.formName, motherSamples)
        addSamplesToOutput(caseFileId, FamilyPosition.patient.formName, motherDNASamples)
		
		def fatherSamples = caseFile.family?.getMember(FamilyPosition.partner)?.samples
        def fatherDNASamples = (fatherSamples != null) ? filterPrepSamples(fatherSamples, SampleType.DNA) : null
        addSamplesToOutput(caseFileId, FamilyPosition.partner.formName, fatherSamples)
        addSamplesToOutput(caseFileId, FamilyPosition.partner.formName, fatherDNASamples)
		
		def childPlasmaSamples = (motherSamples != null) ? filterPrepSamples(motherSamples, SampleType.PLASMA) : null
		def childDNASamples = (childPlasmaSamples != null) ? filterPrepSamples(childPlasmaSamples, SampleType.DNA) : null
        addSamplesToOutput(caseFileId, FamilyPosition.child.formName, childPlasmaSamples)
        addChildDNASamplesToOutput(caseFileId, FamilyPosition.child.formName, childDNASamples)
    }

}

def filterPrepSamples(def samples, def sampleType) {
    def returnSamples = new HashSet<Sample>()
    samples.each { sample ->
        def prepSamples = sample.prepSamples
        prepSamples.each { prepSample ->
            if (prepSample.sampleType.name.equals(sampleType)) {
                returnSamples.add(prepSample)
            }
        }
    }
    return returnSamples
}

def addSamplesToOutput(def caseFileId, def familyPosition, def samples) {
    if (samples != null) {
        samples.each { sample ->
            def locations = sampleContainerDAO.getStorageLocations(sample)
            if (locations.size() != 0) {
                locations.each { location ->
                    def container = location.get("container")
                    def indexLocation = location.get("indexLocation")
                    output.add([caseFileId, sample.barcode, familyPosition, container.barcode, indexLocation])
                }
            } else {
                output.add([caseFileId, sample.barcode, familyPosition, "", ""])
            }
        }
    }
}

/* Find Lib2 plates for child DNA samples */
def addChildDNASamplesToOutput(def caseFileId, def familyPosition, def samples) {
    if (samples != null) {
        samples.each { sample ->
            def lib2Plates = lib2PlateDAO.getPlatesBySample(sample)
            lib2Plates.each { lib2Plate ->
                def wells = lib2Plate.wells
                def position = null
                for (def entry : wells.entrySet()) {
                    def pws = entry.getValue()
                    if (pws.sample == sample) {
                        position = entry.getKey()
                    }
                }

                position = indexToLocation(position)
                output.add([caseFileId, sample.barcode, familyPosition, lib2Plate.barcode, position])

            }
			if(!lib2Plates) {
			  def ss = sample.completedSequencingSamples[0]
			  if(ss) {
			    def plates = ss.clarityPlateMetaData
				for(def plate : plates) {
				  // if plate name ends in -LIB2
				  if(plate.plateBarcode.endsWith(''-LIB2'')) {
				    output.add([caseFileId, sample.barcode, familyPosition, plate.plateBarcode, plate.wellPosition.replace(":", "")])
				    break
				  }
				}
			  }
			}
        }
    }
}

def String indexToLocation(int i) {
    int rows = 8
    if (rows == 0) rows = 1
    StringBuilder ret = new StringBuilder()
    ret.append((char) (((int) ''A'') + (i % rows)))
    int position = ((int) (i / rows)) + 1
    if (position < 10) ret.append(0)
    ret.append(position)
    return ret.toString()
}

/* Output:
Case
Sample Barcode
Family Position
Container Name / Lib2Plate
Index Location
*/

def subject = "Case Sample Locations Report"
def body = "Case sample locations report from LIMS attached."
def filename = "case_sample_locations_report.xlsx"

def wb = new XSSFWorkbook()
def sheet = wb.createSheet("R&D Sample Disposal Report")

output.eachWithIndex { r, i ->
    def row = sheet.createRow((short) i)
    r.eachWithIndex { c, j ->
        def cs = wb.createCellStyle()
        cs.setWrapText(true)
        def cell = row.createCell(j)
        cell.setCellValue(c == null ? "" : c)
        cell.setCellStyle(cs)
    }
}

def outStream = new ByteArrayOutputStream()

try {
    wb.write(outStream)
    secureEmailSender.send(toAddresses as List, subject as String, body as String, filename as String, outStream.toByteArray(), false as Boolean)
} finally {
    outStream.close()
}'
WHERE id = 50;

UPDATE `prodlims`.`script`
SET code = '
/*
 * ENG-4732: Generate a report of cases which have been sent out to SoftFile for ODE
 * and which may be redraws of previous cases.
 *
 * Version 1.2, 2/24/2016: include Horizon cases (ENG-4857, dparsons@natera.com)
 * Version 1.1, 2/17/2016: fixed estimated delivery date comparison (ENG-4795, dparsons@natera.com)
 * Version 1.0.1, 2/11/2016: fixed stdout message (dparsons@natera.com)
 * Version 1.0, 2/4/2016 (dparsons@natera.com)
 */

import com.natera.lims.datamodel.core.ODEBatch
import com.natera.lims.datamodel.core.TestType
import com.natera.lims.datamodel.ivf.prod.CaseFile
import org.apache.poi.ss.usermodel.CellStyle
import org.apache.poi.ss.usermodel.Font
import org.apache.poi.ss.usermodel.Hyperlink
import org.apache.poi.ss.usermodel.IndexedColors
import org.apache.poi.xssf.usermodel.XSSFWorkbook
import org.joda.time.LocalDate
import org.joda.time.format.DateTimeFormat

def MAX_EDD_DIFF = 30 * 24 * 60 * 60 * 1000L  // 30 days in milliseconds

def inputFormat = DateTimeFormat.forPattern("MM/dd/yyyy")
def today = new LocalDate()

// Script parameters, with defaults.
def toAddresses = toAddresses ?: ["dparsons@natera.com"]
def startDate = startDate ? LocalDate.parse(startDate, inputFormat) : today.minusDays(1)  // default to start of day yesterday
def endDate = endDate ? LocalDate.parse(endDate, inputFormat) : today  // default to end of day yesterday

def start = startDate.toString(inputFormat)
def end = endDate.toString(inputFormat)
def range = "$start - $end"

if (!endDate.isAfter(startDate)) {
    return "Warning: date range $range must span at least 1 day"
}

def now = new Date()
def filename = "ode_redraw_report_${now.format("yyyyMMdd_HHmmss")}.xlsx"

def subject = "ODE Redraw Report for $range"
def bodyPrefix = "${subject}.\ngenerated on ${now.format("MM/dd/yyyy @HH:mm:ss")}\n\n"
def bodySuffix = "\nSee attached report \"$filename\"."
def body = bodyPrefix

def wb = new XSSFWorkbook()

def linkStyle = wb.createCellStyle()
def hlinkFont = wb.createFont()
hlinkFont.setUnderline(Font.U_SINGLE)
hlinkFont.setColor(IndexedColors.BLUE.getIndex())
linkStyle.setFont(hlinkFont)
linkStyle.setAlignment(CellStyle.ALIGN_CENTER)

def headerStyle = wb.createCellStyle()
def boldFont = wb.createFont()
boldFont.setBoldweight(Font.BOLDWEIGHT_BOLD)
headerStyle.setFont(boldFont)
headerStyle.setAlignment(CellStyle.ALIGN_CENTER)

def wrapStyle = wb.createCellStyle()
wrapStyle.setWrapText(true)
wrapStyle.setAlignment(CellStyle.ALIGN_CENTER)

def header = ["ODE batch #", "Date sent", "ODE case #", "ODE case test", "Previous draw #", "Previous draw test"]

def sheet = wb.createSheet("ODE Redraws")
sheet.createFreezePane(0, 1)  // lock the header row

def sqlFormat = DateTimeFormat.forPattern("yyyy-MM-dd")
def batches = new HashSet<ODEBatch>()

batches.addAll(caseFileDAO.session
        .createQuery("FROM ODEBatch " +
        "WHERE filesent IS NOT NULL " +
        "  AND filesent >= :startDate " +
        "  AND filesent < :endDate")
        .setParameterList("startDate", startDate.toString(sqlFormat))
        .setParameterList("endDate", endDate.toString(sqlFormat))
        .list())

def batchCount = batches.size()
def suffix = batchCount == 1 ? "" : "es"
println "Found ${batchCount} ODE batch${suffix} sent to SoftFile between ${start} and ${end}" + (batchCount > 0 ? ":" : ".")

def output = []

batches.sort { a, b -> a.id <=> b.id }.each { batch ->
    def batchSize = batch.entries.size()
    suffix = batchSize == 1 ? "" : "s"
    println "    batch #${batch.id} (sent at ${batch.fileSent.format("MM/dd/yyyy HH:mm:ss")}): ${batchSize} case${suffix}"

    batch.entries.each { entry ->
        def odeCase = caseFileDAO.getById(entry.caseId)
        def patient = odeCase.patient

        // These can all be null, e.g. if the data from SoftFile hasn''t been loaded yet.
        if (patient.firstname != null && patient.lastname != null
                && patient.dateOfBirth != null && odeCase.clinicName != null) {

            def redraws = new HashSet<CaseFile>()
            redraws.addAll(caseFileDAO.session.createQuery(
                    "SELECT DISTINCT cf FROM CaseFile cf" +
                            "      LEFT JOIN cf.family f" +
                            "      LEFT JOIN f.members s" +
                            "          WHERE cf.id != :id" +
                            "            AND cf.testType IN (''NPT'', ''CARRIER_SCREENING_2'')" +
                            "            AND s.firstname = :first" +
                            "            AND s.lastname = :last" +
                            "            AND s.dateOfBirth = :dob" +
                            "            AND cf.clinic = :clinic")
                    .setParameter("id", odeCase.id)
                    .setParameter("first", patient.firstname)
                    .setParameter("last", patient.lastname)
                    .setParameter("dob", patient.dateOfBirth)
                    .setParameter("clinic", odeCase.clinic)
                    .list())

            if (redraws.size() > 0) {
                def odeTest = odeCase.testType.marketingName
                def odeEDD = getEDD(odeCase)
                def redrawFound = false
                def row = [batch.id,
                           batch.fileSent.format("MM/dd/yyyy HH:mm:ss"),
                           odeCase.id,
                           odeTest]

                redraws.sort { a, b -> a.id <=> b.id }.each { rd ->

                    // Don''t report if the cases are already linked (this applies in particular to combo cases).
                    if (!odeCase.linkedCaseFiles.contains(rd) || !rd.linkedCaseFiles.contains(odeCase)) {

                        def redrawEDD = getEDD(rd)
                        if (odeEDD == null || redrawEDD == null || Math.abs(redrawEDD.time - odeEDD.time) <= MAX_EDD_DIFF) {
                            redrawFound = true
                            def redrawTest = rd.testType.marketingName
                            println "        ${odeTest} case #${entry.caseId}: potential redraw of ${redrawTest} case #${rd.id}"
                            row.add(rd.id)
                            row.add(redrawTest)
                        }
                    }
                }
                if (redrawFound) {
                    output.add(row)
                }
            }
        }
    }
}

private Date getEDD(casefile) {
    return ((casefile.testType != TestType.NPT || casefile.parentKits == null || casefile.parentKits.size() == 0)
            ? null
            : casefile.parentKits.first().expectedBirthDate)
}

def n = output.size()
def msg = (n == 1
        ? "Found 1 case which is a potential redraw.\n"
        : "Found $n cases which are potential redraws.\n")
body += msg
print "\n${msg}"

// Sort by batch id, then test type (Pano first), then case id.
output = output.sort { a, b -> a[0] <=> b[0] ?: b[3] <=> a[3] ?: a[2] <=> b[2] }

output.add(0, header)
def maxColumnCount = 0

output.eachWithIndex { r, i ->
    def row = sheet.createRow((short) i)

    r.eachWithIndex { c, j ->
        if (i == 0 || (j != 2 && j != 4)) {  // cols 2 and 4 are extranet links
            def cell = row.createCell(j)
            cell.setCellValue(c == null ? "" : c)
            cell.setCellStyle(i == 0 ? headerStyle : wrapStyle)  // header line in bold font
        }
        if (i > 0 && (j == 2 || j == 4)) {
            def caseId = c
            def caseIdCell = row.createCell(j)
            def limsLink = wb.creationHelper.createHyperlink(Hyperlink.LINK_URL)
            limsLink.setAddress("http://lims/extranet/app/case/referral?caseId=$caseId")
            caseIdCell.setCellValue(caseId)
            caseIdCell.setHyperlink(limsLink)
            caseIdCell.setCellStyle(linkStyle)
        }
    }

    if (r.size() > maxColumnCount) maxColumnCount = r.size()
}

(0..maxColumnCount).each { sheet.autoSizeColumn(it) }

body += bodySuffix

def devmode = false

if (devmode) {
    def localFile = new File("/Users/dparsons/projects/ODE/excel_test", filename)  // localhost
    //def localFile = new File("/data/home/dparsons/ODE/excel_test", filename)  // stage-ygal
    def localFileOut = new FileOutputStream(localFile)
    try {
        wb.write(localFileOut)
    } finally {
        localFileOut.close()
    }
    return "Report written to $localFile."
} else {
    def outStream = new ByteArrayOutputStream()
    try {
        wb.write(outStream)
        secureEmailSender.send(toAddresses as List, subject as String, body as String,
                filename as String, outStream.toByteArray(), false as Boolean)
    } finally {
        outStream.close()
    }
    return "Report \"$filename\" sent to ${toAddresses.join(", ")}."
}
'
WHERE id = 54;

UPDATE `prodlims`.`script`
SET code = '

import com.natera.lims.datamodel.ivf.prod.*;
import com.natera.lims.datamodel.ivf.*;
cf = caseFileDAO.get(CaseFileID.toLong())

subjectToAssign = cf.family.getMember(FamilyKey.getKey(com.natera.lims.datamodel.ivf.FamilyPosition.patient), false)

pks = cf.getParentKits()


pks.each{
  
  pk ->
  
 samples = pk.samples
  
  samples.each{
    
    sample ->
    
    sample.subject = subjectToAssign
    
println "Subject ID ${subjectToAssign.id} assigned to sample ${sample.getBarcode()} from Parent Kit ${pk.getBarcode()}"
  }
  
}
'
WHERE id = 57;

UPDATE `prodlims`.`script`
SET code = '

import com.natera.lims.datamodel.ivf.prod.*;
import com.natera.lims.datamodel.ivf.*;
import com.natera.lims.datamodel.horizon.report.*;
import com.natera.lims.service.horizon.*;
def cf
def pk
def state
def found = 0
cf = caseFileDAO.get(CaseFileID.toLong())


println "${diseaseToPutUnderReview}"

println "${state}"

println "${cf.id}"

cf.reportDiseaseResults.each{

  reportDiseaseResult ->


    if(reportDiseaseResult.gene.equalsIgnoreCase(diseaseToPutUnderReview))
       {
         found = 1
         if(state.equalsIgnoreCase("CLS"))
         {
           reportDiseaseResult.status = LimsState.HORIZON_DISEASE_NEEDS_REVIEW
           println "${reportDiseaseResult.gene} is now under CLS review for case ${cf.id}"
           
         }
         if(state.equalsIgnoreCase("GC"))
         {
         reportDiseaseResult.status = LimsState.HORIZON_DISEASE_NEEDS_GC_REVIEW
         println "${reportDiseaseResult.gene} is now under GC review for case ${cf.id}"

         }
       }




}

if(found == 0)
  {

   println "Disease Gene not found, please check for correct gene code or the disease is not in the panel"
  }

pk = cf.getParentKitForHorizon()
state = horizonParentKitWorkflowService.determineCorrectKitState(pk)

if(!(pk.state == state))
  {

    println "${cf.id} current state ${pk.state} expected state ${state}"

   pk.state = state

   println "${cf.id} current state ${pk.state}"

  }

//states PICK BETWEEN ''CLS'' and ''GC''


 '
WHERE id = 60;

