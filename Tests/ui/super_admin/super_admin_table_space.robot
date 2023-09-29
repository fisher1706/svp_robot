*** Settings ***
Documentation       Test Suite for Super Admin Table Space

Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/login_actions.resource
Resource            POM/Keywords/Modules/admin_table_space_actions.resource

Test Setup    Run Keywords    Open Chrome Browser   AND     Log In To The Admin Portal      login=${SUPER_ADMIN}


*** Test Cases ***
Checking Space Legislators
    Test Check Admin And Super Admin Space
    ...     url=${URL_LEGISLATORS}

Checking Space Labors Results
    Test Check Admin And Super Admin Space
    ...     url=${URL_LABORS}

Checking Space Labors
    Test Check Admin And Super Admin Space
    ...     url=${URL_REGISTERED_LABORS}

Checking Space Labor Attaches
    Test Check Admin And Super Admin Space
    ...     url=${URL_LABOR_ATTACHES}

Checking Space Admin Users
    Test Check Admin And Super Admin Space
    ...     url=${URL_ADMINS}

Checking Space Assessors
    Test Check Admin And Super Admin Space
    ...     url=${URL_ASSESSORS}

Checking Space Test Centers
    Test Check Admin And Super Admin Space
    ...     url=${URL_CENTERS}

Checking Space Exam Sessions
    Test Check Admin And Super Admin Space
    ...     url=${URL_EXAM_SESSIONS}

Checking Space SVPL Reservations
    Test Check Admin And Super Admin Space
    ...     url=${URL_RESERVATIONS_SVPL}

Checking Space SVPI Reservations
    Test Check Admin And Super Admin Space
    ...     url=${URL_RESERVATIONS}

Checking Space Requests
    Test Check Admin And Super Admin Space
    ...     url=${URL_REQUESTS}

Checking Space Occupations
    Test Check Admin And Super Admin Space
    ...     url=${URL_OCCUPATIONS}

Checking Space Categories
    Test Check Admin And Super Admin Space
    ...     url=${URL_CATEGORIES}

Checking Space Country Setting
    Test Check Admin And Super Admin Space
    ...     url=${URL_COUNTRY_SETTINGS}

Checking Space Action Logs
    Test Check Admin And Super Admin Space
    ...     url=${URL_LOGS}

Checking Space FAQ
    Test Check Admin And Super Admin Space
    ...     url=${URL_FAQS}

Checking Space Transactions Logs
    Test Check Admin And Super Admin Space
    ...     url=${URL_TRANSACTIONS}

Checking Certificate Balance
    Test Check Admin And Super Admin Space
    ...     url=${URL_CERTIFICATE_BALANCE}

Checking CSV History
    Test Check Admin And Super Admin Space
    ...     url=${URL_CSV_HISTORY}

Checking Invoice History
    Test Check Admin And Super Admin Space
    ...     url=${URL_INVOICE_HISTORY}
