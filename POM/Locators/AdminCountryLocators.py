class AdminCountryLocators:
    PERMITTED_SERVICES_TEXT = '//*[@id="app"]//h1'

    BTN_NEW_COUNTRY = '//*[@href="/country/add"]'
    NEW_COUNTRY_TEXT = '//*[@id="app"]//h1'
    BTN_ADD = '//*[text()="Add"]'
    DROPDOWN_COUNTRY = '//*[@id="country"]'

    LAST_ACTION = 'tr:nth-child(1) td[data-label="Actions"]'
    ICON_VIEW = 'tr:nth-child(1) td[data-label="Actions"] li:nth-child(1) a'
    ICON_EDIT = 'tr:nth-child(1) td[data-label="Actions"] li:nth-child(2) a'

    EDIT_COUNTRY = '//*[@id="app"]//h1'

    FIELDS_GROUP_EXPIRE_YEARS = '//*[@id="arabic_name"]'
    FIELD_MANDATED_DATE = '//*[@placeholder="dd-mm-yyyy"]'

    # CHECKBOX = '//*[@class="checkbox__input test-center-check"]'
    # CHECKBOX = '//*[@class="checkbox__label text--regent-gray"]'
    CHECKBOX = '//*[@class="checkbox"]'



