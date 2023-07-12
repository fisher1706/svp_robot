*** Settings ***
Resource            POM/Keywords/Pages/base.resource
Resource            POM/Keywords/Modules/base_actions.resource
Variables           POM/Locators/AdminCsvHistoryPageLocators.py


*** Keywords ***
Open Admin Csv History Page
    Open Page    base_url=${ADMIN_URL}    page_url=csv-history

Choose Item Actions
    Hover       ${LAST_ACTION}
    Click Button        ${ICON_EYE}
