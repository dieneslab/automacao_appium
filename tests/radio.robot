*** Settings ***
Resource          ../resources/yoadapp.resource

*** Test Cases ***
Validar a tela principal e selecionar a opção Javascript
    [Documentation]    Verifica se a tela home do aplicativo está sendo exibida 
    ...                corretamente e marca radio.
    [Tags]    radio
    Start session
    Get started with Yodapp
    Navigate to     Check e Radio
    Go to item      Botões de radio        Escolha sua linguagem preferida

    Click Element    xpath=//android.widget.RadioButton[contains(@text,"Javascript")]

    Close session
