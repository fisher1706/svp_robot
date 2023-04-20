*** Settings ***
Resource        POM/Keywords/Modules/base_actions.resource
Variables       POM/Locators/SPAUploadLocators.py


*** Variables ***
@{FILTERS}
...     ${FIELD_FILE_ID}
...     ${PICKER_UPLOAD_DATE}
...     ${FIELD_NUMBER_OF_PASSED_LABORS}
...     ${FIELD_NUMBER_OF_LABORS}


*** Keywords ***
Click Test Center
    Click Button    ${BTN_TCENTER}

Click Add Test Center
    Click Button    ${BTN_ADD_TCENTER}

Click Uploaded Files
    Click Button    ${BTN_UPLOADED_FILES}

Fill Name General Information
    [Arguments]    ${name}
    Type Text   ${FIELD_NAME_GENERAL_INFORMATION}   ${name}

Fill Official Contact Number
    [Arguments]    ${number}
    Type Text    ${FIELD_OFFICIAL_CONTACT_NUMBER}   ${number}

Check Select Category
    Check Checkbox      ${CATEGORY}

Fill Name Test Centr Owner
    [Arguments]    ${name}
    Type Text       ${FIELD_NAME_TCENTR_OWNER}      ${name}

Fill TCenter Email
    [Arguments]    ${email}
    Type Text   ${FIELD_EMAIL}      ${email}

Fill City
    [Arguments]    ${city}
    Type Text   ${FIELD_CITY}       ${city}

Fill Street Name
    [Arguments]    ${street}
    Type Text    ${FIELD_STREET_NAME}   ${street}

Fill Postal Code
    [Arguments]    ${postal_code}
    Type Text    ${FIELD_POSTAL_CODE}   ${postal_code}

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

Click Clear Filter
    Click Button    ${BTN_CLEAR_FILTER}

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

Verify Disabling Filters Fields
    Click Clear Filter
    FOR    ${locator}   IN      @{FILTERS}
        Verify Text     ${locator}      ${EMPTY}
    END

Upload File
    [Arguments]    ${selector}      ${dir_path}
    Upload File By Selector    ${selector}    ${dir_path}

Fill Filter Field
    [Arguments]    ${locator}       ${val}
    Type Text    ${locator}     ${val}