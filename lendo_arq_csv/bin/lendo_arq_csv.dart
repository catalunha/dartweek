import 'dart:io';

import 'package:args/args.dart';
import 'package:lendo_arq_csv/lendo_arq_csv.dart' as lendo_arq_csv;

void main(List<String> arguments) {
  print(arguments);

  final parseArgs = ArgParser()..addOption('path_file', abbr: 'p');
  var params = parseArgs.parse(arguments);
  var paramsPathFile = params['path_file'];
  if (paramsPathFile != null) {
    lendo_arq_csv.execute('example/arquivo_csv.csv');
  } else {
    stderr.writeln('Error: path_file required');
    exit(2);
  }
}
