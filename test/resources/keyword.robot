*** Settings ***
Library    AppiumLibrary
Resource    mobile_capabilities.robot

*** Keywords ***
Open app
    Open Application    ${APPIUM_SERVER_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    platformVersion=${PLATFORM_VERSION}
    ...    deviceName=${DEVICE_NAME}
    ...    appPackage=${APP_PACKAGE}
    ...    appActivity=${APP_ACTIVITY}
    # Baris ini dihilangkan: ...    app=${APP_PATH}
    ...    noReset=${NO_RESET}
    ...    fullReset=${FULL_RESET}

Tutup Aplikasi Mobile
    Close Application

Wait Element Visible
    [Documentation]    Mencoba mencari elemen dengan locator yang diberikan dalam batas waktu tertentu.
    ...              Jika elemen terlihat, klik elemen tersebut. Jika tidak, tetap lanjutkan tanpa gagal.
    [Arguments]    ${locator}    ${timeout}=5s
    ${status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator}    timeout=${timeout}
    Run Keyword If    ${status}    Click Element    ${locator}
    # Jika tidak, lanjutkan tanpa gagal
    No Operation

Choose Element from parameter
    [Documentation]    Keyword ini mengklik elemen provinsi, kota, atau desa berdasarkan nama yang diberikan sebagai parameter.
    [Arguments]        ${param}
    ${locator}    Set Variable    xpath=//android.widget.TextView[@resource-id="id.edot.ework:id/txt_name" and @text="${param}"] 
    Wait Until Page Contains Element    ${locator}    timeout=10s
    Click Element                       ${locator}

Input Text To EditText By Xpath
    [Documentation]    Mengisi EditText menggunakan xpath, dengan penanganan scroll dan fallback jika metode tidak didukung.
    [Arguments]    ${xpath}    ${text}    ${max_swipes}=5
    FOR    ${INDEX}    IN RANGE    ${max_swipes}
        ${is_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${xpath}    timeout=1s
        Run Keyword If    ${is_visible}    Exit For Loop
        Swipe    50    80    50    30    500
        Sleep    0.5s
    END
    ${is_visible}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${xpath}    timeout=2s
    Run Keyword Unless    ${is_visible}    Fail    EditText '${xpath}' not visible after swiping.
    # Coba input text, jika gagal karena method tidak didukung, gagal
    ${input_result}=    Run Keyword And Ignore Error    Input Text    ${xpath}    ${text}
    Run Keyword If    '${input_result[0]}' == 'PASS'    Return From Keyword
    Fail    Unable to input text to EditText '${xpath}' using supported methods.

Get Window Size
    [Documentation]    Mengambil ukuran layar perangkat (width dan height) menggunakan Appium.
    ${result}=    Execute Script    return driver.get_window_size()
    RETURN    ${result}

Scroll Downs
    [Documentation]    Melakukan swipe ke atas (scroll down) pada layar perangkat dengan koordinat dinamis.
    [Arguments]    ${duration}=500
    ${size}=    Get Window Size
    ${width}=    Set Variable    ${size['width']}
    ${height}=   Set Variable    ${size['height']}
    ${start_x}=  Evaluate    ${width} / 2
    ${start_y}=  Evaluate    ${height} * 0.8
    ${end_x}=    Set Variable    ${start_x}
    ${end_y}=    Evaluate    ${height} * 0.3
    Swipe    ${start_x}    ${start_y}    ${end_x}    ${end_y}    ${duration}

Scroll Ups
    [Documentation]    Melakukan swipe ke bawah (scroll up) pada layar perangkat dengan koordinat dinamis.
    [Arguments]    ${duration}=500
    ${size}=    Get Window Size
    ${width}=    Set Variable    ${size['width']}
    ${height}=   Set Variable    ${size['height']}
    ${start_x}=  Evaluate    ${width} / 2
    ${start_y}=  Evaluate    ${height} * 0.3
    ${end_x}=    Set Variable    ${start_x}
    ${end_y}=    Evaluate    ${height} * 0.8
    Swipe    ${start_x}    ${start_y}    ${end_x}    ${end_y}    ${duration}

Scroll Hingga Elemen Terlihat
    [Arguments]    ${locator}
    FOR    ${i}    IN RANGE    10
        ${elements}=    Run Keyword And Return Status    Page Should Contain Element    ${locator}
        Exit For Loop If    ${elements}
        Swipe    500    1500    500    800    500  # Swipe ke bawah dengan durasi 500ms
    END
    Page Should Contain Element    ${locator}

Select option from dropdown
    [Documentation]    Keyword ini mengklik elemen dropdown dan memilih opsi berdasarkan teks yang diberikan.
    [Arguments]    ${dropdown_locator}    ${option_text}
    ${dropdown_locator}    Set Variable    xpath=//android.widget.TextView[@resource-id="id.edot.ework:id/txt_name" and @text="${option_text}"] 
    FOR    ${i}    IN RANGE    10
        ${dropdown_locator}=    Run Keyword And Return Status    Page Should Contain Element    ${dropdown_locator}
        Exit For Loop If    ${dropdown_locator}
        Swipe    500    1500    500    800    500  # Swipe ke bawah dengan durasi 500ms
    END
    Wait Until Page Contains Element    ${dropdown_locator}    timeout=10s
    Click Element                       ${dropdown_locator}

Select option from bottom sheet
    [Documentation]    Memilih opsi dari bottom sheet berdasarkan teks yang diberikan.
    [Arguments]    ${option_text}
    ${option_locator}=    Set Variable    xpath=//android.widget.TextView[@resource-id="id.edot.ework:id/txt_name" and @text="${option_text}"]
    FOR    ${i}    IN RANGE    10
        ${found}=    Run Keyword And Return Status    Page Should Contain Element    ${option_locator}
        Exit For Loop If    ${found}
        Swipe    500    1500    500    800    500
    END
    Wait Until Page Contains Element    ${option_locator}    timeout=10s
    Click Element    ${option_locator}

Sign On Digital Signature
    [Documentation]    Melakukan tanda tangan digital pada elemen signature view dengan tap dan swipe realistis.
    [Arguments]    ${signature_id}=id.edot.ework:id/signature_view
    Wait Until Element Is Visible    ${signature_id}    timeout=10s
    Click Element    ${signature_id}
    Sleep    0.5s
    # Swipe di area tengah signature view (koordinat contoh, sesuaikan dengan device)
    Swipe    350    1300    700    1300    300
    Swipe    700    1300    700    1500    300
    Swipe    700    1500    350    1500    300
    Swipe    350    1500    350    1300    300