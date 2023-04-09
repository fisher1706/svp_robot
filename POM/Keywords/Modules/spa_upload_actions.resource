*** Settings ***
Library         Resources/DataSources/models/ModelBuilder.py
Library         Libraries/CSVHelper.py
Library         Libraries/FileHelper.py
Library         POM/Locators/SPALaborLocatorsLegislator.py
Library         POM/Locators/SPALaborLocatorsTCentr.py
Resource        POM/Keywords/Modules/base_actions.resource
Resource        POM/Keywords/Pages/spa_upload.resource
Variables       Resources/Variables/Titles.py


*** Keywords ***
Add Individual Labor
    [Arguments]     ${entity}       ${tcenter}       ${occupation}
    Click Add Individual
    ${labor}=   Create New Random Labor
    Fill Labor Individual Form    ${entity}     ${labor}      ${tcenter}       ${occupation}

Chose Locators
    [Arguments]    ${entity}
    IF    '${entity}'=='legislator'
        ${locators}=       Return Locators Legislator
    ELSE
        ${locators}=    Return Locators Tcentr
    END
    [Return]    ${locators}

Fill Labor Individual Form
    [Arguments]    ${entity}    ${labor}     ${tcenter}       ${occupation}
    ${locators}=       Chose Locators       ${entity}

    Fill National ID    ${labor.national_id}
    Fill Labor Name    ${labor.labor_name}
    Fill Passport    ${labor.passport}
    Fill Email    ${labor.email}
    IF    '${entity}'=='legislator'
        Select Test Center    ${locators.DROPDOWN_TCENTER}       ${tcenter}
    END
    Fill Exam Date    ${labor.exam_date}
    Select Occupation    ${locators.DROPDOWN_OCCUPATION}     ${occupation}
    Fill Exam Result %    ${labor.exam_result}
    Click Add       ${locators.ADD_INDIVIDUAL_LABOR}
    Verify Value    ${locators.FIELD_FILE_NAME}       ${labor.labor_name}
    Click Add       ${locators.ADD_INDIVIDUAL_LABOR}

Upload Group Of Labors
    [Arguments]     ${entity}     ${tcenter}       ${occupation}      ${amount}=1
    ${csv_file_path}=    Prepare Csv File    ${amount}
    ${locators}=       Chose Locators       ${entity}

    Click Add Group     ${locators.BTN_ADD_GROUP}
    Select Test Center      ${locators.DROPDOWN_TCENTER_LIST}     ${tcenter}
    Select Occupation    ${locators.DROPDOWN_CATEGORY_LIST}     ${occupation}
    Upload File     ${locators.BTN_CHOOSE_FILE}      ${csv_file_path}
    Verify Value     ${locators.TD_PASSED_LABORS}      ${amount}
    Click Add       ${locators.BTN_ADD}
    Verify Value     ${locators.FIELD_POPUP_TOTAL_LABORS}      ${amount}

Verify upload csv file without selected category and tcenter
    [Arguments]     ${entity}       ${tcenter}      ${occupation}
    ${locators}=       Chose Locators       ${entity}

    Click Button    ${locators.BTN_ADD_GROUP}
    Verify Choose File Button Status    ${locators.BTN_CHOOSE_FILE}    disabled
    Select Test Center      ${locators.DROPDOWN_TCENTER_LIST}     ${tcenter}
    Verify Choose File Button Status    ${locators.BTN_CHOOSE_FILE}    disabled
    Select Occupation    ${locators.DROPDOWN_CATEGORY_LIST}     ${occupation}
    Verify Choose File Button Status    ${locators.BTN_CHOOSE_FILE}    enabled
    Click Cancel        ${locators.BTN_CANCEL}

Verify Filters On Uploads Tab
    [Arguments]     ${entity}       ${tcenter}       ${occupation}      ${amount}=1
    Upload Group Of Labors      ${entity}       ${tcenter}       ${occupation}      ${amount}
    Filters On Upload Tab       ${entity}

Filters On Upload Tab
    [Arguments]    ${entity}
    ${locators}=       Chose Locators       ${entity}

    Wait For Elements State    ${WAITING_SPINNER}    hidden
    ${elements}=    Get Last Entry    ${locators.LAST_ENTRY}

    Verify Field File Id        ${elements}[0]
    Verify Upload Date      ${elements}[1]
    Verify Field Number Of Passed Labors        ${elements}[2]
    Verify Field Number Of Labors       ${elements}[3]
    Verify Disabling Filters Fields

Verify Total Amount Value
    [Arguments]    ${entity}    ${pages}     ${tcenter}       ${occupation}      ${amount}=1
    FOR    ${_}    IN RANGE    ${pages}
        Upload Group Of Labors   ${entity}      ${tcenter}       ${occupation}      ${amount}
    END
    Click Next
    Filters On Upload Tab   ${entity}

Verify download csv sample
    [Arguments]    ${entity}
    ${locators}=       Chose Locators       ${entity}

    Click Add Group     ${locators.BTN_ADD_GROUP}
    Click Download Csv Sample
    ${files}=   Get temp files
    Check compatibility files       ${files}[0]     ${files}[1]

Get Last Entry
    [Arguments]    ${locator}
    ${rowList}=  Create List
    @{elements}=    Get Elements    ${locator}
    FOR  ${element}     IN      @{elements}
        ${text}=  Get Text      ${element}
        Append To List  ${rowList}  ${text}
    END
    [Return]    ${rowList}

Fill Filter Field
    [Arguments]    ${locator}       ${val}
    Type Text    ${locator}     ${val}

Verify Value
    [Arguments]    ${locator}      ${val}
    Verify Text     ${locator}      ${val}

Upload File
    [Arguments]    ${locator}      ${dir_path}
    Upload File By Selector    ${locator}    ${dir_path}

Verify Choose File Button Status
    [Arguments]    ${locator}      ${status}
    Wait For Elements State    ${locator}    ${status}
