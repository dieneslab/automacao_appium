*** Settings ***
Library           AppiumLibrary

*** Test Cases ***
Validar a tela principal e navegabilidade
    [Documentation]    Verifica se a tela home do aplicativo está sendo exibida corretamente.
    
    Open Application       http://localhost:4723    
    ...                    platformName=Android    
    ...                    deviceName=emulator-5554
    ...                    automationName=UiAutomator2
    ...                    app=${EXECDIR}/apps/yodapp-beta.apk
    ...                    udid=emulator-5554
    ...                    autoGrantPermissions=true
    ...                    appWaitActivity=*    

    Wait Until Page Contains    Yodapp
    Wait Until Page Contains    Mobile Training
    Wait Until Page Contains    by Papito

    Click Text    QAX

    ${hamburger}    Set Variable    xpath=//android.widget.ImageButton[@content-desc="Open navigation drawer"]

    Wait Until Element Is Visible    ${hamburger}    10s
    click element                    ${hamburger}

    ${menu_item}    Set Variable    xpath=//android.widget.TextView[@resource-id="com.qaxperience.yodapp:id/tvItemTitle" and @text="Clique em Botões"]
    
    Wait Until Element Is Visible    ${menu_item}    10s
    click element                    ${menu_item}

    Sleep    5s

    Close Application