*** Settings ***
Library           AppiumLibrary
Library    OperatingSystem

*** Test Cases ***
Validar a tela principal
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

    Capture Page Screenshot
    Close Application