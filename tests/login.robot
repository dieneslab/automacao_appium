*** Settings ***
Resource          ../resources/yoadapp.resource

*** Test Cases ***
Validar login com sucesso
    [Documentation]    Verifica se o login no aplicativo é realizado com sucesso.
    [Tags]    login
    Start session
    Get started with Yodapp
    Navigate to     Formulários
    Go to item      Login        Olá Padawan, vamos testar o login?

    Input Text        id=com.qaxperience.yodapp:id/etEmail           yoda@qax.com
    Input Text        id=com.qaxperience.yodapp:id/etPassword        jedi
    Click Element     id=com.qaxperience.yodapp:id/btnSubmit

    Wait Until Page Contains    Boas vindas, logado você está.

    Close session

Validar tentativa de login com senha incorreta
    [Documentation]    Verifica se o login no aplicativo valida usuário/senha incorreta.
    [Tags]    login
    Start session
    Get started with Yodapp
    Navigate to     Formulários
    Go to item      Login        Olá Padawan, vamos testar o login?

    Input Text        id=com.qaxperience.yodapp:id/etEmail           yoda@qax.com
    Input Text        id=com.qaxperience.yodapp:id/etPassword        luke
    Click Element     id=com.qaxperience.yodapp:id/btnSubmit

    Wait Until Page Contains   Oops! Credenciais incorretas.

    Close session
