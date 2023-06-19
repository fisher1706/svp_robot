*** Settings ***
Resource        POM/Keywords/Pages/admin_categories.resource
Resource        POM/Keywords/Pages/base.resource


*** Keywords ***
Test Ability Add Category
    Admin Categories Actions







Admin Categories Actions
    Open Admin Categories Page
    Wait Spinners To Disappear
    Wait For Elements State     ${CATEGORIES_TEXT}       visible