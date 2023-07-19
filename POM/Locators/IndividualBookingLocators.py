class IndividualBookingLocators:
    DEFAULT_OCCUPATION = '*****'
    DEFAULT_CITY = 'Kiev'
    BTN_BOOK_AN_APPOINTMENT = '//*[@href="/labor/booking/steps"]'
    BOOK_AN_APPOINTMENT_TEXT = '//*[@id="app"]//h1'
    BTN_SELECT_OCCUPATION = '//*[@class="input-group input-group--margin-small"]//*[@class="multiselect__select"]'
    SELECTED_OCCUPATION = f'//*[text()="{DEFAULT_OCCUPATION}"]'
    OCCUPATION_KEY = '//*[@class="step-item__description"]'
    DESCRIPTION_CATEGORY = '//*[@class="step-item__description-category"]'
    CHOOSE_CITY_TEXT = '//*[text()="Choose City"]'
    BTN_SELECT_CITY = '//*[@class="input-group input-group--margin-middle"]//*[@class="multiselect__select"]'
    SELECTED_CITY = f'//*[text()="{DEFAULT_CITY}"]'
    CHOOSE_DATE_TEXT = '//*[text()="Choose Date"]'
    CHOOSE_SESSION_TEXT = '//*[text()="Choose Session "]'
    SESSION_CARDS = '//*[@class="session-card__title"]'
    BTN_NEXT_INDIVIDUAL = '//*[@class="step-two"]//*[@class="btn btn--primary"]'
    SUMMARY_PAGE_TEXT = '//*[text()="Summary Page"]'
    CHECKBOX = 'label[for="accept"]'
    BTN_NEXT_SUMMARY = '//*[@class="btn btn--primary with-preloader no-space"]'
    BOOKED_APPOINTMENTS = '//*[@class="reservation-wrap"]//*[@class="row"]'
    EYE_ICON = '//*[@class="reservation-item__icon eye-icon"]'
    BOOKING_DETAILS_TEXT = '//*[@class="sidebar-item"]'
    DETAILS_VALUE = '//*[@class="details-value"]'
    ALREADY_RESERVATION = '//*[@class="modal-form__heading"]'
    BTN_INDIVIDUAL_OK = '//button[text() = "Ok"]'




