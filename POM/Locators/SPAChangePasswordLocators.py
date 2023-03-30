BTN_BACK = '.btn-auth'
BTN_CHANGE_PASSWORD = '#continue_button'

FIELD_CURRENT_PASSWORD = '#current_password'
ICON_VIEW_CURRENT_PASSWORD = f'{FIELD_CURRENT_PASSWORD} + span'
FIELD_NEW_PASSWORD = '#password'
ICON_VIEW_NEW_PASSWORD = f'{FIELD_NEW_PASSWORD} + span'
FIELD_CONFIRMED_NEW_PASSWORD = '#confirmedPassword'
ICON_VIEW_CONFIRMED_NEW_PASSWORD = f'{FIELD_CONFIRMED_NEW_PASSWORD} + span'

WARNING_CURRENT_PASSWORD = '//input[@id="current_password"]/parent::div/following-sibling::div/span/span'
WARNING_NEW_PASSWORD = '//input[@id="password"]/parent::div/following-sibling::div/span/span'
WARNING_CONFIRM_NEW_PASSWORD = '//input[@id="confirmedPassword"]/parent::div/following-sibling::div/span/span'
