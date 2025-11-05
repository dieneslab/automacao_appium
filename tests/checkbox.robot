*** Settings ***
Resource          ../resources/yoadapp.resource

*** Test Cases ***
Validar a tela principal e marcar as techs que usam appium
    [Documentation]    Verifica se a tela home do aplicativo está sendo exibida 
    ...                corretamente e marca alguns checkbox.
    [Tags]    checkbox
    Start session
    Get started with Yodapp
    Navigate to     Check e Radio
    Go to item      Checkbox        Marque as techs que usam Appium

    @{techs}    Create List    Ruby    Java    Python    Javascript    C#    Robot Framework

    FOR    ${tech}    IN    @{techs}
        Click Element    xpath=//android.widget.CheckBox[contains(@text,"${tech}")]
    END

    Close session
