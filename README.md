# automacao_appium

- Requirements
1. VSCode
2. Node.js
3. Windows Terminal
4. Git for Windows + Bash
5. Instalar JDK 
6. Android Studio (developer.android.com)
    - More Actions > Virtual Device Manager > Play
7. Instalar appium e appium-doctor
    npm i appium
    npm i appium-doctor
8. Fazer diagnóstico para android
    npx appium-doctor --android
9. Criar variáveis de ambiente ANDROID_HOME e JAVA_HOME
    C:\Users\your.user\AppData\Local\Android\Sdk
    C:\Program Files\Java\jdk-XX
    Importante: adicionnar o %JAVA_HOME%\bin %ANDROID_HOME%\plataform_tools e no Path das variáveis
10. Download e instalação do appium-inspector
    github.com/appium/appium-inspector/releases 
11. No app do appium-inspector precisa configurar o seguinte:
    {
        "appium:plataformName": "Android",
        "appium:deviceName": "Android Emulator",
        "appium:automationName": "UIAutomator2",
        "appium:app": "C:\\your.paths\\apps\\qax-alpha.apk"
    }       
12. No projeto dar o comando
    adb devices
        Deve aparecer o emulator no ar
13. Deve instalar o driver
    npx appium diver install uiautomator2
14. Verificar se foi instalado
    npx appium driver list --installed    
15. Rodar o appium
    npx appium
16. Com o appium-inspector iniciar a sessão e validar se temos o aplicativo para inspeção.
17. Instalar o python (python.org)
    python --version (verificar versão)
18. Instalar Robot Framework e Library do Appium
    pip install robotframework
    pip install robotframework-appiumLibrary
    robot --version (verificar versão)


Documentação do Appium
appium.io