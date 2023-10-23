*** Settings ***
Resource        POM/Keywords/Pages/admin_table_space.resource
Library         Collections


*** Keywords ***
Test Check Admin And Super Admin Space
    [Arguments]     ${url}
    Open Necessary Admin Page       page_url=${url}
    Check Admin Space Header
    Check Admin Space Size      url=${url}
    Check Admin Alternating Rows
    IF    '${url}'=='faqs'
        RETURN
    ELSE IF     '${url}'=='legislators'
        RETURN
    ELSE IF     '${url}'=='labor-attaches'
        RETURN
    ELSE
        Check Admin Fixed Header And Displaed Rows Dropdown
    END

Check Admin Space Size
    [Arguments]     ${url}
    ${label}=       Get From Dictionary     dictionary=${SPACE_DATASET}      key=${url}
    Check Cell Font Size    data_label=${label}

Check Cell Font Size
    [Arguments]
    ...     ${data_label}
    ...     ${key}=${ATTR_FONT_SIZE}
    ...     ${attr}=${FRONT_SIZE_STANDARD}
    FOR    ${label}     IN      @{data_label}
        IF      '${label}'=='Actions'       Check Actions Dropdown List Font Size   label=${label}
        ${cell_locator}=    Create Locator Cell     ${label}
        ${elements}=    Get Elements        ${cell_locator}
        FOR    ${element}   IN      @{elements}
            ${data}=        Get Necessary Attribute     locator=${element}    key=${key}
            Verify Necessary Attribute      data=${data}        attr=${attr}
        END
    END

Check Admin Space Header
    [Arguments]
    ...     ${locator}=${SPACE_HEADER}
    ...     ${key_color}=${ATTR_COLOR}
    ...     ${key_font_size}=${ATTR_FONT_SIZE}
    ...     ${attr_color}=${COLOR_STANDARD}
    ...     ${attr_font_size}=${FRONT_SIZE_HEADER_STANDARD}
    ${data_color}=        Get Necessary Attribute     locator=${locator}    key=${key_color}
    Verify Necessary Attribute      data=${data_color}        attr=${attr_color}
    ${data_size}=        Get Necessary Attribute     locator=${locator}    key=${key_font_size}
    Verify Necessary Attribute      data=${data_size}        attr=${attr_font_size}

Check Admin Alternating Rows
    [Arguments]
    ...     ${locator}=${SPACE_ROWS}
    ...     ${key}=${ATTR_COLOR_ROW}
    ${rowList}=     Create List
    ${rows}=     Get Elements    ${locator}
    FOR     ${row}      IN      @{rows}
        ${data}=        Get Necessary Attribute     locator=${row}      key=${key}
        Append To List      ${rowList}      ${data}
    END
    Verify Necessary List Attributes     list=${rowList}

Check Admin Fixed Header And Displaed Rows Dropdown
    [Arguments]
    ...     ${locator_header}=${SPACE_HEADER}
    ...     ${locator_dropdown}=${CHOOSE_DROPDOWN}
    ...     ${locator_rows}=${SPACE_ROWS}
    ...     ${arg}=${ROWS_COUNT}
    Verify Header Is Visible    locator=${locator_header}
    FOR    ${count}     IN      @{arg}
        Select Dropdown Rows    locator=${locator_dropdown}     arg=${count}
        ${len}=    Get Rows Count      locator=${locator_rows}
        Verify Rows Count       data=${len}     data_standard=${count}
        Verify Header Is Visible    locator=${locator_header}
    END

Check Actions Dropdown List Font Size
    [Arguments]
    ...     ${label}
    ...     ${key}=${ATTR_FONT_SIZE}
    ...     ${attr}=${FRONT_SIZE_STANDARD}
    ${cell_locator}=    Create Locator Dropdown List Actions     ${label}
    ${elements}=    Get Elements        ${cell_locator}
    FOR    ${element}   IN      @{elements}
        ${data}=        Get Necessary Attribute     locator=${element}    key=${key}
        Verify Necessary Attribute      data=${data}        attr=${attr}
    END
