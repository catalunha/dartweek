import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';

void execute(path_file) async {
  var arquivo1 = File(path_file).readAsBytesSync();
  print(arquivo1);
  var arquivo = File(path_file).openRead();
  var csv = await arquivo
      .transform(utf8.decoder)
      .transform(
        CsvToListConverter(fieldDelimiter: ';', eol: '\n'),
      )
      .toList();
  for (var linha in csv) {
    print(linha);
    print('nome ${linha[0]}, numero ${linha[1]}');
  }
  print('fim execute:');
}
