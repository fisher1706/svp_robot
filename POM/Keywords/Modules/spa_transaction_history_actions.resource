*** Settings ***
Resource        POM/Keywords/Pages/spa_transaction_history.resource
Resource        POM/Keywords/Modules/spa_payment_actions.resource


*** Keywords ***
Test Check Filters And Clear Filters
    Test Get Credits
    Click Transaction History
    Wait For Elements State     ${STATUS_HISTORY}   visible
    ${elements}     Get Last Entry      ${LAST_ENTRY}
    Verify Field Refernce Number    ${elements}[0]
    Verify Field Amount    ${elements}[1]
    Verify Field Date    ${elements}[2]
    Verify Field Status    ${elements}[3]
    Verify Disabling Filters Fields     ${FILTERS_HISTORY}

Verify Transactions Statuses
    FOR    ${state}     IN      @{TRANSACTION_STATE_LIST}
        IF    '${state}'!='${TRANSACTION_STATE_LIST}[0]'
            CONTINUE
        ELSE
            Pass Credit Flow        ${state}
            Click Payment
        END
        Click Transaction History
        Wait For Elements State     ${STATUS_HISTORY}   visible
        IF      '${state}'=='${TRANSACTION_STATE_LIST}[0]'
            Verify Text     ${STATUS_HISTORY}       ${TRANSACTION_STATUSES}[0]
        ELSE IF     '${state}'=='${TRANSACTION_STATE_LIST}[-1]'
            Verify Text     ${STATUS_HISTORY}       ${TRANSACTION_STATUSES}[1]
        ELSE
            Verify Text     ${STATUS_HISTORY}       ${TRANSACTION_STATUSES}[2]
        END
    END

Test Download Certificate On View Payment Details
    Test Invoice After Passing Get Credits Flow
