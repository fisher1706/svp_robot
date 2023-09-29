from Resources.Variables import SuperAdminTestData


class SuperAdminUsersLocators:
    ADMIN_USERS_TEXT = '//*[@id="app"]//h1'
    BTN_INVITE_NEW_USER = '//button[text() = "Invite new user"]'
    FIELD_ENTER_USER_EMAIL_ADDRESS = '//*[@id="user_email"]'
    BTN_SEND_INVITATION = '//button[text() = "Send Invitation"]'
    BTN_OK = '//button[text() = "ok"]'
    LAST_ENTRY = 'tbody tr:nth-child(1)'
    WARNING_FIELD_INVALID_EMAIL = '//*[@class="q-page-box__content"]' \
                                  '//*[@class="validation-message__text validation-message__text--error"]'
    LAST_ACTIONS = 'tr:nth-child(1) td[data-label="Actions"]'
    RESEND_ACTIONS = 'tr:nth-child(1) td[data-label="Actions"] li:nth-child(1) span'
    BTN_YES = '//button[text() = "yes"]'
    BTN_NO = '//button[text() = "no"]'
    BTN_NEXT = '.next a'
    NECESSARY_USER = f'//span[text()="{SuperAdminTestData.DEFAULT_ID}"]/../../..'
    NECESSARY_ACTIONS = f'{NECESSARY_USER}//*[@class="actionTypeLinks"]'
    NECESSARY_STATUS = f'{NECESSARY_USER}/td[7]'
    NECESSARY_ROLE = f'{NECESSARY_USER}/td[3]'
    CHOOSE_A_ROLE_TEXT = '//*[@class="modal-form__heading"]'
    OPEN_ROLES = '//*[@class="user-roles__item"]'
    BTN_SAVE = '//button[text() = "Save"]'
