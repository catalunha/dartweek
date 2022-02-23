import 'dart:convert';

import 'package:http/http.dart';

void main() {
  print('iniciando main');
  buscarCEP();
  print('fim main');
}

Future<void> buscarCEP() async {
  print('iniciando buscarCEP');
  Response result =
      await get(Uri.parse('https://viacep.com.br/ws/77018416/json'));
  print(result.body);
  var cep = jsonDecode(result.body);
  print(cep);
  print(cep['cep']);
  print(cep['logradouro']);
  // get(Uri.parse('https://viacep.com.br/ws/77018416/json')).then((value) {
  //   print(value);
  // }).catchError((error) {
  //   print('Erro...');
  // });
  print('fim buscarCEP');
}
