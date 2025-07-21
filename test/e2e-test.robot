*** Settings ***

Resource    resources/keyword.robot
Resource    pageObject/object_page.robot
Resource    testdata/test_data.robot

*** Test Cases ***
Login using invalid data company id, username, password
    [Documentation]    Test untuk login menggunakan data yang tidak valid.
    Open app
    Wait Element Visible                ${BTN_ALLOW_PERMISSION}
    Wait Element Visible                ${TXT_COMPANY_ID}
    Input Text                          ${TXT_COMPANY_ID}    invalid_company_id
    Input Text                          ${TXT_USERNAME}      invalid_username
    Input Text                          ${TXT_PASSWORD}      invalid_password
    Click Element                       ${BTN_LOGIN}
    Wait Until Page Contains Element    ${TXT_ERR_LOGIN}    timeout=5s

Login using valid data company id, username, password
    [Documentation]    Test untuk login menggunakan data yang valid.
    Open app
    Wait Element Visible             ${BTN_ALLOW_PERMISSION}
    Wait Until Element Is Visible    ${TXT_COMPANY_ID}
    Input Text                       ${TXT_COMPANY_ID}    ${COMPANY_ID}
    Input Text                       ${TXT_USERNAME}      ${USERNAME}
    Input Text                       ${TXT_PASSWORD}      ${PASSWORD}
    Click Element                    ${BTN_LOGIN}
    Wait Element Visible             ${BTN_ALLOW_FOREGROUND}

Verify form new customer registration
    [Documentation]    Test untuk memverifikasi form pendaftaran pelanggan baru.
    Open app
    Wait Until Element Is Visible          ${LOGO_EWORK}
    Click Element                          ${BTN_NEW_CUSTOMER}
    Wait Until Element Is Visible          ${TXT_HEADER}
    Wait Until Element Is Visible          ${BTN_REG_NEWCUSTOMER}
    Click Element                          ${BTN_REG_NEWCUSTOMER}
    Wait Until Element Is Visible          ${TXT_OUTLET_NAME}
    Wait Until Element Is Visible          ${TXT_OUTLET_PHONE}
    Wait Until Element Is Visible          ${TXT_OUTLET_EMAIL}
    Wait Until Element Is Visible          ${TXT_CONTACT_PERSON}
    Wait Until Element Is Visible          ${DROPDOWN_CHANNEL}
    Wait Until Element Is Visible          ${DROPDOWN_OUTLET_TYPE}
    Wait Until Element Is Visible          ${BTN_CONTINUE}

User can create customer
    [Documentation]    Test untuk membuat pelanggan baru.
    Open app
    Wait Until Element Is Visible          ${LOGO_EWORK}
    Click Element                          ${BTN_NEW_CUSTOMER}
    Wait Until Element Is Visible          ${TXT_HEADER}
    Wait Until Element Is Visible          ${BTN_REG_NEWCUSTOMER}
    Click Element                          ${BTN_REG_NEWCUSTOMER}
    # Basic form input
    Wait Until Element Is Visible          ${TXT_OUTLET_NAME}
    Input Text                             ${TXT_OUTLET_NAME}        ${OUTLET_NAME}
    Input Text                             ${TXT_OUTLET_PHONE}       ${OUTLET_PHONE}
    Input Text                             ${TXT_OUTLET_EMAIL}       ${OUTLET_EMAIL}
    Input Text                             ${TXT_CONTACT_PERSON}     ${USERNAME}
    Click Element                          ${DROPDOWN_CHANNEL}
    Wait Until Element Is Visible          ${CHANNEL_MT}
    Click Element                          ${CHANNEL_MT}
    Click Element                          ${DROPDOWN_OUTLET_TYPE}
    Wait Until Element Is Visible          ${OUTLET_GROSIR}
    Click Element                          ${OUTLET_GROSIR}
    Wait Until Element Is Visible          ${BTN_CONTINUE}
    Click Element                          ${BTN_CONTINUE}
    # Location input
    Wait Until Element Is Visible          ${DROPDOWN_ADDRESS}
    Click Element                          ${DROPDOWN_ADDRESS}
    Wait Until Element Is Visible          ${ADDRESS_TYPE}
    Click Element                          ${ADDRESS_TYPE}
    Wait Until Element Is Visible          ${TXT_ADDRESS}
    Input Text                             ${TXT_ADDRESS}            ${TXT_ADDRESS_LOC}
    Wait Until Element Is Visible          ${DROPDOWN_PROVINCE}
    Click Element                          ${DROPDOWN_PROVINCE}
    Select option from bottom sheet          ${TXT_PROVINCE}
    Scroll Hingga Elemen Terlihat          ${DROPDOWN_CITY}
    Click Element                          ${DROPDOWN_CITY}
    Select option from bottom sheet          ${TXT_CITY}
    Scroll Hingga Elemen Terlihat          ${DROPDOWN_DISTRICT}
    Click Element                          ${DROPDOWN_DISTRICT} timeout=10s
    Select option from bottom sheet          ${TXT_DISTRICT}
    Click Element                          ${DROPDOWN_SUBDISTRICT}
    Select option from bottom sheet          ${TXT_SUBDISTRICT}
    Click Element                          ${DROPDOWN_POSTAL_CODE}
    Wait Until Element Is Visible          ${TXT_POSTAL}
    Click Element                          ${TXT_POSTAL}
    Click Element                          ${BTN_SUBMIT}
    Wait Element Visible                    ${BTN_POSITIVE}
    Wait Element Visible                    ${BTN_ALLOW_FOREGROUND}
    Wait Until Element Is Visible          ${KTP}
    Input Text                             ${KTP}                    1234567890123456
    Wait Until Element Is Visible          ${BTN_UPLOAD}
    Click Element                          ${BTN_UPLOAD}
    Wait Until Element Is Visible          ${BTN_CAPTURE}
    Click Element                          ${BTN_CAPTURE}
    Click Element                          ${BTN_SUBMIT_REG}
    Wait Until Element Is Visible          ${TV_PREVIEW}
    Wait Until Element Is Visible          ${SIGNATURE_VIEW}
    Sign On Digital Signature              ${SIGNATURE_VIEW}
    Wait Element Visible                   ${BTN_SUBMIT_SIGN}
    Click Element                          ${BTN_SUBMIT_SIGN}