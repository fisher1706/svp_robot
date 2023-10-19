*** Settings ***
Resource        POM/Keywords/Pages/spa_assessors_registration.resource
Library         Resources/DataSources/models/ModelBuilder.py
Variables       Resources/Variables/DirPath.py
Variables       Resources/Variables/WarningMessage.py
Variables       Resources/Variables/AssessorsData.py


*** Keywords ***
Test Ability Open Terms And Conditions Page Page
    ${assessor}=   Create New Random Assessor
    Registeration As Assessors Into SVP
    Fill Form Basic Information     assessor=${assessor}
    Click Btn Continue
    Fill Form Address       assessor=${assessor}
    Click Btn Continue
    Fill Form Other Details     assessor=${assessor}
    Click Terms And Conditions
    Verify Terms Of Use

Test Ability Pass Step 3 Without Agree On Terms And Conditions
    ${assessor}=   Create New Random Assessor
    Registeration As Assessors Into SVP
    Fill Form Basic Information     assessor=${assessor}
    Click Btn Continue
    Fill Form Address       assessor=${assessor}
    Click Btn Continue
    Fill Form Other Details     assessor=${assessor}
    Verify Button Submit Request Inactive

Test Ability Interrupt Registration Step 1
    ${assessor}=   Create New Random Assessor
    Registeration As Assessors Into SVP
    Fill Form Basic Information     assessor=${assessor}
    Click Btn Back
    Verify Check Certificate And Exam Result Visible

Test Ability Pass Step 1 With Incorrect Required Fields
    ${assessor}=   Create New Random Assessor
    ...     email=${REGISTERED_EMAIL}
    ...     cnic=${REGISTERED_CNIC}
    Registeration As Assessors Into SVP
    Fill Form Basic Information     assessor=${assessor}
    Click Btn Continue
    Verify Error Messages

Test Ability Interrupt Registration Step 2
    ${assessor}=   Create New Random Assessor
    Registeration As Assessors Into SVP
    Fill Form Basic Information     assessor=${assessor}
    Click Btn Continue
    Fill Form Address       assessor=${assessor}
    Click Btn Back
    Verify Check Certificate And Exam Result Visible

Test Ability Interrupt Registration Step 3
    ${assessor}=   Create New Random Assessor
    Registeration As Assessors Into SVP
    Fill Form Basic Information     assessor=${assessor}
    Click Btn Continue
    Fill Form Address       assessor=${assessor}
    Click Btn Continue
    Fill Form Other Details     assessor=${assessor}
    Click Btn Back
    Verify Check Certificate And Exam Result Visible

Test Ability Pass Step 1 With Empty Required Fields
    Registeration As Assessors Into SVP
    Verify Button Continue Inactive     number=0

Test Ability Pass Step 2 With Empty Required Fields
    ${assessor}=   Create New Random Assessor
    Registeration As Assessors Into SVP
    Fill Form Basic Information     assessor=${assessor}
    Click Btn Continue
    Verify Button Continue Inactive     number=1

Test Ability Pass Step 3 With Empty Required Fields
    ${assessor}=   Create New Random Assessor
    Registeration As Assessors Into SVP
    Fill Form Basic Information     assessor=${assessor}
    Click Btn Continue
    Fill Form Address       assessor=${assessor}
    Verify Button Submit Request Inactive

Registeration As Assessors Into SVP
    Open SPA Landing Page
    Open Assessor Registration Page

Fill Form Basic Information
    [Arguments]     ${assessor}
    Fill Field Full Name    name=${assessor.full_name}
    Fill Field Date Of Birth    date=${assessor.date_of_birth}
    Select Gender       gender=${assessor.gender}
    Select Nationality
    Fill Field CNIC    cnic=${assessor.cnic}
    Fill Field Passport Number    passport=${assessor.passport_number}
    Fill Field Phone        code=${assessor.country_code}       phone=${assessor.phone}
    Fill Field Email    email=${assessor.email}
    Upload Passport File        dir_path=${assessor.passport_file}

Fill Form Address
    [Arguments]     ${assessor}
    Select Country      country=${assessor.country}
    Select City      city=${assessor.city}

Fill Form Other Details
    [Arguments]    ${assessor}
    Select Category     category=${assessor.category}
    Choose Education    value=${assessor.educations}
    Upload Qualifications       dir_path=${assessor.passport_file}
    Choose Experience    value=${assessor.experience}
    Upload Experience       dir_path=${assessor.passport_file}
    Choose Institute    value=${assessor.institute}
    Fill Field Institute Name       name=${assessor.institute_name}
    Select Languages     languages=${assessor.languages}
    Choose IT Skills    value=${assessor.skills}
    Choose Knowledge Tools      value=${assessor.knowledge}
    Choose Prof Qualification       value=${assessor.prof_qualification}
    Choose Internal Qualification       value=${assessor.inter_qualification}
    Choose Internal Experience      value=${assessor.inter_experience}

Verify Check Certificate And Exam Result Visible
    Wait For Elements State    ${BTN_CHECK_CERTIFICATE_AND_EXAM_RESULT}

Verify Terms Of Use
    Wait For Elements State    ${TEXT_TERMS_OF_USE}

Verify Button Submit Request Inactive
    Wait For Elements State    ${BTN_SUBMIT_REQUEST}    disabled

Verify Button Continue Inactive
    [Arguments]    ${number}
    ${elements}=    Get Elements    ${BTN_CONTINUE}
    Wait For Elements State    ${elements}[${number}]    disabled

Verify Error Messages
    [Arguments]    ${cnic}=True        ${email}=True
    IF    ${email}       Verify Text    ${ERROR_FIELD_EMAIL}     ${EMAIL_IS_IN_USE}
    IF    ${cnic}       Verify Text    ${ERROR_FIELD_CNIC}     ${ASSESSOR_CNIC_REGISTERED}
