*** Settings ***
Resource    POM/Keywords/Pages/spa_payment.resource
Variables    Resources/Variables/dataset.py     GetCreditsDataset


*** Keywords ***
Generate Payment
    [Arguments]    ${amount}
    Click Payment
    Click Get Credit
    Fill Certificates       ${amount}
    Click Pay
    Wait For Elements State    ${FIELD_CARD_HOLDER}
    Fill Card Number        ${GetCreditsDataset.VALID_CARD_DETAILS[0]}
    Fill CVV                ${GetCreditsDataset.VALID_CARD_DETAILS[3]}
    Fill Expity Date        ${GetCreditsDataset.VALID_CARD_DETAILS[1]}
    Fill Card Holder        ${GetCreditsDataset.VALID_CARD_DETAILS[2]}
    Click Pay Now
    Click Transaction Pay
    Wait For Elements State    ${PAYMENT_REFERENCE_NUMBER}      visible

Activate payment
    Click Payment
    Click Select All
    Click Issue
    Click Confirm
