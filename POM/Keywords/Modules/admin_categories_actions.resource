*** Settings ***
Resource        POM/Keywords/Pages/admin_categories.resource
Resource        POM/Keywords/Pages/base.resource
Resource        POM/Keywords/Modules/admin_base_actions.resource
Library         Resources/DataSources/models/ModelBuilder.py
Library         Libraries/CSVHelper.py
Variables       Resources/Variables/SuccessMessage.py
Variables       Resources/Variables/ErrorMessage.py
Variables       Resources/Variables/DirPath.py
Variables       POM/Locators/AdminBaseLocators.py


*** Keywords ***
Test Ability Add Category
    Admin Categories Actions
    ${category}=    Create New Category     status=correct
    Add Category        category=${category}
    Verify Text     ${SUCCESSFULLY}     ${SUCCESSFULLY_CREATED_CATEGORY}

Test Add Category With Incorrect Data
    Admin Categories Actions
    ${category}=    Create New Category     status=wrong
    Add Category        category=${category}    status=wrong
    Verify Text    ${ERROR_CODE}        ${MSG_CATEGORY_CODE}
    Verify Text    ${ERROR_ENGLISH_NAME}        ${MSG_ENGLISH_NAME}
    Verify Text    ${ERROR_ARABIC_NAME}        ${MSG_ARABIC_NAME}

Test Add Category With Empty Form
    Admin Categories Actions
    Click New Category
    Verify Create Category Button Is Dissabled

Test Ability To Edit Category
    Admin Categories Actions
    Choose Item Actions    type=Edit
    ${category}=    Create New Category     status=correct
    Fill Category Form      category=${category}
    Click Btn Edit Category
    Wait Spinners To Disappear
    Verify Text     ${SUCCESSFULLY}     ${SUCCESSFULLY_UPDATED_CATEGORY}

Test View Category Detail Information
    Admin Categories Actions
    Choose Item Actions    type=View
    ${data_category}=    Get Last Entry    ${DATA_CATEGORY}
    FOR    ${item}      IN      @{data_category}
        Should Not Be Empty     ${item}
    END

Test View Category History
    Admin Categories Actions
    Choose Item Actions    type=View
    Wait For Elements State    ${CHANGE_LOG_TEXT}       visible
    ${data_history}=    Get Last Entry    ${LAST_ENTRY}
    Should Not Be Empty     ${data_history}

Test Change Category Status
    Admin Categories Actions
    Choose Item Actions    type=View
    ${data_before}=    Get Last Entry    ${DATA_CATEGORY}
    Click Chage Status
    Wait For Elements State     ${CHANGE_STATUS}        visible
    ${data_after}=    Get Last Entry    ${DATA_CATEGORY}
    Should Not Be Equal     ${data_before}[-1]      ${data_after}[-1]

Test Upload Category From Csv
    [Arguments]    ${is_correct}=True
    Admin Categories Actions
    Click Upload Categories
    IF    ${is_correct}
        ${category}=    Create New Category     status=correct
        ${csv_file_path}=       Prepare Categories Csv File     category=${category}
    ELSE
        ${csv_file_path}=    Set Variable    ${CSV_CATEGORIES}
    END
    Upload File By Selector     ${BTN_CHOOSE_FILE}      ${csv_file_path}
    Wait For Elements State     ${BTN_CHOOSE_FILE}      enabled
    IF    ${is_correct}
        Click Done
        Verify File Information     saved=1     skipped=0       total=1
    ELSE
        Verify Text    ${ERROR_DOWNLOAD}      ${MSG_DOWNLOAD_ERROR}
    END

Test Download Csv Sample
    Admin Categories Actions
    Click Upload Categories
    ${file}=    Download File       filename=sample_categories.csv      btn_download=${DOWNLOAD_CSV_SAMPLE}

Admin Categories Actions
    Open Admin Categories Page
    Wait Spinners To Disappear
    Wait For Elements State     ${CATEGORIES_TEXT}       visible

Add Category
    [Arguments]     ${category}     ${status}=correct
    Click New Category
    Wait Spinners To Disappear
    Wait For Elements State    ${NEW_CATEGORY_TEXT}     visible
    Fill Category Form      category=${category}
    IF    '${status}'=='correct'     Click Btn Create Category

Fill Category Form
    [Arguments]    ${category}
    Type Text    ${FIELD_CODE}      ${category.code}
    Type Text    ${FIELD_ENGLISH_NAME}      ${category.english_name}
    Type Text    ${FIELD_ARABIC_NAME}      ${category.arabic_name}
    Select Status

Choose Item Actions
    [Arguments]     ${type}
    Hover       ${LAST_ACTION}
    IF      '${type}'=='View'
        Click Button        ${ICON_VIEW}
    ELSE
        Click Button        ${ICON_EDIT}
    END
