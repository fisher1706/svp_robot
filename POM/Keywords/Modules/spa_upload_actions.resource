*** Settings ***
Library         Resources/DataSources/models/ModelBuilder.py
Library         Libraries/CSVHelper.py
Library         Libraries/FileHelper.py
Resource        POM/Keywords/Pages/spa_upload.resource
Resource        POM/Keywords/Modules/base_actions.resource


*** Variables ***
${PHONE_NUMBER}     2117937


*** Keywords ***
Add TCentr
    Click Test Center
    Wait For Elements State     ${BTN_ADD_INDIVIDUAL}     hidden
    Fill TCenter Form

Fill TCenter Form
    ${tcenter}=     Create New Account      phone_number=${PHONE_NUMBER}
    Click Add Test Center
    Fill Name General Information    ${tcenter.en_name}
    Fill Official Contact Number    ${tcenter.phone_number}
    Check Select Category
    ${occupation}=      Get Text    ${CATEGORY}
    Log To Console      ${occupation}
    Fill Name Test Centr Owner    ${tcenter.en_name}
    Fill TCenter Email      ${tcenter.email}
    Fill City    ${tcenter.city}
    Fill Street Name    ${tcenter.address}
    Fill Postal Code    ${tcenter.postal_code}
    Click Add       ${BTN_ADD_NEW_TCENTR}
    Verify Text     ${SEARCH_RESULTS}      Search Results       is_equal=False
    Click Uploaded Files

Add Individual Labor
    [Arguments]     ${entity}
    Click Add Individual
    ${labor}=   Create New Random Labor
    Fill Labor Individual Form    ${entity}     ${labor}

Fill Labor Individual Form
    [Arguments]    ${entity}    ${labor}
    Fill National ID    ${labor.national_id}
    Fill Labor Name    ${labor.labor_name}
    Fill Passport    ${labor.passport}
    Fill Email    ${labor.email}
    IF    '${entity}'=='legislator'
        Select Test Center    ${DROPDOWN_TCENTER}
    END
    Fill Exam Date    ${labor.exam_date}
    Select Occupation    ${DROPDOWN_OCCUPATION}
    Fill Exam Result %    ${labor.exam_result}
    Click Add       ${ADD_INDIVIDUAL_LABOR}
    Verify Value    ${FIELD_FILE_NAME}       ${labor.labor_name}
    Click Add       ${ADD_INDIVIDUAL_LABOR}

Upload Group Of Labors Index
    [Arguments]
    ...     ${amount}=1
    ...     ${wrong_timestamp}=False
    ...     ${exam_score}=99
    ${csv_file_path}=    Prepare Csv File    ${amount}      ${wrong_timestamp}      ${exam_score}
    Click Add Group     ${BTN_ADD_GROUP}
    Select Test Center      ${DROPDOWN_TCENTER_LIST}     1     index
    Select Occupation    ${DROPDOWN_CATEGORY_LIST}     1    index
    Upload File     ${BTN_CHOOSE_FILE}      ${csv_file_path}
    Verify Value     ${FIELD_POPUP_TOTAL_LABORS}      ${amount}
    Click Add       ${BTN_ADD}
    Run Keyword If      '${wrong_timestamp}'=='False' and '${exam_score}'=='99'
    ...     Verify Value     ${TD_PASSED_LABORS}      ${amount}

Verify Upload Csv File Without Selected Category And Tcenter
    Click Button    ${BTN_ADD_GROUP}
    Verify Choose File Button Status    ${BTN_CHOOSE_FILE}    disabled
    Select Test Center      ${DROPDOWN_TCENTER_LIST}
    Verify Choose File Button Status    ${BTN_CHOOSE_FILE}    disabled
    Select Occupation    ${DROPDOWN_CATEGORY_LIST}
    Verify Choose File Button Status    ${BTN_CHOOSE_FILE}    enabled
    Click Cancel        ${BTN_CANCEL}

Verify Filters On Uploads Tab
    [Arguments]     ${amount}=1
    Upload Group Of Labors Index        ${amount}
    Filters On Upload Tab

Filters On Upload Tab
    Wait For Elements State    ${WAITING_SPINNER}    hidden
    ${elements}=    Get Last Entry    ${LAST_ENTRY}
    Verify Field File Id        ${elements}[0]
    Verify Upload Date      ${elements}[1]
    Verify Field Number Of Passed Labors        ${elements}[2]
    Verify Field Number Of Labors       ${elements}[3]
    Verify Disabling Filters Fields

Verify Total Amount Value
    [Arguments]    ${pages}     ${amount}=1
    FOR    ${_}    IN RANGE    ${pages}
        Upload Group Of Labors Index        ${amount}
    END
    Click Next
    Filters On Upload Tab

Verify Download Csv Sample
    Click Add Group     ${BTN_ADD_GROUP}
    Click Download Csv Sample
    ${files}=   Get Temp Files
    Check Compatibility Files       ${files}[0]     ${files}[1]

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
