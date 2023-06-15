*** Settings ***
Resource        POM/Keywords/Pages/spa_assessors.resource
Library         Libraries/FileHelper.py
Variables       Resources/Variables/DirPath.py


*** Keywords ***
Test Ability View Basic Information
    Click Assessors
    Wait For Elements State     ${ASSESSORS_TEXT}   visible
    Click Icon View
    Verify Assessor Information

Test Ability View Additional Information And Return To Assessors
    Click Assessors
    Wait For Elements State     ${ASSESSORS_TEXT}   visible
    Click Icon View
    Click Adress
    Wait For Elements State     ${COUNTRY}   visible
    Verify Assessor Information
    Click Other Details
    Wait For Elements State     ${CATEGORY}   visible
    Verify Assessor Information
    Click Back
    Wait For Elements State     ${ASSESSORS_TEXT}   visible

Test Ability Download Attached Files
    Click Assessors
    Wait For Elements State     ${ASSESSORS_TEXT}   visible
    Click Icon View
    Verify Download Assessors Files    passport     ${VIEW_PASSPORT}
    Click Other Details
    Wait For Elements State     ${CATEGORY}   visible
    Verify Download Assessors Files    licenses_certification     ${LICENSES_CERTIFICATIONS}
    Verify Download Assessors Files    experience     ${EXPERIENCE}

Test Ability Select Filter
    Click Assessors
    Wait For Elements State     ${ASSESSORS_TEXT}   visible
    Click Filter
    ${data}=    Get Last Entry      ${ENTRY}
    ${dropdown}=    Get Elements    ${DROP}
    ${month}=       Get Month Interval
    Verify Filter Field Input   ${FIELD_NAME}   ${data}[0]
    Verify Filter Field Input   ${FIELD_CNIC}   ${data}[1]
    Verify Filter Field Input   ${FIELD_PHONE_NUMBER}   ${data}[2]
    Verify Filter Field Input   ${FIELD_PASSPORT_NUMBER}   ${data}[3]
    Verify Filter Field Input   ${FIELD_FROM}   ${month}[0]
    Verify Filter Field Choose      ${dropdown}[0]      ${data[4]}
    Verify Filter Field Choose      ${dropdown}[1]      ${data[5]}
    ${status}=  Low String      ${data}[7]
    Verify Filter Field Choose      ${dropdown}[2]      ${status}

Verify Assessor Information
    @{elements}=   Get Elements    ${DATA}
    FOR    ${el}    IN      @{elements}
        ${text}=    Get Text    ${el}
        Should Not Be Empty     ${text}
    END

Verify Download Assessors Files
    [Arguments]     ${filename}     ${locator}
    Clear Temp Folder
    ${dl_promise}=    Promise To Wait For Download    ${TEMP_FOLDER}/${filename}
    Click Button        ${locator}
    ${file_obj}=    Wait For  ${dl_promise}
    ${files}=   Get Temp Files
    Should Not Be Empty     ${files}

Verify Filter Field Input
    [Arguments]    ${locator}       ${value}
    Type Text       ${locator}      ${value}
    Keyboard Key    press    Enter
    Filter Actions      ${value}

Verify Filter Field Choose
    [Arguments]    ${selector_click}    ${value}
    ${elements}=    Get Elements    //*[text()="${value}"]
    Click Button        ${selector_click}
    Click Button        ${elements}[0]
    Filter Actions      ${value}

Filter Actions
    [Arguments]    ${value}
    Click Apply
    Verify Text     ${CHECK_FILTER}     ${value}
    Click Filter
    Click Clear Filter
