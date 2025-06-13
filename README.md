# 🌦️ Clima App - Um Aplicativo de Clima em Flutter

![Dart](https://img.shields.io/badge/Language-Dart-blue?logo=dart)
![Flutter](https://img.shields.io/badge/Framework-Flutter-02569B?logo=flutter)
![License](https://img.shields.io/badge/License-MIT-green)

Este projeto é uma aplicação de clima desenvolvida em Flutter como parte de um estudo prático sobre os fundamentos do desenvolvimento de aplicativos móveis. O app permite ao usuário buscar as condições meteorológicas atuais para qualquer cidade do mundo, conectando-se a uma API de dados em tempo real.

---
## ✨ Funcionalidades

* ✅ **Interface Reativa:** UI limpa e simples que exibe a temperatura, o nome da cidade e um ícone representativo do clima.
* ✅ **Busca de Cidades:** Campo de texto para o usuário digitar o nome de uma cidade e atualizar os dados na tela.
* ✅ **Dados em Tempo Real:** Integração com a API da **OpenWeatherMap** para buscar informações meteorológicas atuais e precisas.
* ✅ **Programação Assíncrona:** O app lida com chamadas de rede sem travar a interface do usuário, proporcionando uma experiência fluida.

---
## 🧠 Conceitos Aplicados

Este projeto foi uma oportunidade para aplicar na prática os conceitos essenciais do ecossistema Flutter/Dart.

* ### **Estrutura de Widgets (Tudo é um Widget)**
    * O projeto foi construído seguindo o princípio fundamental do Flutter, com uma árvore de widgets aninhados para criar a UI de forma declarativa e intuitiva.

* ### **Gerenciamento de Estado Básico (`StatefulWidget`)**
    * A tela principal é um `StatefulWidget`, permitindo que a interface se reconstrua e exiba novos dados.
    * O método `setState()` é o coração da interatividade, sendo chamado para notificar o framework sobre as mudanças nas variáveis de estado (temperatura, nome da cidade) e acionar a atualização da UI.

* ### **Layouts em Flutter**
    * Uso de `Column` para organizar os elementos principais verticalmente na tela.
    * Utilização de `Center`, `SafeArea` e `Padding` para garantir o alinhamento e espaçamento corretos, resultando em uma UI limpa e adaptável.
    * Widgets visuais como `Icon`, `Text` (com `TextStyle` para customização) e `ElevatedButton` foram usados para compor a interface.

* ### **Interação com o Usuário (`TextField`)**
    * Implementação de um `TextField` para captura de texto do usuário.
    * Uso de um `TextEditingController` para ler e gerenciar o valor digitado no campo de texto.

* ### **Consumo de API e Programação Assíncrona**
    * **Pacote `http`:** Adição da dependência no `pubspec.yaml` para realizar chamadas de rede (HTTP GET).
    * **`async / await`:** A função de busca de clima foi implementada como assíncrona para esperar a resposta da internet sem bloquear a thread principal da UI, garantindo que o aplicativo continue responsivo.
    * **Manipulação de JSON:** A resposta em texto da API (formato JSON) é decodificada (`jsonDecode`) para um formato `Map` que o Dart pode manipular facilmente para extrair os dados necessários.

---
## 🚀 Como Executar

### Pré-requisitos
* Ter o [SDK do Flutter](https://flutter.dev/docs/get-started/install) instalado.
* Um editor de código como VS Code ou Android Studio.
* Uma chave de API gratuita do [OpenWeatherMap](https://openweathermap.org/api).

### Passos
1.  **Clone o repositório:**
    ```bash
    git clone [https://github.com/SEU_USUARIO/SEU_REPOSITORIO.git](https://github.com/SEU_USUARIO/SEU_REPOSITORIO.git)
    cd SEU_REPOSITORIO
    ```

2.  **Crie um arquivo para sua chave de API:**
    * Dentro do seu projeto, localize o arquivo `lib/pagina_contador.dart` (ou o nome que você deu para sua tela de clima).
    * Encontre a linha `String apiKey = 'SUA_CHAVE_DE_API_VEM_AQUI';`
    * Substitua `'SUA_CHAVE_DE_API_VEM_AQUI'` pela sua chave real da OpenWeatherMap.

3.  **Instale as dependências:**
    ```bash
    flutter pub get
    ```

4.  **Execute o aplicativo:**
    ```bash
    flutter run
    ```
    Selecione um emulador ou um dispositivo conectado para rodar o app.