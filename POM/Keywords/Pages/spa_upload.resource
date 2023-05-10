*** Settings ***
Resource        POM/Keywords/Modules/base_actions.resource
Resource        POM/Keywords/Modules/spa_actions.resource
Variables       POM/Locators/SPAUploadLocators.py


*** Keywords ***
Click Uploaded Files
    Click Button    ${BTN_UPLOADED_FILES}

Click Add Individual
    Click Button    ${BTN_ADD_INDIVIDUAL}

Click Add Group
    [Arguments]    ${selector}
    Click Button    ${selector}

Click Add
    [Arguments]    ${selector}
    Click Button    ${selector}

Click Cancel
    [Arguments]    ${selector}
    Click Button    ${selector}

Click Next
    Click Button    ${BTN_NEXT}

Click Download Csv Sample
    Click Button        ${BTN_DOWNLOAD_CSV_SAMPLE}

Fill National ID
    [Arguments]    ${national_id}
    Type Text   ${FIELD_NATIONAL_ID}    ${national_id}

Fill Labor Name
    [Arguments]    ${labor_name}
    Type Text   ${FIELD_LABOR_NAME}    ${labor_name}

Fill Passport
    [Arguments]    ${passport}
    Type Text   ${FIELD_PASSPORT}    ${passport}

Fill Email
    [Arguments]    ${email}
    Type Text   ${FIELD_LABOR_EMAIL}    ${email}

Fill Exam Date
    [Arguments]    ${exam_date}
    Type Text   ${DROPDOWN_EXAM_DATE}    ${exam_date}

Fill Exam Result %
    [Arguments]    ${result of exam}
    Type Text   ${EXAM_RESULT}    ${result of exam}

Select Test Center
    [Arguments]    ${selector}      ${val}=1     ${attr}=index
    Click Button    ${selector}
    Select Options By    ${selector}    ${attr}    ${val}
    Keyboard Key    press    Enter

Select Occupation
    [Arguments]    ${selector}      ${val}=1     ${attr}=index
    Click Button    ${selector}
    Select Options By    ${selector}    ${attr}    ${val}
    Keyboard Key    press    Enter

Verify Field File Id
    [Arguments]    ${val}
    Fill Filter Field   ${FIELD_FILE_ID}    ${val}
    Verify Text     ${SEARCH_RESULTS}      Search Results       is_equal=False

Verify Upload Date
    [Arguments]    ${val}
    Fill Filter Field   ${PICKER_UPLOAD_DATE}    ${val}
    Verify Text     ${SEARCH_RESULTS}      Search Results       is_equal=False

Verify Field Number Of Passed Labors
    [Arguments]    ${val}
    Fill Filter Field   ${FIELD_NUMBER_OF_PASSED_LABORS}    ${val}
    Verify Text     ${SEARCH_RESULTS}      Search Results       is_equal=False

Verify Field Number Of Labors
    [Arguments]    ${val}
    Fill Filter Field   ${FIELD_NUMBER_OF_LABORS}    ${val}
    Verify Text     ${SEARCH_RESULTS}      Search Results       is_equal=False

Upload File
    [Arguments]    ${selector}      ${dir_path}
    Upload File By Selector    ${selector}    ${dir_path}
