*** Settings ***
Resource            POM/Keywords/Pages/base.resource
Resource            POM/Keywords/Modules/base_actions.resource
Variables           POM/Locators/AdminInvoiceHistoryPageLocators.py


*** Keywords ***
Open Admin Invoice History Page
    Open Page    base_url=${ADMIN_URL}    page_url=invoice-history

Choose Item Actions
    Hover       ${LAST_ACTION}
    Click Button        ${ICON_EYE}
