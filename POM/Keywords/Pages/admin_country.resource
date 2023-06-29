*** Settings ***
Resource            POM/Keywords/Pages/base.resource
Resource            POM/Keywords/Modules/base_actions.resource
Library             Libraries/Utils.py
Variables           POM/Locators/AdminCountryLocators.py


*** Variables ***
@{Second_atr}
...     viewUploadFiles
...     viewTransactionsHis
...     centerViewUploadData
...     centerViewTransactionsHis


*** Keywords ***
Open Admin Country Page
    Open Page    base_url=${ADMIN_URL}    page_url=country-settings

Click New Country
    Click Button        ${BTN_NEW_COUNTRY}

Click Btn Add
    Click Button    ${BTN_ADD}

Click Btn Edit
    Click Button    ${BTN_EDIT}

Click Btn Seach
    Click Button    ${BTN_SEARCH}

Click Btn Cancel
    Click Button    ${BTN_CANCEL}

Click Dtn Del Nationality
    Click Button    ${BTN_DEL}

Select Dropdown List
    [Arguments]    ${selector}      ${val}=1     ${attr}=index
    Click Button    ${selector}
    Select Options By    ${selector}    ${attr}    ${val}
    Keyboard Key    press    Enter

Choose Item Actions
    [Arguments]     ${type}
    Hover       ${LAST_ACTION}
    IF      '${type}'=='View'
        Click Button        ${ICON_VIEW}
    ELSE
        Click Button        ${ICON_EDIT}
    END

Fill Group Expire Years
    [Arguments]    ${start}=50      ${end}=100      ${years}=True
    ${elements}=     Get Elements    ${FIELDS_GROUP_EXPIRE_YEARS}
    ${len}=     Get Length    ${elements}
    IF      ${years}     Type Text       ${elements}[0]       50
    FOR    ${i}    IN RANGE    1   ${len}
        TRY
            ${status}=    Get Element States    ${elements}[${i}]       *=    enabled
            ${number}=      Return Random Number Limit      start=${start}      end=${end}
            Type Text       ${elements}[${i}]       ${number}
        EXCEPT
            CONTINUE
        END
    END

Fill Field Mandated Date
    ${date}=    Get Current Date
    Type Text    ${FIELD_MANDATED_DATE}     ${date}
    Keyboard Key    press    Enter

Set Settings Legislator And TCenter
    ${second_checkbox}=     Create List
    ${elements}=    Get Elements    ${CHECKBOX}
    FOR    ${el}    IN      @{elements}
        ${atr}=    Get Attribute   ${el}${CHECKBOX_CHECK}    id
        IF      '${atr}' in @{Second_atr}
            Append To List      ${second_checkbox}      ${el}
            CONTINUE
        ELSE
            ${state}=    Get Checkbox State    ${el}${CHECKBOX_CHECK}
            IF    ${state}
                Uncheck Checkbox    ${el}${CHECKBOX_GRAY}
            ELSE
                CONTINUE
            END
        END
    END

    FOR    ${el}    IN      @{second_checkbox}
        Uncheck Checkbox    ${el}${CHECKBOX_GRAY}
    END

    FOR    ${el}    IN      @{elements}
        TRY
            ${status}=    Get Element States    ${el}${CHECKBOX_CHECK}       *=    disabled
            CONTINUE
        EXCEPT
            Check Checkbox    ${el}${CHECKBOX_GRAY}
        END
    END

Choose Category
    ${elements}=        Get Elements    ${CHECKBOX_CATEGORY}
    FOR    ${el}    IN      @{elements}
        Uncheck Checkbox    ${el}${CHECKBOX_LABEL}
    END
    ${number}=      Return Random Number Limit      end=50
    Check Checkbox      ${elements}[${number}]${CHECKBOX_LABEL}

Choose Nationality
    [Arguments]    ${start}=//*[text()="     ${end}="]
    ${natioalities}=        Get Nationality List
    ${natioality}=      Return Random Data List     ${natioalities}
    ${state}=    Get Element States      ${BTN_DEL}      then    bool(value & visible)
    IF  ${state}    Click Dtn Del Nationality
    Click Button    ${SELECT_NATIONALITY}
    ${elements}=    Get Elements        ${start}${natioality}${end}
    Click Button    ${elements}[-1]
    [Return]        ${natioality}

Get Nationality List
    ${natioalities}=     Create List
    ${elements}=    Get Elements        ${NATIONALITY}
    FOR    ${el}    IN      @{elements}
        ${text}=    Get Text    ${el}
        Append To List      ${natioalities}      ${text}
    END
    [Return]        ${natioalities}
