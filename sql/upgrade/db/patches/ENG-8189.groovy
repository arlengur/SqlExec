package groovy

import com.natera.lims.api.model.core.OrganizationDepartment

/**
 * Run this script after liquibase procedure
 */

import com.natera.lims.api.model.core.OrganizationDepartment
import org.apache.commons.lang.StringUtils
import org.apache.poi.ss.usermodel.Cell
import org.apache.poi.ss.usermodel.Row
import org.apache.poi.xssf.usermodel.XSSFCell
import org.apache.poi.xssf.usermodel.XSSFSheet
import org.apache.poi.xssf.usermodel.XSSFWorkbook


InputStream ExcelFileToRead = new FileInputStream(new File("/Users/mikhail/CSSI as of 4-2-2018.xlsx"))
XSSFWorkbook wb = new XSSFWorkbook(ExcelFileToRead)

XSSFSheet ws = wb.getSheetAt(0)
Iterator<Row> rowIterator = ws.rowIterator()
int skipRows = 2

println "select id into @user_id from `user` where email='admin@genesecurity.net';"

while (rowIterator.hasNext()) {
    Row row = rowIterator.next()

    if (row.getRowNum() < skipRows) continue

    Cell clinicIdCell = row.getCell(COLUMN.CLINIC_ID.rowNum)
    int clinicId = getCellValue(clinicIdCell)

    Cell instructionCell = row.getCell(COLUMN.INSTRUCTION.rowNum)
    String instruction = instructionCell.getStringCellValue()

    Cell updatedInstructionCell = row.getCell(COLUMN.UPDATED_INSTRUCTION.rowNum)
    String updatedInstruction = updatedInstructionCell.getStringCellValue()

    Cell accessioningDepartmentCell = row.getCell(COLUMN.DEP_ACCESSIONING.rowNum)
    String accessioningDepartment = getCellValue(accessioningDepartmentCell)

    Cell billingDepartmentCell = row.getCell(COLUMN.DEP_BILLING.rowNum)
    String billingDepartment = getCellValue(billingDepartmentCell)

    Cell gcDepartmentCell = row.getCell(COLUMN.DEP_GC.rowNum)
    String gcDepartment = getCellValue(gcDepartmentCell)

    Cell supportDepartmentCell = row.getCell(COLUMN.DEP_SUPPORT.rowNum)
    String supportDepartment = getCellValue(supportDepartmentCell)

    Cell reportingDepartmentCell = row.getCell(COLUMN.DEP_REPORTABLE.rowNum)
    String reportingDepartment = getCellValue(reportingDepartmentCell)

    if (!isInsertableDepartment(accessioningDepartment)
            && !isInsertableDepartment(billingDepartment)
            && !isInsertableDepartment(gcDepartment)
            && !isInsertableDepartment(supportDepartment)
            && !isInsertableDepartment(reportingDepartment)) {
        // skip INSTRUCTION, see file comment
        continue
    }


    println(String.format("INSERT INTO `organization_instruction` (organization_id, last_modified_user_id, instruction, expiration_date, created, last_modified_at) VALUES(%s, @user_id, '%s', null, current_timestamp, current_timestamp);", clinicId,
            StringUtils.isNotBlank(updatedInstruction) ? updatedInstruction.trim().replaceAll("\n", " ").replaceAll("'", "''") : instruction.trim().replaceAll("\n", " ").replaceAll("'", "''")))

    if (isInsertableDepartment(accessioningDepartment)) {
        println(getDepInsert(OrganizationDepartment.ACCESSIONING))
    }
    if (isInsertableDepartment(billingDepartment)) {
        println(getDepInsert(OrganizationDepartment.BILLING))
    }
    if (isInsertableDepartment(gcDepartment)) {
        println(getDepInsert(OrganizationDepartment.GC))
    }
    if (isInsertableDepartment(supportDepartment)) {
        println(getDepInsert(OrganizationDepartment.CUSTOMER_SUPPORT))
    }
    if (isInsertableDepartment(reportingDepartment)) {
        println(getDepInsert(OrganizationDepartment.REPORTING))
    }
}

static boolean isInsertableDepartment(departmentValue) {
    return StringUtils.isBlank(departmentValue) || departmentValue.trim().equalsIgnoreCase("y")
}

static def getCellValue(Cell cell) {
    if (cell.getCellType() == XSSFCell.CELL_TYPE_STRING) {
        return cell.getStringCellValue()
    } else if (cell.getCellType() == XSSFCell.CELL_TYPE_NUMERIC) {
        return cell.getNumericCellValue()?.intValue()
    }
    return null
}

static String getDepInsert(OrganizationDepartment department) {
    return "INSERT INTO `organizationinstruction_department` (organizationinstruction_id, department) VALUES(LAST_INSERT_ID(), '${department}');"
}

enum COLUMN {
    CLINIC_ID(0),
    CLINIC_NAME(1),
    DEP_ACCESSIONING(2),
    DEP_BILLING(3),
    DEP_GC(4),
    DEP_SUPPORT(5),
    DEP_REPORTABLE(6),
    LABEL(7),
    INSTRUCTION(8),
    UPDATED_INSTRUCTION(9)

    COLUMN(int row) {
        rowNum = row
    }

    int rowNum
}