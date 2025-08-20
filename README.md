<div align="center">

# 🌦️ Estudo de Caso: Fundamentos de Flutter com API REST

**Um aplicativo de clima construído em Flutter para demonstrar os conceitos essenciais do desenvolvimento mobile, incluindo a criação de UIs declarativas, gerenciamento de estado básico e consumo de APIs externas.**

<br>

<img src="https://img.shields.io/badge/Flutter-02569B?style=plastic&logo=flutter&logoColor=white" alt="Flutter">
<img src="https://img.shields.io/badge/Dart-0175C2?style=plastic&logo=dart&logoColor=white" alt="Dart">
<img src="https://img.shields.io/badge/API-OpenWeather-blue?style=plastic" alt="OpenWeather API">
<img src="https://img.shields.io/badge/Status-Concluído-brightgreen?style=plastic" alt="Status">

<br>
<br>

</div>

---

> 💡 **Nota do Desenvolvedor:** Este projeto foi meu "Olá, Mundo!" no universo Flutter. O objetivo era claro: construir uma aplicação funcional do zero para entender na prática o famoso "tudo é um widget", aprender a gerenciar o estado de uma tela e fazer a ponte entre o aplicativo e o mundo real através de uma API. É a prova de que domino os blocos de construção fundamentais de qualquer aplicativo Flutter.

<br>

## 📜 Índice
* [✨ Funcionalidades](#-funcionalidades)
* [🏆 Vitrine Técnica: Conceitos de Flutter Aplicados](#-vitrine-técnica-conceitos-de-flutter-aplicados)
* [🚀 Como Executar Localmente](#-como-executar-localmente)

---

## ✨ Funcionalidades

| Funcionalidade | Descrição | Status |
| :--- | :--- | :---: |
| 🔍 **Busca de Cidades** | Permite ao usuário digitar o nome de qualquer cidade para buscar o clima. | ✅ |
| 🌡️ **Exibição de Dados** | Interface limpa que mostra a temperatura, o nome da cidade e um ícone representativo. | ✅ |
| 🌐 **Dados em Tempo Real** | Consome a API da OpenWeatherMap para obter informações meteorológicas precisas e atuais. | ✅ |
| 🔐 **Segurança da API Key** | Utiliza um arquivo `.env` para armazenar a chave da API, seguindo as boas práticas de segurança. | ✅ |

---

## 🏆 Vitrine Técnica: Conceitos de Flutter Aplicados

Este projeto foi uma imersão nos principais conceitos do ecossistema Flutter, demonstrados nos trechos de código abaixo.

<details>
<summary><strong>Gerenciamento de Estado com `StatefulWidget` e `setState`</strong></summary>
<br>
A reatividade da tela é controlada por um `StatefulWidget`. As variáveis que mudam (como `_nomeCidade` e `_temperatura`) são declaradas na classe de Estado. A chamada ao método `setState()` após receber os dados da API notifica o Flutter para reconstruir a UI e exibir as novas informações.

```dart
// Em: lib/main.dart
class _MeuAppClimaState extends State<MeuAppClima> {
  String _nomeCidade = 'Buscando...';
  int _temperatura = 0;
  // ...

  void _buscarClima() async {
    // ... lógica da API
    if (resposta.statusCode == 200) {
      var dados = jsonDecode(resposta.body);
      
      // setState() é o coração da reatividade!
      setState(() {
        _nomeCidade = dados['name'];
        _temperatura = dados['main']['temp'].round();
      });
    }
  }
  // ...
}
```
</details>

<details>
<summary><strong>Consumo de API com `http` e `async/await`</strong></summary>
<br>
A função `_buscarClima` é assíncrona (`async`). Ela utiliza o pacote `http` para fazer uma requisição `GET` à API. A palavra-chave `await` garante que o aplicativo não congele a interface enquanto espera a resposta da rede, proporcionando uma experiência de usuário fluida.

```dart
// Em: lib/main.dart
void _buscarClima() async {
  if (_controllerCidade.text.isNotEmpty) {
    String apiKey = dotenv.env['OPENWEATHER_API_KEY']!;
    String cidade = _controllerCidade.text;
    
    var url = Uri.parse(
      '[https://api.openweathermap.org/data/2.5/weather?q=$cidade&appid=$apiKey&units=metric&lang=pt_br](https://api.openweathermap.org/data/2.5/weather?q=$cidade&appid=$apiKey&units=metric&lang=pt_br)',
    );

    try {
      // 'await' pausa a execução desta função até a resposta da rede chegar
      var resposta = await http.get(url);
      
      if (resposta.statusCode == 200) {
        // ... processa os dados
      }
    } catch (e) {
      print('Ocorreu um erro: $e');
    }
  }
}
```
</details>

---

## 🚀 Como Executar Localmente

### Pré-requisitos
* [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado.
* Uma chave de API gratuita do [OpenWeatherMap](https://openweathermap.org/api).

### Passos
1.  **Clone o repositório:**
    ```bash
    git clone [https://github.com/SEU_USUARIO/SEU_REPOSITORIO.git](https://github.com/SEU_USUARIO/SEU_REPOSITORIO.git)
    cd SEU_REPOSITORIO
    ```

2.  **Crie o arquivo de ambiente:**
    * Na raiz do projeto, crie um arquivo chamado `.env`.
    * Dentro deste arquivo, adicione a sua chave da API da seguinte forma:
      ```
      OPENWEATHER_API_KEY=SUA_CHAVE_DE_API_VEM_AQUI
      ```

3.  **Instale as dependências:**
    ```bash
    flutter pub get
    ```

4.  **Execute o aplicativo:**
    ```bash
    flutter run
    ```
    * Selecione um emulador ou um dispositivo conectado para rodar o app.
