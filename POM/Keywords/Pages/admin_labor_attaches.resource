*** Settings ***
Resource            POM/Keywords/Pages/base.resource
Resource            POM/Keywords/Modules/base_actions.resource
Variables           POM/Locators/AdminLaborAttachesLocators.py


*** Keywords ***
Open Admin Labor Attaches Page
    Open Page    base_url=${ADMIN_URL}    page_url=labor-attaches