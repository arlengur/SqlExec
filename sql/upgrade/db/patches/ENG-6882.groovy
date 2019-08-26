import org.codehaus.groovy.runtime.InvokerHelper

import com.natera.lims.api.model.core.TestType
import com.natera.lims.datamodel.ivf.report.ReportFormat

organizationDAO.getAll().each {c->
    def formats = c.reportFormats
    //If there's a CS2 format and no existing CS3 format...
    if (formats.containsKey(TestType.CARRIER_SCREENING_2) && !formats.containsKey(TestType.CARRIER_SCREENING_3)) {
        def cs2RF = formats[TestType.CARRIER_SCREENING_2]
        def cs3RF = new ReportFormat()

        //copy settings from CS2 format into the CS3 ReportFormat
        InvokerHelper.setProperties(cs3RF, cs2RF.properties)
        cs3RF.xslTemplateFile = 'HorizonLdtReport-XSLFO'
        organizationDAO.session.save(cs3RF)
        formats.put(TestType.CARRIER_SCREENING_3, cs3RF)
    }
}