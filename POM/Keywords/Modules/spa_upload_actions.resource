*** Settings ***
Library         Resources/DataSources/models/ModelBuilder.py
Library         Libraries/CSVHelper.py
Library         Libraries/FileHelper.py
Resource        POM/Keywords/Modules/spa_actions.resource
Resource        POM/Keywords/Pages/spa_upload.resource
Resource        POM/Keywords/Modules/base_actions.resource
Resource        POM/Keywords/Pages/spa.resource
Variables       Resources/Variables/PageNumbersDataset.py
Variables       Resources/Variables/DirPath.py


*** Keywords ***
Upload Group Of Labors Index
    [Arguments]
    ...     ${amount}=1
    ...     ${wrong_timestamp}=False
    ...     ${exam_score}=99
    ...     ${file}=True
    IF    ${file}
        ${csv_file_path}=    Prepare Csv File    ${amount}      ${wrong_timestamp}      ${exam_score}
    ELSE
        ${csv_file_path}=    Set Variable    ${CSV}
    END
    Click Add Group     ${BTN_ADD_GROUP}
    Select Test Center      ${DROPDOWN_TCENTER_LIST}     1     index
    Select Occupation    ${DROPDOWN_CATEGORY_LIST}     1    index
    Upload File     ${BTN_CHOOSE_FILE}      ${csv_file_path}
    Wait For Elements State     ${BTN_ADD_FRAME}    enabled
    Log To Console    Verify added labors
    Verify Value     ${FIELD_POPUP_TOTAL_LABORS}      ${amount}
    Click Add       ${BTN_ADD_FRAME}
    Log To Console    Verify passed labors
    Run Keyword If      '${wrong_timestamp}'=='False' and '${exam_score}'=='99'
    ...     Verify Value     ${TD_PASSED_LABORS}      ${amount}

Add Individual Labor
    [Arguments]     ${entity}
    Click Add Individual
    ${labor}=   Create New Random Labor
    Fill Labor Individual Form    ${entity}     ${labor}

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

Verify Total Amount Value
    [Arguments]    ${amount}=1
    FOR    ${_}    IN RANGE    ${PAGE_VALUES}
        Upload Group Of Labors Index        ${amount}
    END
    Click Button Next
    Filters On Upload Tab

Fill Labor Individual Form
    [Arguments]    ${entity}    ${labor}
    Fill National ID    ${labor.national_id}
    Fill Labor Name    ${labor.labor_name}
    Fill Passport    ${labor.passport}
    Fill Email    ${labor.email}
    IF    '${entity}'=='legislator'     Select Test Center    ${DROPDOWN_TCENTER}
    Fill Exam Date    ${labor.exam_date}
    Select Occupation    ${DROPDOWN_OCCUPATION}
    Fill Exam Result %    ${labor.exam_result}
    Click Add       ${ADD_INDIVIDUAL_LABOR}
    Verify Value    ${FIELD_FILE_NAME}       ${labor.labor_name}
    Click Add       ${ADD_INDIVIDUAL_LABOR}

Verify Download Csv Sample
    Clear Temp Folder
    Click Add Group     ${BTN_ADD_GROUP}
    ${dl_promise}=    Promise To Wait For Download    ${TEMP_FOLDER}/sample_attributes_example.csv
    Click Download Csv Sample
    ${file_obj}=    Wait For  ${dl_promise}
    ${files}=   Get Temp Files
    Check Compatibility Files       ${files}[0]     ${CSV_TEMPLATE}

Filters On Upload Tab
    Wait For Elements State    ${BTN_CHOOSE_FILE}     hidden
    ${elements}=    Get Last Entry    ${LAST_ENTRY}
    Verify Field File Id        ${elements}[0]
    Verify Upload Date      ${elements}[1]
    Verify Field Number Of Passed Labors        ${elements}[2]
    Verify Field Number Of Labors       ${elements}[3]
    Verify Disabling Filters Fields     ${FILTERS}

Verify Value
    [Arguments]    ${locator}      ${val}
    Verify Text     ${locator}      ${val}

Upload File
    [Arguments]    ${locator}      ${dir_path}
    Upload File By Selector    ${locator}    ${dir_path}

Verify Choose File Button Status
    [Arguments]    ${locator}      ${status}
    Wait For Elements State    ${locator}    ${status}
