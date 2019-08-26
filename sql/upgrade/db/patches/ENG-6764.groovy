

/* Should run this after release of Horizon LDT Phase 1 Project. Will add a CS3 pricing plan to organizations with existing CS2 pricing plan. The new CS3
 * pricing plan for the organization will have the same billToType as its CS2 pricing plan */


import com.natera.lims.api.model.core.*;
import com.natera.lims.datamodel.core.*;
import org.joda.time.*;

def today = new LocalDate()
def date = today.toDate()
def cs3StandardPricingPlan = pricingPlanDAO.getByNameAndTestType("Standard", TestType.CARRIER_SCREENING_3);
def cs3IntlPricingPlan = pricingPlanDAO.getByNameAndTestType("International", TestType.CARRIER_SCREENING_3);

def clinics = organizationDAO.getSession()
        .createQuery(
        "SELECT DISTINCT o FROM Organization o WHERE o.deleted IS FALSE")
        .list();

clinics.each { clinic ->

    def cs2Opp = clinic.getOrganizationPricingPlan(TestType.CARRIER_SCREENING_2, date)
    def cs3Opp = clinic.getOrganizationPricingPlan(TestType.CARRIER_SCREENING_3, date)

    if (cs2Opp == null) {
        println "clinic " + clinic.id + " has no CS2 pricing plan. No need for an update."
    } else if (cs2Opp != null && cs3Opp == null) {

        def newCS3PricingPlan = null;
        switch (cs2Opp.pricingPlan.name) {
            case "Standard":
                newCS3PricingPlan = cs3StandardPricingPlan
                break;
            case "International":
                newCS3PricingPlan = cs3IntlPricingPlan
                break;
        }

        if (newCS3PricingPlan != null) {
            def opp = new OrganizationPricingPlan();
            opp.setPricingPlan(newCS3PricingPlan);
            opp.setValidFrom(date);
            opp.setBillToType(cs2Opp.billToType);
            clinic.getOrganizationPricingPlans().add(opp);
            organizationDAO.update(clinic);
            println "successfully updated clinic " + clinic.id + " with CS3 pricing plan with name " + newCS3PricingPlan.name
        } else {
            println "did not find a CS3 pricing plan for clinic " + clinic.id + " with CS2 pricing plan with name " + cs2Opp.pricingPlan.name
        }

    }
}