*** Settings ***
Documentation       Test Suite for Check certificate and exam result

Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/spa_check_certificate_exam_actions.resource

Test Setup          Run Keywords    Open Chrome Browser     AND     Open SPA Home Page


*** Test Cases ***
TC-1431 Test Verify User Is Able See Modal Window For Checking Certificates And Exam Resutl With Fields Name
    Test To Chek

TC-1432 TC-1439 Verify That User Is Able Enter Valid Certificate Number And Verify System's Message SVPI
    Test Ability Enter Certificate Data And Verify System Message
    ...     passport=${DEFAULT_PASSPORT_SVPI}
    ...     certificates=${CERTIFICATES_SVPI}
    ...     locator=${FIELD_CERTIFICATE_SUCCESS_MESSAGE}
    ...     message=${MSG_VALID_CERTIFICATE}

TC-1441 Verify That User Is Able Enter Valid Certificate Number And Verify System's Message SVPL
    Test Ability Enter Certificate Data And Verify System Message
    ...     passport=${DEFAULT_PASSPORT_SVPL}
    ...     certificates=${CERTIFICATES_SVPL}
    ...     locator=${FIELD_CERTIFICATE_SUCCESS_MESSAGE}
    ...     message=${MSG_VALID_CERTIFICATE}

TC-1435 Verify That User Is Able Enter Expired Certificate Number And Verify System's Message
    Test Ability Enter Certificate Data And Verify System Message
    ...     passport=${DEFAULT_EXPIRED_PASSPORT_SVPI}
    ...     certificates=${EXPIRED_CERTIFICATES_SVPI}
    ...     locator=${FIELD_CERTIFICATE_ERROR_MESSAGE}
    ...     message=${MSG_EXPIRED_CERTIFICATE}

TC-1436 Verify That User Is Able Enter Incorrect Certificate Number And Verify System's Message
    Test Ability Enter Certificate Data And Verify System Message
    ...     passport=${DEFAULT_PASSPORT_SVPL}
    ...     certificates=${EXPIRED_CERTIFICATES_SVPI}
    ...     locator=${FIELD_CERTIFICATE_ERROR_MESSAGE}
    ...     message=${MSG_INVALID_PASSPORT_OR_CERTIFICATE}

TC-1434 Verify That User Is Able Enter No Exist Certificate Number And Verify System's Message
    Test Ability Enter Certificate Data And Verify System Message
    ...     passport=${NO_EXIST_PASSPORT}
    ...     certificates=${DOES_NO_EXIST_CERTIFICATES}
    ...     locator=${FIELD_CERTIFICATE_ERROR_MESSAGE}
    ...     message=${MSG_CERTIFICATE_NOT_EXIST}

TC-1433 Test Verify Negative Verification For Certificate
    Test Negative Verification Certificate

Test Verify Negative Verification For Labor Result
    Test Verification Labor Result
    ...     passport=${INVALID_PASSPORT_NUMBERS}[0]
    ...     occupation=${INVALID_OCCUPATION_KEY}
    ...     nationality=${INVALID_NATIONALITY_CODE}

Verify That User Is Able Enter No Exist Data For Check Labor And Verify System's Message
    Test Verification Labor Result
    ...     passport=${PASSPORT_LABOR}
    ...     occupation=${NO_EXIST_OCCUPATION_KEY}
    ...     nationality=${NO_EXIST_NATIONALITY_CODE}
    ...     is_warning=False
    ...     message=${MSG_NO_RESULT_CHECK_LABOR}
