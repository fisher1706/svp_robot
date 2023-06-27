*** Settings ***
Resource        POM/Keywords/Pages/admin_country.resource
Resource        POM/Keywords/Pages/base.resource
Resource        POM/Keywords/Modules/admin_base_actions.resource
Library         Libraries/Utils.py
Variables       POM/Locators/AdminCountryLocators.py


*** Keywords ***
Test Create New Country
    Admin Country Actions
    Click New Country
    Wait Spinners To Disappear
    Wait For Elements State     ${NEW_COUNTRY_TEXT}       visible
    Select Country      ${DROPDOWN_COUNTRY}
#    Click Btn Add

Test Edit Country Page By Edit Button
    Open Admin Country Page
    Choose Item Actions     type=Edit
    Wait For Elements State     ${EDIT_COUNTRY}       visible
#    Fill Group Expire Years
#    Fill Field Mandated Date
    Checkboks Actions









Admin Country Actions
    Open Admin Country Page
    Wait Spinners To Disappear
    Wait For Elements State     ${PERMITTED_SERVICES_TEXT}       visible

Choose Item Actions
    [Arguments]     ${type}
    Hover       ${LAST_ACTION}
    IF      '${type}'=='View'
        Click Button        ${ICON_VIEW}
    ELSE
        Click Button        ${ICON_EDIT}
    END

Fill Group Expire Years
    ${elements}=     Get Elements    ${FIELDS_GROUP_EXPIRE_YEARS}
    FOR    ${el}    IN      @{elements}
        TRY
            ${status}=    Get Element States    ${el}       *=    enabled
            ${number}=      Return Random Number Limit
            Type Text       ${el}       ${number}
        EXCEPT
            CONTINUE
        END
    END

Fill Field Mandated Date
    ${date}=    Get Current Date
    Type Text    ${FIELD_MANDATED_DATE}     ${date}
    Keyboard Key    press    Enter

Checkboks Actions
    ${elements}=    Get Elements    ${CHECKBOX}
    FOR    ${el}    IN      @{elements}
        TRY
            ${status}=    Get Element States    ${el}//*[@class="checkbox__input test-center-check"]       *=    disabled
            CONTINUE
        EXCEPT
            ${state}=    Get Checkbox State    ${el}//*[@class="checkbox__input test-center-check"]
            IF    ${state}
                Uncheck Checkbox    ${el}//*[@class="checkbox__label text--regent-gray"]
            ELSE
                Check Checkbox    ${el}//*[@class="checkbox__label text--regent-gray"]
            END
        END
    END
