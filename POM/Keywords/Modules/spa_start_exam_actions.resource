*** Settings ***
Resource        POM/Keywords/Pages/base.resource
Resource        POM/Keywords/Modules/spa_actions.resource
Resource        POM/Keywords/Pages/spa_start_exam.resource
Resource        POM/Keywords/Modules/spa_exam_session_actions.resource
Resource        POM/Keywords/Modules/spa_upload_actions.resource
Variables       POM/Locators/SPAStartExamLocators.py


*** Keywords ***
Test Add Reservation With Valid Data
    Test Check Ability Add New Session
    Add Individual Labor    entity=tcenter