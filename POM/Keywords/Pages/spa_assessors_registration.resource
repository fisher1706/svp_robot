*** Settings ***
Resource        POM/Keywords/Modules/base_actions.resource
Resource        POM/Keywords/Pages/base.resource
Library         Libraries/LocatorFunction.py
Library         Libraries/Utils.py
Variables       POM/Locators/SPAAssessorsRegistration.py

*** Variables ***
${ATTR}           style
${QUALIFICATION}             qualification
${EXPERIENCE}             experience
${INSTITUTE}             certified
${IT_SKILLS}             itSkills
${KNOWLEDGE_TOOLS}             tools
${PROF_QUALIFICATION}             profQualification
${INTERNAL_QUALIFICATION}             internalQualification
${INTERNAL_EXPERIENCE}             internalExperience

*** Keywords ***
Open SPA Landing Page
    Open Page    base_url=${SPA_URL}    page_url=home

Open Assessor Registration Page
    Click Button    ${BTN_PARTNERSHIP}
    Click Button    ${ITEM_REGISTERED_AS_ASSESSORS}
    Wait For Elements State    ${TEXT_REGISTER_INTO_SVP}

Upload Passport File
    [Arguments]    ${dir_path}=None
    Upload File By Selector    ${BTN_PASSPORT_FILE}    ${dir_path}

Fill Field Full Name
    [Arguments]    ${name}
    Type Text    ${FIELD_FULL_NAME}     ${name}

Fill Field Date Of Birth
    [Arguments]    ${date}
    Type Text    ${FIELD_DATE_OF_BIRTH}        ${date}

Fill Field CNIC
    [Arguments]    ${cnic}
    Type Text    ${FIELD_CNIC}    ${cnic}

Fill Field Passport Number
    [Arguments]    ${passport}
    Type Text    ${FIELD_PASSPORT_NUMBER}    ${passport}

Fill Field Email
    [Arguments]    ${email}
    Type Text    ${FIELD_EMAIL}    ${email}

Select Gender
    [Arguments]    ${gender}
    Click Button    ${DROPDOWN_GENDER}
    ${locator}=     Create Locator By Text      ${gender}
    Click Button        ${locator}

Select Nationality
    Click Button    ${DROPDOWN_NATIONALITY}
    ${nationalities}=     Get Elements      ${AVAILABLE_NATIONALITIES}
    ${nationality}=       Return Random Data List       ${nationalities}
    Click Button        ${nationality}

Fill Field Phone
    [Arguments]    ${code}      ${phone}
    Click Button        ${DROPDOWN_CODE}
    ${locator}=     Create Locator Dropdown Phone Country Code      ${code}
    Click Button        ${locator}
    Type Text    ${FIELD_PHONE}     ${phone}

Click Btn Continue
    ${elements}=        Get Elements    ${BTN_CONTINUE}
    FOR    ${el}        IN      @{elements}
        ${data}=        Get Element States      ${el}      then    bool(value & visible)
        IF    ${data}
            Click Button    ${el}
            BREAK
        END
    END

Select Country
    [Arguments]    ${country}
    Click Button    ${DROPDOWN_COUNTRY}
    ${locator}=     Create Locator By Text      ${country}
    Click Button        ${locator}

Select City
    [Arguments]    ${city}
    Click Button    ${DROPDOWN_CITY}
    ${locator}=     Create Locator By Text      ${city}
    Click Button        ${locator}
    Click Button    ${TEXT_CITY}

Select Category
    [Arguments]    ${category}
    Click Button    ${DROPDOWN_CATEGORY}
    ${locator}=     Create Locator By Text      ${category}
    Click Button        ${locator}
    Click Button    ${TEXT_CATEGORY}

Select Languages
    [Arguments]    ${languages}
    Click Button    ${DROPDOWN_LANGUAGES}
    ${locator}=     Create Locator By Text      ${languages}
    Click Button        ${locator}
    Click Button    ${TEXT_LANGUAGES}

Choose Education
    [Arguments]    ${value}     ${name}=${QUALIFICATION}
    ${locator}=     Create Locator Radiobutton      name=${name}        value=${value}
    Click Button    ${locator}

Choose Experience
    [Arguments]    ${value}     ${name}=${EXPERIENCE}
    ${locator}=     Create Locator Radiobutton      name=${name}        value=${value}
    Click Button    ${locator}

Choose Institute
    [Arguments]    ${value}     ${name}=${INSTITUTE}
    ${locator}=     Create Locator Radiobutton      name=${name}        value=${value}
    Click Button    ${locator}

Choose IT Skills
    [Arguments]    ${value}     ${name}=${IT_SKILLS}
    ${locator}=     Create Locator Radiobutton      name=${name}        value=${value}
    Click Button    ${locator}

Choose Knowledge
    [Arguments]    ${value}     ${name}=${IT_SKILLS}
    ${locator}=     Create Locator Radiobutton      name=${name}        value=${value}
    Click Button    ${locator}

Choose Knowledge Tools
    [Arguments]    ${value}     ${name}=${KNOWLEDGE_TOOLS}
    ${locator}=     Create Locator Radiobutton      name=${name}        value=${value}
    Click Button    ${locator}

Choose Prof Qualification
    [Arguments]    ${value}     ${name}=${PROF_QUALIFICATION}
    ${locator}=     Create Locator Radiobutton      name=${name}        value=${value}
    Click Button    ${locator}

Choose Internal Qualification
    [Arguments]    ${value}     ${name}=${INTERNAL_QUALIFICATION}
    ${locator}=     Create Locator Radiobutton      name=${name}        value=${value}
    Click Button    ${locator}

Choose Internal Experience
    [Arguments]    ${value}     ${name}=${INTERNAL_EXPERIENCE}
    ${locator}=     Create Locator Radiobutton      name=${name}        value=${value}
    Click Button    ${locator}

Upload Qualifications
    [Arguments]    ${dir_path}=None
    Upload File By Selector    ${BTN_QUALIFICATIONS_FILE}    ${dir_path}

Upload Experience
    [Arguments]    ${dir_path}=None
    Upload File By Selector    ${BTN_EXPERIENCE_FILE}    ${dir_path}

Fill Field Institute Name
    [Arguments]    ${name}
    Type Text    ${FIELD_INSTITUTE_NAME}        ${name}

Click Terms And Conditions
    Click Button        ${FIELD_CONFIRM}

Click Btn Back
    Click Button    ${BTN_BACK}
