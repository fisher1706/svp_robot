*** Settings ***
Resource        POM/Keywords/Modules/spa_actions.resource
Library         Libraries/FileHelper.py
Variables       Resources/Variables/DirPath.py
Variables       POM/Locators/AdminBaseLocators.py


*** Keywords ***
Download File
    [Arguments]    ${filename}      ${btn_download}
    Clear Temp Folder
    ${dl_promise}=    Promise To Wait For Download    ${TEMP_FOLDER}/${filename}
    Click Button        ${btn_download}
    ${file_obj}=    Wait For  ${dl_promise}
    ${files}=   Get Temp Files
    Should Not Be Empty     ${files}
    [Return]        ${files}

Verify File Information
    [Arguments]    ${saved}     ${skipped}      ${total}
    Verify Text     ${FIELD_SAVED_COUNT}    ${saved}
    Verify Text     ${FIELD_SKIPPED_COUNT}    ${skipped}
    Verify Text     ${FIELD_TOTAL_COUNT}    ${total}
