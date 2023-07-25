*** Settings ***
Resource        POM/Keywords/Pages/admin_labors.resource
Resource        POM/Keywords/Pages/base.resource
Resource        POM/Keywords/Modules/spa_actions.resource


*** Keywords ***
Test Switch To Labors Page
    Wait Spinners To Disappear
    Click Users
    Click Labors
    Verify Text     ${LABORS_TEXT}       Labors

Test Use View Actions Active Labor
    Admin Labors Actions
    ${data}     ${actions_from}=    Get Data Labor      selector=${ACTIVE_LABORS}
    Choose Item Actions     ${actions_from}      View
    Verify General Information      data=${data}

Test Revoke Labor On The Labor Page
    [Arguments]    ${start}=//*[text()="     ${end}="]/../..
    Admin Labors Actions
    ${data}     ${actions_from}=    Get Data Labor      selector=${ACTIVE_LABORS}
    Choose Item Actions     ${actions_from}      Revoke
    Click Yes
    Sleep    1
    ${entry}=       Get Last Entry      ${start}${data[0]}${end}
    Should Contain      ${entry}[0]        Revoked

Test Use View Actions Revoked Labor
    Test Revoke Labor On The Labor Page
    ${data}     ${actions_from}=    Get Data Labor      selector=${REVOKED_LABORS}
    Choose Item Actions     ${actions_from}      View
    Verify General Information      data=${data}

Test Ability Activate Labor On Labor Page
    Test Revoke Labor On The Labor Page
    Admin Labors Actions
    ${data_before}=    Get Elements    ${REVOKED_LABORS}
    ${count_before}=       Get Length      ${data_before}
    FOR    ${_}    IN RANGE    ${count_before}
        ${inner}=    Get Elements    ${REVOKED_LABORS}
        TRY
            Choose Item Actions     ${inner}[0]      Reactivate
        EXCEPT
            CONTINUE
        END
        Wait Spinners To Disappear
        Click Yes
        Wait For Elements State    ${NATIONAL_ID}       visible
    END
    ${data_after}=    Get Elements    ${REVOKED_LABORS}
    ${count_after}=       Get Length      ${data_after}
    Should Not Be Equal     ${count_before}        ${count_after}

Test Ability To Back From View Labor Page
    Test Use View Actions Active Labor
    Click Back
    Wait Spinners To Disappear
    Verify Text     ${LABORS_TEXT}       Labors

Test Ability View Certificates Page
    Test Use View Actions Active Labor
    Click Certificates
    Wait Spinners To Disappear
    Verify Text     ${CERTIFICATES_SERIAL_NUMBER}       Certificate Serial Number

Test Ability Use Filtration
    Admin Labors Actions
    ${data}     ${actions_from}=    Get Data Labor      selector=${ACTIVE_LABORS}
    Verify Filter Field    ${FIELD_NATIONAL_ID}        ${data}[0]
    Verify Filter Field    ${FIELD_FULL_NAME}        ${data}[1]
    Verify Filter Field    ${FIELD_PASSPORT_NUMBER}        ${data}[2]
    Verify Filter Field    ${FIELD_PHONE_NUMBER}        ${data}[5]
    IF      '${data}[7]'!=''
        ${date}=    Reverse Date        ${data}[7]
        Verify Filter Field    ${FIELD_LAST_ACTIVE_DATE}        ${date}
    END
    Verify Filter Field    ${FIELD_EMAIL}        ${data}[6]
    Verify Filter Field Select      ${FIELD_COUNTRY_OF_RESIDENCE}   ${INPUT_COUNTRY_OF_RESIDENCE}   ${data}[3]
    Verify Filter Field Select      ${FIELD_NATIONALITY}   ${INPUT_NATIONALITY}   ${data}[4]

Verify General Information
    [Arguments]    ${data}
    Wait For Elements State     ${NATIONAL_ID}       visible
    ${general}=     Get Last Entry    ${DATA_GENERAL_INFORMATION}
    List Should Contain Value       ${general}     ${data}[0]

Admin Labors Actions
    Open Admin Labors Page
    Wait Spinners To Disappear
    Click Next
    TRY
        Wait For Elements State     ${NATIONAL_ID}       visible
    EXCEPT
        Wait For Elements State     ${NATIONAL_ID}       visible
    END

Get Data Labor
    [Arguments]    ${selector}
    ${entries}=    Get Elements    ${selector}
    ${entry}=   Return Random Data List     ${entries}
    ${data}=     Get Last Entry      ${entry}
    ${out}=    Split String     ${data}[0]     \t
    [Return]    ${out}     ${entry}

Choose Item Actions
    [Arguments]
    ...     ${actions}
    ...     ${type}
    ...     ${hover}=${HOVER_ACTIONS}
    ...     ${view_start}=//a[text() = "
    ...     ${view_end}="]
    ...     ${start}=//span[contains(text(), "
    ...     ${end}=")]
    Hover       ${actions}${hover}
    IF      '${type}'=='View'
        Click Button        ${actions}${view_start}${type}${view_end}
    ELSE IF     '${type}'=='Revoke'
        Click Button        ${actions}${start}${type}${end}
    ELSE IF     '${type}'=='Reactivate'
        Click Button        ${actions}${start}${type}${end}
    END

Verify Filter Field Select
    [Arguments]    ${selector}      ${input_selector}       ${value}
    Click Filters Admin
    Click Clear
    Click Button        ${selector}
    Type Text        ${input_selector}       ${value}
    Sleep    2
    Keyboard Key    press    Enter
    Click Apply
    Verify Text     ${FILTERS_CONTROL}       ${value}

Verify Filter Field
    [Arguments]    ${selector}     ${value}
    Click Filters Admin
    Click Clear
    Type Text    ${selector}    ${value}
    Keyboard Key    press    Enter
    TRY
        Verify Text     ${FILTERS_CONTROL}       ${value}
    EXCEPT
        Verify Text     ${FILTERS_CONTROL}       ${value}
    END
