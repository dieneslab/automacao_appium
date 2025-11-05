# 📱 Automação Mobile com Appium e Robot Framework

Bem-vindo ao projeto de automação de testes mobile que utiliza o **Appium** como motor de automação e o **Robot Framework** para a escrita e execução dos testes. Este guia detalhado visa facilitar a configuração do ambiente e a execução dos testes em um emulador Android local. 🚀

---

## 📌 Sobre o Projeto

Este projeto demonstra uma implementação robusta para a automação de testes em aplicativos Android (e potencialmente iOS, com ajustes), utilizando a sintaxe de fácil leitura do **Robot Framework** e a capacidade de interação com elementos mobile do **Appium**. O foco é fornecer um ambiente de testes estável e replicável.

---

## 🛠️ Tecnologias Utilizadas

- [Robot Framework](https://robotframework.org/) — Framework de automação de testes.
- [Appium](http://appium.io/) — Servidor de automação para aplicativos nativos, híbridos e móveis da web.
- [AppiumLibrary](https://serhatbolsu.github.io/robotframework-appiumlibrary/AppiumLibrary.html) — Biblioteca do Robot Framework para interagir com o Appium.
- [Python](https://www.python.org/) — Linguagem de programação para o ecossistema Robot Framework.
- [Node.js](https://nodejs.org/) — Ambiente de execução para o Appium Server e suas ferramentas.
- [Java Development Kit (JDK)](https://www.oracle.com/java/technologies/javase-downloads.html) — Necessário para o desenvolvimento Android e ferramentas relacionadas.
- [Android SDK & Android Studio](https://developer.android.com/studio) — Ferramentas essenciais para emulação e desenvolvimento Android.

---

## ⚙️ Pré-requisitos e Configuração do Ambiente

Para replicar o ambiente de testes, siga os passos abaixo em ordem.

### 1. Instalação de Ferramentas Essenciais

| Ferramenta | Ação | Verificação |
|:---|:---|:---|
| **VSCode** | Instalação do editor de código. | N/A |
| **Git for Windows** | Instalação do Git (inclui Git Bash). | `git --version` |
| **Node.js** | Instalação do ambiente de execução (versão LTS recomendada). | `node -v` e `npm -v` |
| **Python** | Instalação do Python (adicionar ao PATH durante a instalação). | `python --version` |
| **JDK (Java)** | Instalação do Java Development Kit. | `java -version` |

### 2. Configuração do Ambiente Android

1.  **Instalar Android Studio:** Baixe e instale o Android Studio.
2.  **Configurar um Emulador:**
    - Abra o Android Studio.
    - Vá em `More Actions` > `Virtual Device Manager`.
    - Crie um novo dispositivo virtual (AVD) e inicie-o (`Play`). O emulador deve estar em execução antes de iniciar o Appium.

### 3. Configuração de Variáveis de Ambiente

É **crucial** configurar as seguintes variáveis de ambiente para que o Appium e o Android SDK funcionem corretamente:

| Variável | Valor de Exemplo | Adicionar ao `Path` |
|:---|:---|:---|
| `ANDROID_HOME` | `C:\Users\seu.usuario\AppData\Local\Android\Sdk` | `%ANDROID_HOME%\platform-tools` |
| `JAVA_HOME` | `C:\Program Files\Java\jdk-XX` | `%JAVA_HOME%\bin` |

**Observação:** Certifique-se de que `%ANDROID_HOME%\platform-tools` e `%JAVA_HOME%\bin` estejam adicionados à variável de sistema `Path`.

### 4. Instalação do Appium e Dependências

Utilize o `npm` para instalar o Appium Server e o `appium-doctor` globalmente.

```bash
# Instala o Appium Server
npm install -g appium

# Instala o Appium Doctor (para diagnóstico)
npm install -g appium-doctor
```

### 5. Diagnóstico do Ambiente

Execute o diagnóstico para verificar se todas as dependências do Android estão configuradas corretamente:

```bash
npx appium-doctor --android
```

**Resultado Esperado:** Todas as verificações devem retornar `[OK]`.

### 6. Instalação do Driver UIAutomator2

O Appium utiliza drivers para interagir com as plataformas. Para Android, o driver padrão é o `uiautomator2`.

```bash
npx appium driver install uiautomator2
```

**Verificação:**

```bash
npx appium driver list --installed
```

### 7. Instalação do Robot Framework e AppiumLibrary

Utilize o `pip` para instalar as bibliotecas Python necessárias:

```bash
# Instala o Robot Framework
pip install robotframework

# Instala a biblioteca do Appium para Robot Framework
pip install robotframework-appiumLibrary
```

**Verificação:**

```bash
robot --version
```

---

## 🚀 Execução Local

### 1. Verificar Dispositivo Conectado

Com o emulador Android em execução, verifique se ele está visível para o ADB (Android Debug Bridge):

```bash
adb devices
```

**Resultado Esperado:** O emulador deve aparecer na lista com o status `device`.

### 2. Iniciar o Appium Server

O Appium Server deve estar rodando em uma janela de terminal separada antes de executar os testes ou o Inspector.

```bash
npx appium
```

### 3. Configuração do Appium Inspector

O [Appium Inspector](https://github.com/appium/appium-inspector/releases) é essencial para inspecionar elementos. Baixe e instale a versão mais recente.

Na tela de configuração do Inspector, utilize as seguintes **Desired Capabilities** (ajuste o caminho do `.apk`):

```json
{
    "platformName": "Android",
    "deviceName": "Android Emulator",
    "automationName": "UIAutomator2",
    "app": "C:\\your.paths\\apps\\qax-alpha.apk"
}
```

Após configurar, clique em `Start Session` para validar se o aplicativo está sendo carregado no emulador e se a inspeção de elementos está funcionando.

### 4. Executar os Testes Robot Framework

Com o Appium Server rodando e o emulador pronto, execute seus arquivos de teste (`.robot`) a partir do diretório do projeto:

```bash
robot --outputdir .\results\ .\tests\
```

---

## 📂 Estrutura do Projeto (Exemplo)

```sh
📦 automacao_appium_rf
├── 📂 apps                 # Arquivos .apk ou .ipa para teste
│   └── 📜 qax-alpha.apk
├── 📂 tests                # Arquivos de teste do Robot Framework
│   └── 📜 login.robot
├── 📂 resources            # Arquivos de recursos e keywords reutilizáveis
│   └── 📜 common_keywords.robot
├── 📂 results
│   ├── 📜 output.xml       # Arquivo de resultados do Robot Framework
│   ├── 📜 log.html         # Log detalhado da execução
│   └── 📜 report.html      # Relatório de execução
└── 📜 README.md            # Documentação do projeto
```

---

## 📚 Documentação e Referências

- **Documentação Oficial do Appium:** [appium.io](http://appium.io/)
- **Documentação da AppiumLibrary:** [serhatbolsu.github.io/robotframework-appiumlibrary/AppiumLibrary.html](https://serhatbolsu.github.io/robotframework-appiumlibrary/AppiumLibrary.html)
- **Guia de Instalação do Android Studio:** [developer.android.com/studio/install](https://developer.android.com/studio/install)

---

## 🤝 Contribuindo

Sinta-se à vontade para abrir issues, sugerir melhorias ou enviar PRs.  
Toda contribuição é bem-vinda! 💡

---

## 📜 Licença

Este projeto está sob a licença MIT. Consulte o arquivo [LICENSE](LICENSE) para mais detalhes.

---

Desenvolvido com 💻 por [**Dienes Stein**](https://github.com/dieneslab) ✨
