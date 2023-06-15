*** Settings ***
Library         Browser
Library         Libraries/Utils.py
Resource        POM/Keywords/Modules/base_actions.resource
Resource        POM/Keywords/Modules/spa_actions.resource
Variables       POM/Locators/SPAAssessorsLocators.py


*** Keywords ***
Click Assessors
    Click Button    ${BTN_ASSESSORS}

Click Icon View
    Hover       ${ACTIONS}
    Click Button    ${ICON_VIEW_ACTION}

Click Adress
    Click Button    ${ADDRESS}

Click Other Details
    Click Button    ${OTHER_DETAILS}

Click Back
    Click Button    ${BTN_BACK}

Click View Passport
    Click Button    ${VIEW_PASSPORT}

Click Filter
    Click Button    ${FILTER}

Click Apply
    Click Button    ${BTN_APPLY}

Click Clear Filter
    Click Button    ${BTN_CLEAR_FILTER_ASSESSORS}
