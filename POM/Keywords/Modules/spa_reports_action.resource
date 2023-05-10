*** Settings ***
Library         Browser
Resource        POM/Keywords/Pages/spa_reports.resource
Resource        POM/Keywords/Pages/base.resource
Resource        POM/Keywords/Modules/spa_payment_actions.resource
Variables       Resources/Variables/Titles.py
Variables       POM/Locators/BaseLocators.py
Variables       Resources/Variables/WarningMessage.py
Variables       Resources/Variables/WrongCertificateDataset.py


*** Keywords ***
Test Legislator Check Filters And Clear Filters Reports Tab
    [Arguments]     ${amount}=1
    Pass Labor Flow     ${amount}
    Click Reports
    ${loc_report}     Get From Dictionary   ${TITLE_LOCATOR}    spa
    Verify Text     ${loc_report}        ${REPORTS}
    Wait Spinners To Disappear
    ${elements}     Get Last Entry      ${LAST_ENTRY}
    Verify Field Id     ${elements}[0]
    Verify Field Group No       ${elements}[1]
    Verify Field Amount     ${elements}[2]
    Verify Field Date       ${elements}[3]
    Verify Field Status    ${elements}[4]
    Verify Disabling Filters Fields     ${FILTERS}

Test Legislator Valid Scenario
    Pass Labor Flow
    ${sertificate_number}     Get Certificate Number
    ${passport}     Get Passport Number
    Checking Sertificate Scenario       ${passport}     ${sertificate_number}
    ...     ${MESSAGE_VALID_CERTIFICATE}

Test Legislator Certificate Is Expired
    Upload Group Of Labors Index
    Change Timestamp To Previous Day
    Upload Group Of Labors Index    file=False
    Pass Credit Flow    state=Success
    Approve Payment
    ${sertificate_number}     Get Certificate Number
    ${passport}     Get Passport Number
    Checking Sertificate Scenario       ${passport}     ${sertificate_number}
    ...     ${MESSAGE_VALID_CERTIFICATE}

Test Legislator Wrong Certificate
    Upload Group Of Labors Index
    ${passport}     Get Passport Number
    Checking Sertificate Scenario       ${passport}     ${WRONG_CERTIFICATE}
    ...     ${MESSAGE_WRONG_CERTIFICATE}        is_valid_scenario=False

Test Legislator Wrong Passport Number
    Pass Labor Flow
    ${sertificate_number}     Get Certificate Number
    Checking Sertificate Scenario       ${WRONG_PASSPORT_NUMBER}     ${sertificate_number}
    ...     ${MSG_WRONG_CERTIFICATE_ERROR}        is_valid_scenario=False

Test Legislator Certificate Does Not Exist
    Upload Group Of Labors Index
    Checking Sertificate Scenario       ${INCORRECT_NUMBER}     ${INCORRECT_NUMBER}
    ...     ${MSG_CERTIFICATE_NOT_EXIST}        is_valid_scenario=False

Checking Sertificate Scenario
    [Arguments]
    ...     ${passport}
    ...     ${sertificate_number}
    ...     ${msg}
    ...     ${is_valid_scenario}=True
    Click Reports
    ${loc_report}     Get From Dictionary   ${TITLE_LOCATOR}    spa
    Verify Text     ${loc_report}        ${REPORTS}
    Click Check Validity
    Check Verify Status        disabled
    Fill Passport Number        ${passport}
    Fill Sertificate Serial Number      ${sertificate_number}
    Click Verify
    Verify Msg Sertificates     ${msg}
    Verify Result Certificate Serial Number     ${sertificate_number}
    Verify Result Passport Number      ${passport}
    IF      ${is_valid_scenario}
        Verify Labor Name
        Verify Passport Number      ${passport}
    END

Get Certificate Number
    [Arguments]     ${amount}=1
    Clear Temp Folder
    ${dl_promise}    Promise To Wait For Download    ${TEMP_FOLDER}/certificates.zip
    Dowload Certificates
    ${file_obj}    Wait For  ${dl_promise}
    Unzip Temp File
    ${data}     Read Pdf File
    Should Not Be Empty      ${data}
    ${number}     Find Certificate Number     ${data}
    [Return]    ${number}

Verify Download Certificate Report
    [Arguments]
    ...     ${is_certificate}=True
    ...     ${is_reports_tab}=False
    ...     ${is_view_payment}=False
    Pass Labor Flow
    IF    ${is_reports_tab}
        Is Report Tab Actoins
        ...     is_certificate=${is_certificate}
        ...     is_view_payment=${is_view_payment}
    END

Is Report Tab Actoins
    [Arguments]    ${is_certificate}    ${is_view_payment}
    Click Reports
    IF    ${is_certificate}
        Clear Temp Folder
        ${dl_promise}    Promise To Wait For Download    ${TEMP_FOLDER}/certificates.zip
        Click Icon Certificate
        ${file_obj}    Wait For  ${dl_promise}
        Unzip Temp File
        ${data}     Read Pdf File
        Should Not Be Empty      ${data}
    ELSE
        Is View Payment Actions    is_view_payment=${is_view_payment}
    END

Is View Payment Actions
    [Arguments]     ${is_view_payment}
    IF  ${is_view_payment}      Click Actions
    Clear Temp Folder
    ${dl_promise}    Promise To Wait For Download    ${TEMP_FOLDER}/report.pdf
    Click Icon Report
    ${file_obj}    Wait For  ${dl_promise}
    ${data}     Read Pdf File
    Should Not Be Empty      ${data}
