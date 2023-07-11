*** Settings ***
Resource        POM/Keywords/Pages/admin_labor_attaches.resource
Resource        POM/Keywords/Pages/base.resource
Resource        POM/Keywords/Modules/admin_base_actions.resource
Variables       Resources/Variables/SuccessMessage.py
Variables       Resources/Variables/ErrorMessage.py
Variables       POM/Locators/AdminLaborAttachesLocators.py


*** Keywords ***
Test Create New Attache
    Admin Labor Attache Actions




Admin Labor Attache Actions
    Open Admin Labor Attaches Page
    Wait Spinners To Disappear
    Wait For Elements State     ${LABOR_ATTACHES_TEXT}       visible