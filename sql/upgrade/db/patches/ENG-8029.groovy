/**
 * Run this script to add Vistara pricing plan to organizations with existing NPT pricing plan.
 * - set the start date to March 5, 2018.
 * - for Domestic Clinic (US country), set to Standard Pricing Plan and Bill to Insurance
 * - for International Clinics (non-US country), set to International Pricing Plan and Bill to Clinic
 */

import com.natera.lims.api.model.core.BillToType
import com.natera.lims.api.model.core.TestType
import com.natera.lims.datamodel.core.OrganizationPricingPlan
import org.joda.time.LocalDate;

def today = new LocalDate().toDate();
def snvDate = new LocalDate(2018, 3, 5).toDate();

def snvStandardPricingPlan = pricingPlanDAO.getByNameAndTestType("Standard", TestType.SNV_SENDOUT);
def snvIntlPricingPlan = pricingPlanDAO.getByNameAndTestType("International", TestType.SNV_SENDOUT);

def clinics = organizationDAO.getSession()
        .createQuery(
        "SELECT DISTINCT o FROM Organization o WHERE o.deleted IS FALSE")
        .list();

clinics.each { clinic ->

    def nptOpp = clinic.getOrganizationPricingPlan(TestType.NPT, today)
    def snvOpp = clinic.getOrganizationPricingPlan(TestType.SNV_SENDOUT, today)

    if (nptOpp == null) {
        println "clinic " + clinic.id + " has no NPT pricing plan. No need for an update."
    } else if (nptOpp != null && snvOpp == null) {
        def opp = new OrganizationPricingPlan();
        opp.setValidFrom(snvDate);

        def country = clinic.getAddress()?.getCountry();
        if (country == null || country.equals("USA") || country.equals("US")) {
            opp.setPricingPlan(snvStandardPricingPlan);
            opp.setBillToType(BillToType.INSURANCE);
        } else {
            opp.setPricingPlan(snvIntlPricingPlan);
            opp.setBillToType(BillToType.CLINIC);
        }
        clinic.getOrganizationPricingPlans().add(opp);
        organizationDAO.update(clinic);
        if(country == null) {
            country = "unknown";
        }
        println "successfully updated clinic " + clinic.id + ", country " + country + ", with Vistara pricing plan with name " + opp.getPricingPlan().getName();
    } else {
        println "Clinic " + clinic.id + " already have a Vistara pricing plan";
    }
}
println();