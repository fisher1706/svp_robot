*** Settings ***
Resource            Resources/Setup/webdriver_manager.resource
Resource            POM/Keywords/Modules/backgrounds.resource
Resource            POM/Keywords/Modules/spa_reports_action.resource

Test Setup    Run Keywords    Open Chrome Browser       AND     Create Entities And Log In
...     is_tcenter_activate=True
...     is_tcenter=True


*** Test Cases ***
Check the ability to download certificate as a Test Center
    Verify Download Certificate Report      is_reports_tab=True

Check the ability to download report as a Test Center
    Verify Download Certificate Report      is_certificate=False    is_reports_tab=True

Check the ability to download report on view payment details as a Test Center
    Verify Download Certificate Report      is_certificate=False    is_reports_tab=True     is_view_payment=True
