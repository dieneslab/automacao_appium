*** Settings ***
Resource          ../resources/yoadapp.resource

*** Test Cases ***
Validar a tela principal e clicar no botão Clique simples
    [Documentation]    Verifica se a tela home do aplicativo está sendo exibida 
    ...                corretamente e clica no botão simples.
    [Tags]    short_click
    Start session
    Get started with Yodapp
    Navigate to     Clique em Botões
    Go to item      Clique simples        Botão clique simples
    
    Click Text                       CLIQUE SIMPLES
    Wait Until Page Contains         Isso é um clique simples
    
    Close session

Validar a tela principal e clicar no botão Clique longo
    [Documentation]    Verifica se a tela home do aplicativo está sendo exibida 
    ...                corretamente e clica no botão longo.
    [Tags]    long_click
    Start session
    Get started with Yodapp
    Navigate to     Clique em Botões
    Go to item      Clique longo        Botão clique longo
    
    ${locator}       Set Variable            id=com.qaxperience.yodapp:id/long_click
    ${positions}     Get Element Location    ${locator}
    Tap With Positions    1000               ${${positions}[x], ${positions}[y]}        1000
    Wait Until Page Contains                 Isso é um clique longo
    
    Close session