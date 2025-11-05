*** Settings ***
Library    AppiumLibrary

*** Keywords ***    
Start session
    Open Application       http://localhost:4723    
    ...                    platformName=Android    
    ...                    deviceName=emulator-5554
    ...                    automationName=UiAutomator2
    ...                    app=${EXECDIR}/apps/yodapp-beta.apk
    ...                    udid=emulator-5554
    ...                    autoGrantPermissions=true
    ...                    appWaitActivity=*  

Get started with Yodapp
    Wait Until Page Contains    Yodapp
    Wait Until Page Contains    Mobile Training
    Wait Until Page Contains    by Papito
    Click Text    QAX

Navigate to
    [Arguments]    ${item_text}
    ${hamburger}              Set Variable    xpath=//android.widget.ImageButton[@content-desc="Open navigation drawer"]
    Wait Until Element Is Visible    ${hamburger}              5s
    click element                    ${hamburger}

    ${menu_item}              Set Variable    xpath=//android.widget.TextView[@resource-id="com.qaxperience.yodapp:id/tvItemTitle" and @text="${item_text}"]
    Wait Until Element Is Visible    ${menu_item}              5s
    click element                    ${menu_item}

Go to item
    [Arguments]    ${item_text}    ${check_text}
    ${menu_clique_simples}    Set Variable    xpath=//android.widget.TextView[@resource-id="com.qaxperience.yodapp:id/tvItemTitle" and @text="${item_text}"]
    Wait Until Element Is Visible    ${menu_clique_simples}    5s
    click element                    ${menu_clique_simples}
    Wait Until Page Contains         ${check_text}
    
Close session
    Close Application