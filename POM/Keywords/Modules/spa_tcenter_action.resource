*** Settings ***
Library         Resources/DataSources/models/ModelBuilder.py
Library         Libraries/Utils.py
Library         Libraries/Api/actions/AdminApiActions.py
Library         Libraries/Api/actions/AuthApiActions.py
Resource        POM/Keywords/Pages/spa_tcenter.resource
Resource        POM/Keywords/Modules/spa_actions.resource
Resource        POM/Keywords/Modules/spa_upload_actions.resource
Variables       POM/Locators/SPALocators.py
Variables       POM/Locators/BaseLocators.py
Variables       POM/Locators/SPATcenterLocators.py
Variables       Resources/Variables/PageNumbersDataset.py
Variables       Resources/Variables/WrongTestCenterDataset.py
Variables       Resources/Variables/Titles.py
Variables       Resources/Variables/InfoMessages.py


*** Keywords ***
Verify Adding New Test Center
    [Arguments]     ${multiple_categories}
    ${tcenter}=     Create New Account
    Add New TCentr      ${tcenter}      ${multiple_categories}
    ${tc_name}=     Cap String      ${tcenter.en_name}
    Verify Text     ${NAME}     ${tc_name}

Test Check Filters And Clear Filters Test Centers Tab
    Click Test Center
    Wait For Elements State     ${ACTIONS}   visible
    ${elements}=     Get Last Entry      ${LAST_ENTRY}
    Verify Field Id    ${elements}[0]
    Verify Field Name    ${elements}[1]
    Verify Field City    ${elements}[2]
    Verify Field Test Center Owner      ${elements}[3]
    Verify Field Status    ${elements}[4]
    Verify Disabling Filters Fields     ${FILTERS}

Test Add New Tcenter With Empty Form
    [Arguments]     ${is_legislator}=True
    Click Test Center
    Wait For Elements State     ${BTN_ADD_INDIVIDUAL}     hidden
    Click Add Test Center
    Click Add TC       ${BTN_ADD_NEW_TCENTR}
    Verify Empty Fields     ${is_legislator}

Test Check Ability To Add Owner With Registered Email
    ${tcenter}=     Create New Account
    Add New TCentr      ${tcenter}      multiple_categories=False       warning=True
    Verify Warning Duplicate Name
    Verify Warning Duplicate Email

Test Check Ability See The List Of Test Centers Pagination
    # TODO: Use "PAGE_VALUES" in assert (api)
    FOR    ${_}    IN RANGE    ${PAGE_VALUES}
        Request Token
        ${token}=    Get Token
        Put Permissions     ${token}
        Create Test Center    ${token}
    END
    Verify Search Result Value
    Click Next

Test Check Ability To Add New Tcenter With Invalid Data
    [Arguments]
    ...     ${is_add_btn}=True
    ...     ${is_legislator}=True
    Click Test Center
    Wait For Elements State     ${BTN_ADD_INDIVIDUAL}     hidden
    Click Add Test Center
    Verify Wrong Data On Edit Form      ${is_add_btn}        ${is_legislator}

Test Can View Edit Tcenter Form
    [Arguments]
    ...     ${is_legislator}=True
    Click Test Center
    Wait For Elements State     ${BTN_ADD_INDIVIDUAL}     hidden
    Click Icon Edit
    Wait For Elements State     ${WAITING_SPINNER}     hidden
    Verify View Edit Tcenter Form       ${is_legislator}

Test Can Edit Tcenter With Valid Data
    [Arguments]
    ...     ${is_legislator}=True
    ${tcenter}=     Create New Account
    Click Test Center
    Wait For Elements State     ${BTN_ADD_INDIVIDUAL}     hidden
    Click Icon Edit
    Wait For Elements State     ${WAITING_SPINNER}     hidden
    Fill TCenter Form       ${tcenter}      is_legislator=${is_legislator}        is_add_btn=False
    ${tc_name}=     Cap String      ${tcenter.en_name}
    IF    ${is_legislator}      Verify Text     ${TCENTER_OWNER}      ${tc_name}
    Verify Text     ${CITY_TC}      ${tcenter.city}
    Verify Text     ${NAME}      ${tc_name}
    Verify Text     ${STATUS}       Active

Test Can Not Edit Owner With Registered Email And Duplicate Name
    [Arguments]
    ...     ${is_legislator}=True
    Click Test Center
    Wait For Elements State     ${BTN_ADD_INDIVIDUAL}     hidden
    Click Icon Edit
    Wait For Elements State     ${WAITING_SPINNER}     hidden
    ${tcenter}=     Create New Account
    Fill TCenter Form       ${tcenter}       is_legislator=${is_legislator}
    ...     warning=True      is_add_btn=False
    Verify Text     ${WARNING_NAME}       ${TC_NAME_IS_REGISTERED}
    IF      ${is_legislator}
        Verify Text     ${WARNING_EMAIL}        ${EMAIL_IS_EXIST}
        Verify Text     ${WARNING_OWNER_NAME}       ${TC_NAME_IS_REGISTERED}
    END

Test Can Edit Test Center With Invalid Data
    [Arguments]
    ...     ${is_legislator}=True
    ...     ${is_add_btn}=False
    Click Test Center
    Wait For Elements State     ${BTN_ADD_INDIVIDUAL}     hidden
    Click Icon Edit
    Wait For Elements State     ${WAITING_SPINNER}     hidden
    Verify Wrong Data On Edit Form      ${is_add_btn}        ${is_legislator}

Test Edit Test Center With Empty Form And Can Not Edit Country Field
    [Arguments]
    ...     ${is_legislator}=True
    Click Test Center
    Wait For Elements State     ${BTN_ADD_INDIVIDUAL}     hidden
    Click Icon Edit
    Wait For Elements State     ${WAITING_SPINNER}     hidden
    Clear All Fields        ${is_legislator}
    Get Element States    ${FIELD_COUNTRY}    validate    value & disabled
    Click Edit
    Verify Empty Fields     ${is_legislator}

Test Can View Test Center Information
    Click Test Center
    Wait For Elements State     ${BTN_ADD_INDIVIDUAL}     hidden
    Click Icon View
    Wait For Elements State     ${WAITING_SPINNER}     hidden
    Verify Text     ${TEST_CENTER_INFORMATION}      ${SPA_TEST_CENTER_INFORMATION}

Test Can Delete Test Center
    Click Test Center
    Wait For Elements State     ${BTN_ADD_INDIVIDUAL}     hidden
    Click Icon Remove
    Click Confirm
    Wait For Elements State     ${WAITING_SPINNER}     hidden
    Verify Text    ${SPA_NO_DATA_AVAILABLE}     ${NO_DATA_AVAILABLE}

Test Can View The List Of Upload Files Of Deleted Test Center
    Upload Group Of Labors Index
    Wait For Elements State     ${WAITING_SPINNER}     hidden
    ${data_before}=    Get Text    ${SEARCH_RESULTS}
    Test Can Delete Test Center
    Wait For Elements State     ${WAITING_SPINNER}     hidden
    Click Uploaded Files
    Wait For Elements State     ${WAITING_SPINNER}     hidden
    ${data_after}=    Get Text    ${SEARCH_RESULTS}
    Should Be Equal     ${data_before}      ${data_after}

Add New TCentr
    [Arguments]
    ...     ${tcenter}
    ...     ${multiple_categories}
    ...     ${warning}=False
    ...     ${is_legislator}=True
    Click Test Center
    Wait For Elements State     ${BTN_ADD_INDIVIDUAL}     hidden
    Click Add Test Center
    Fill TCenter Form       ${tcenter}      ${multiple_categories}      ${warning}

Fill TCenter Form
    [Arguments]
    ...     ${tcenter}
    ...     ${multiple_categories}=False
    ...     ${warning}=False
    ...     ${is_legislator}=True
    ...     ${is_add_btn}=True
    ${past_tcenter}=     Get Test Center Account
    IF    ${warning}
        Fill Name General Information    ${past_tcenter.en_name}
    ELSE
        Fill Name General Information    ${tcenter.en_name}
    END
    Fill Official Contact Number    ${tcenter.sub_number}
    IF      ${multiple_categories}
        Select All Categories
    ELSE
        Check Select Category
    END
    IF      ${is_legislator}
        IF    ${warning}
            Fill Name Test Centr Owner    ${past_tcenter.en_name}
            Fill TCenter Email      ${past_tcenter.email}
        ELSE
            Fill Name Test Centr Owner    ${tcenter.en_name}
            Fill TCenter Email      ${tcenter.email}
        END
    END
    Fill City    ${tcenter.city}
    Fill Street Name    ${tcenter.address}
    Fill Postal Code    ${tcenter.postal_code}
    IF    ${is_add_btn}
        Click Add TC      ${BTN_ADD}
    ELSE
        Click Edit
    END

Verify Empty Fields
    [Arguments]    ${is_legislator}
    Verify Empty Name Field
    Verify Empty Contact Number Field
    IF    ${is_legislator}
        Verify Empty Owner Name Field
        Verify Empty Email Field
        Verify Empty Category List
    END
    Verify Empty City Field
    Verify Empty Street Field

Verify Wrong Data On Edit Form
    [Arguments]
    ...     ${is_add_btn}=True
    ...     ${is_legislator}=True
    IF  ${is_add_btn}
        ${locator_btn}=     Set Variable        ${BTN_ADD}
    ELSE
        ${locator_btn}=     Set Variable        ${BTN_EDIT}
    END
    Fill And Verify Field   ${OFFICIAL_CONTACT_NUMBER}      ${FIELD_OFFICIAL_CONTACT_NUMBER}
    ...     ${WARNING_PHONE_NUMBER}     ${locator_btn}     ${TC_ONLY_DIGITS_CONTACT_NUMBER}
    Fill And Verify Field   ${CITY}      ${FIELD_CITY}
    ...     ${WARNING_CITY}     ${locator_btn}     ${ONLY_EN_CHARS}
    Fill And Verify Field   ${ACCOUNT_POSTAL_CODE}      ${FIELD_POSTAL_CODE}
    ...     ${WARNING_POSTAL_CODE}     ${locator_btn}     ${TC_ONLY_DIGITS_POSTAL_CODE}
    IF  ${is_legislator}
        Fill And Verify Field   ${ACCOUNT_EMAIL}      ${FIELD_EMAIL}
        ...     ${WARNING_EMAIL}     ${locator_btn}     ${TC_VALID_EMAIL}
    END

Verify View Edit Tcenter Form
    [Arguments]
    ...     ${is_legislator}=True
    ${tcenter}=     Get Test Center Account
    Verify Text     ${FIELD_NAME_GENERAL_INFORMATION}       ${tcenter.en_name}
    Verify Text     ${FIELD_OFFICIAL_CONTACT_NUMBER}       ${tcenter.sub_number}
    Verify Text     ${FIELD_CITY}       ${tcenter.city}
    Verify Text     ${FIELD_STREET_NAME}       ${tcenter.address}
    Verify Text     ${FIELD_POSTAL_CODE}       ${tcenter.postal_code}
    IF    ${is_legislator}
        Verify Text    ${FIELD_NAME_TCENTR_OWNER}       ${tcenter.en_name}
        Verify Text    ${FIELD_EMAIL}       ${tcenter.email}
    END

Clear All Fields
    [Arguments]
    ...     ${is_legislator}=True
    Fill Official Contact Number    ${EMPTY}
    Fill Name General Information       ${EMPTY}
    Uncheck Checkbox        ${CATEGORY}
    Fill City       ${EMPTY}
    Fill Street Name        ${EMPTY}
    Fill Postal Code        ${EMPTY}
    IF    ${is_legislator}
        Fill Name Test Centr Owner      ${EMPTY}
        Fill TCenter Email      ${EMPTY}
    END
