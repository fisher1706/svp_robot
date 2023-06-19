*** Settings ***
Resource        POM/Keywords/Pages/admin_occupations.resource
Resource        POM/Keywords/Pages/base.resource
Resource        POM/Keywords/Modules/spa_actions.resource
Library         Libraries/CSVHelper.py
Library         Libraries/FileHelper.py
Library         Resources/DataSources/models/ModelBuilder.py
Variables       Resources/Variables/DirPath.py
Variables       Resources/Variables/WarningMessage.py
Variables       Resources/Variables/SpecialChars.py


*** Keywords ***
Test Add New Occupation
    Open Admin Occupations Page
    ${occupation}=      Create New Random Occupation
    Add Occupation      occupation=${occupation}
    Verify Added Occupation     occupation=${occupation}

Test Download All Occupations List
    Open Admin Occupations Page
    Click Upload File
    Wait For Elements State    ${DOWNLOAD_AND_UPLOAD_FILE_TEXT}      visible
    Download All Occupations

Test Upload Occupation
    [Arguments]    ${new}=True
    Open Admin Occupations Page
    Click Upload File
    Wait For Elements State    ${DOWNLOAD_AND_UPLOAD_FILE_TEXT}      visible
    IF      ${new}
        ${occupation}=      Create New Random Occupation
        ${csv_file_path}=       Prepare Occupations Csv File    occupation=${occupation}
    ELSE
        ${csv_file_path}=    Set Variable    ${CSV_OCCUPATION}
    END
    Upload File By Selector     ${BTN_CHOOSE_FILE}      ${csv_file_path}
    Wait For Elements State    ${DOWNLOAD_AND_UPLOAD_FILE_TEXT}      visible
    IF      ${new}
        Verify File Information     saved=1     skipped=0       total=1
        Click Done
        Verify Added Occupation     occupation=${occupation}
    ELSE
        Verify File Information     saved=0     skipped=1       total=1
    END

Test Add Occupation With Existed Key
    Open Admin Occupations Page
    ${occupation}=      Create New Random Occupation
    ${entry}=       Get Last Entry      ${LAST_ENTRY}
    ${occupation}=      Update Occupation Data   occupation=${occupation}    key=${entry}[1]
    Add Occupation      occupation=${occupation}
    Verify Key Error Message

Test Add Occupation With Existed Name
    Open Admin Occupations Page
    ${occupation}=      Create New Random Occupation
    ${entry}=       Get Last Entry      ${LAST_ENTRY}
    ${occupation}=      Update Occupation Data   occupation=${occupation}
    ...     english_name=${entry}[6]       arabic_name=${entry}[2]
    Add Occupation      occupation=${occupation}
    Verify Added Occupation     occupation=${occupation}

Test Add Occupation With Special Char In Name Field
    Open Admin Occupations Page
    ${occupation}=      Create New Random Occupation
    ${occupation}=      Update Occupation Data   occupation=${occupation}
    ...     english_name=${special_chars}       arabic_name=${special_chars}
    Add Occupation      occupation=${occupation}
    Verify Added Occupation     occupation=${occupation}

Open Admin Occupations Page
    Open Page    base_url=${ADMIN_URL}    page_url=occupations
    Wait Spinners To Disappear
    Wait For Elements State    ${OCCUPATIONS_TEXT}      visible

Add Occupation
    [Arguments]     ${occupation}
    Click New Occupation
    Wait Spinners To Disappear
    Wait For Elements State    ${NEW_OCCUPATION_TEXT}      visible
    Fill Occupatioin Form       occupation=${occupation}
    Click Add
    Wait Spinners To Disappear

Fill Occupatioin Form
    [Arguments]    ${occupation}
    Type Text    ${FIELD_KEY}       ${occupation.key}
    Type Text    ${FIELD_ARABIC_NAME}       ${occupation.arabic_name}
    Type Text    ${FIELD_ENGLISH_NAME}      ${occupation.english_name}
    Select Category

Verify Added Occupation
    [Arguments]    ${occupation}
    Open Admin Occupations Page
    ${entry}=       Get Last Entry      ${LAST_ENTRY}
    Should Be Equal     ${entry}[1]     ${occupation.key}
    Should Be Equal     ${entry}[2]     ${occupation.arabic_name}
    Should Be Equal     ${entry}[6]     ${occupation.english_name}

Download All Occupations
    [Arguments]    ${filename}=all_occupations.csv
    Clear Temp Folder
    ${dl_promise}=    Promise To Wait For Download    ${TEMP_FOLDER}/${filename}
    Click Button        ${DOWNLOAD_OCCUPATIONS_CSV}
    ${file_obj}=    Wait For  ${dl_promise}
    ${files}=   Get Temp Files
    Should Not Be Empty     ${files}

Verify File Information
    [Arguments]    ${saved}     ${skipped}      ${total}
    Verify Text     ${FIELD_SAVED_COUNT}    ${saved}
    Verify Text     ${FIELD_SKIPPED_COUNT}    ${skipped}
    Verify Text     ${FIELD_TOTAL_COUNT}    ${total}

Verify Key Error Message
    Verify Text     ${KEY_ERROR}        ${KEY_OCCUPATION_IS_EXIST}
