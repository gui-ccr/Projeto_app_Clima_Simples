import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Para usar o pacote http
import 'dart:convert'; // Para decodificar a resposta JSON
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async{
   // Carrega as variaveis do arquivo .env para a memoria
  await dotenv.load(fileName: ".env");
  runApp(const MeuAppClima());
}

// --- CLASSE 1: O WIDGET (Parte Imutavel) ---
// Agora ele herda de StatefulWidget
class MeuAppClima extends StatefulWidget {
  const MeuAppClima({super.key});

  // Em vez de um metodo 'build', agora o trabalho dele e' criar o seu objeto de Estado.
  @override
  State<MeuAppClima> createState() => _MeuAppClimaState();
}

// --- CLASSE 2: O ESTADO (Parte Mutavel e que Desenha) ---
// O '_' no inicio do nome a torna privada a este arquivo.
class _MeuAppClimaState extends State<MeuAppClima> {
  // No futuro, as variaveis que mudam (como a temperatura) virao aqui.
  // Por enquanto, ela nao precisa ter nada.
  String _nomeCidade = 'Teofilo Otoni';
  int _temperatura = 28;
  IconData _iconeClima = Icons.wb_sunny;
  final _controllerCidade = TextEditingController();

  // Dentro da sua classe _MeuAppClimaState

  // A funcao agora e' marcada como 'async'
  void _buscarClima() async {
    if (_controllerCidade.text.isNotEmpty) {
      // --- ATENCAO: COLOQUE SUA CHAVE DE API AQUI ---
      String apiKey = dotenv.env['OPENWEATHER_API_KEY']!;
      String cidade = _controllerCidade.text;

      // 1. Montamos a URL completa para a API
      var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$cidade&appid=$apiKey&units=metric&lang=pt_br',
      );

      try {
        // 2. Fazemos a chamada de rede e usamos 'await' para esperar a resposta
        var resposta = await http.get(url);

        // 3. Verificamos se a chamada foi bem-sucedida (codigo 200 significa OK)
        if (resposta.statusCode == 200) {
          // 4. Decodificamos a resposta em texto (JSON) para um formato que o Dart entende (Map)
          var dados = jsonDecode(resposta.body);

          // 5. Usamos setState para atualizar nossas variaveis de estado com os dados REAIS
          setState(() {
            _nomeCidade = dados['name'];
            // A temperatura vem como double, entao arredondamos para int
            _temperatura = dados['main']['temp'].round();
            // (Mais tarde podemos adicionar a logica para mudar o icone com base no clima)
          });
        } else {
          // Se deu erro (cidade nao encontrada, etc.), avisamos no console
          print('Falha ao carregar o clima. Codigo: ${resposta.statusCode}');
        }
      } catch (e) {
        // Se deu erro de conexao com a internet, etc.
        print('Ocorreu um erro: $e');
      }
    }
  }

  // O METODO BUILD FOI MOVIDO PARA CA!
  // E' a classe de Estado que e' responsavel por construir a aparencia do widget.
  @override
  Widget build(BuildContext context) {
    // O codigo que voce ja tinha escrito vem aqui dentro, exatamente igual.
    return MaterialApp(
      title: 'Clima',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[600],
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(_iconeClima, color: Colors.white, size: 100.0),
              Text(
                '$_temperatura°C',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                _nomeCidade,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  letterSpacing: 2.0,
                ),
              ),
              // Um espacamento para nao ficar tudo grudado
              SizedBox(height: 20.0),
              // Campo de texto para o usuario digitar a cidade
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: TextField(
                  controller: _controllerCidade,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                  decoration: InputDecoration(
                    hintText: 'Digite o nome da cidade...',
                    hintStyle: TextStyle(color: Colors.white70),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: _buscarClima,
                child: Text('Buscar Clima'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
