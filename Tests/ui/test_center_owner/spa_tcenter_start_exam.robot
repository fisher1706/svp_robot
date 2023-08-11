*** Settings ***
Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/spa_start_exam_actions.resource

Test Setup    Open Chrome Browser


*** Variables ***
${PASSWORD}         CH4450103
${RESERVATION}      5Q85TR


*** Test Cases ***
Verify Ability To Check Reservation Info With Valid Data
    Test Add Reservation With Valid Data

Verify Ability To Check Reservation Info With Invalid Passport Number
    Test Add Reservation With Invalid Data      passport=${PASSWORD}

Verify Ability To check Reservation Info With Invalid Reservation Number
    Test Add Reservation With Invalid Data      reservation=${RESERVATION}

Verify Ability To Check Reservation Info With Invalid Reservation And Passport Number
    Test Add Reservation With Invalid Data      passport=${PASSWORD}        reservation=${RESERVATION}

Checking Ability To Pass Second Step Terms And Conditions
    Test Add Reservation With Valid Data    agreement=True

Checking Ability To Pass Second Step Without Agreed With Terms And Conditions
    Test Add Reservation With Valid Data    agreement=False
