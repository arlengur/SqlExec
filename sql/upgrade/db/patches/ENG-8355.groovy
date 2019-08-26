/**
 * Run this script after running script LV-1453
 */

import com.natera.lims.datamodel.ivf.prod.*;

def caseFiles = (List<CaseFile>) caseFileDAO.getSession().createSQLQuery("select distinct cf.* from casefile cf " +
        " join parentkit pk on cf.id = pk.casefile_id " +
        " join parentkit_sample pks on pks.parentkit_id = pk.id " +
        " join sample s on s.id = pks.sample_id " +
        " where pk.state = 'HORIZON_KIT_REPORT_SENT' " +
        " and cf.testtype = 'CARRIER_SCREENING_3'" +
        " and s.state = 'SAMPLE_SENT_TO_LV'").addEntity(CaseFile.class).list();

caseFiles.each {
    LVSampleDisposalService.notifyLVForCaseReport(it)
}