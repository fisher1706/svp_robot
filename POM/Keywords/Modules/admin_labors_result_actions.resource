*** Settings ***
Resource        POM/Keywords/Pages/admin_labors_result.resource
Resource        POM/Keywords/Modules/spa_actions.resource
Library         Libraries/FileHelper.py
Variables       Resources/Variables/DirPath.py


*** Keywords ***
Test Verify Download Certificate
    [Arguments]    ${status}
    Open Admin Labors Result Page
    ${labor}=    Find Necessary Labor    status=${status}
    Verify Ability Download Certificate    labor=${labor}     status=${status}

Test View Labor Details
    [Arguments]    ${status}=Pending      ${hover}=${HOVER}      ${view}=${ICON_VIEW}
    Open Admin Labors Result Page
    ${labor}=    Find Necessary Labor    status=${status}
    Sleep    3
    ${entry}=   Get Last Entry      ${labor}
    ${data}=    Split String     ${entry}[0]     \t
    Hover   ${labor}${hover}
    Click Button    ${labor}${view}
    Wait For Elements State     ${DETAILS_LABOR_TEXT}    visible
    ${details}=  Get Last Entry    ${LABOR_DETAILS}
    Should Be Equal     ${details}[0]     ${data}[0]

Find Necessary Labor
    [Arguments]    ${status}    ${start}=//*[text()="       ${end}="]/../..
    Select Necessary Satus      status=${status}
    ${entries}=    Get Elements    ${start}${status}${end}
    RETURN      ${entries}[0]

Verify Ability Download Certificate
    [Arguments]    ${labor}      ${status}      ${filename}=certificate.pdf     ${end}=//a[@href="#"]
    IF    '${status}'=='Passed'
        Clear Temp Folder
        ${dl_promise}=    Promise To Wait For Download    ${TEMP_FOLDER}/${filename}
        Click Button        ${labor}${end}
        ${file_obj}=    Wait For  ${dl_promise}
        ${files}=   Get Temp Files
        ${data_pdf}=     Read Pdf File
        Should Not Be Empty      ${data_pdf}
    ELSE
        ${button_download}=     Get Elements     ${labor}${end}
        Should Be Empty     ${button_download}
    END
