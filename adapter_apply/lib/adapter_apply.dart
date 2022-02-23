import 'dart:convert';

import 'package:adapter_apply/endereco_model.dart';
import 'package:adapter_apply/xml_2json_adapter.dart';
import 'package:adapter_apply/xml_2json_transformer.dart';
import 'package:dio/dio.dart';
import 'package:xml2json/xml2json.dart';

void execute() async {
  var enderecoModel = await Dio()
      .get('https://viacep.com.br/ws/01001000/json/')
      .then((response) => EnderecoModel.fromJson(response.data));
  print(enderecoModel);
  print('--------------');
  var enderecoModel2 = await Dio()
      .get('https://viacep.com.br/ws/01001000/xml/')
      .then((response) {
        var xml2Json = Xml2Json();
        xml2Json.parse(response.data);
        return xml2Json.toParker();
      })
      .then((value) => json.decode(value))
      .then((value) => EnderecoModel.fromJson(value['xmlcep']));
  print(enderecoModel2);
  print('--------------');
  var enderecoModel3 = await Dio()
      .get('https://viacep.com.br/ws/01001000/xml/')
      .then((response) => Xml2JsonAdapter.adapter(response.data))
      .then((value) => EnderecoModel.fromJson(value['xmlcep']));
  print(enderecoModel3);
  print('--------------');
  var dio = Dio();
  dio.transformer = Xml2JsonTransformer();
  var enderecoModel4 = await dio
      .get('https://viacep.com.br/ws/01001000/xml/')
      // .then((response) => Xml2JsonAdapter.adapter(response.data))
      .then((value) => EnderecoModel.fromJson(value.data['xmlcep']));
  print(enderecoModel4);
}
