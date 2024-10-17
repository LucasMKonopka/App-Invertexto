import 'dart:convert';

import 'package:http/http.dart' as http;

final String _token = "15487|51CfX1dpbgfc8WbWJIvUH9VgM5wiYcgr";

Future<Map> converteNumeroPorExtenso(String? _valor) async{
  http.Response response;
  response = await http.get(Uri.parse("https://api.invertexto.com/v1/number-to-words?token=$_token&number=$_valor&language=pt&currency=BRL"));
  return json.decode(response.body);
}

Future<Map> buscaCEP(String? _cep) async{
  http.Response response;
  response = await http.get(Uri.parse("https://api.invertexto.com/v1/cep/$_cep?token=$_token"));
  return json.decode(response.body);
}

Future<Map<String, dynamic>> conversorDeMoedas(String? moeda) async {
  
  final url = "https://api.invertexto.com/v1/currency/$moeda?token=$_token";
  final response = await http.get(Uri.parse(url));

  return json.decode(response.body);

}