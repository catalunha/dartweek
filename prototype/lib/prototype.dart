import 'package:prototype/cliente.dart';

void execute() {
  var c1 = Cliente();
  var c2 = Cliente();

  c2 = c1.clone();

  print(c1.hashCode);
  print(c1);
  print(c2.hashCode);
  print(c2);
  print('remove telefone:0');
  c2.telefoneList.removeAt(0);
  print(c1.hashCode);
  print(c1);
  print(c2.hashCode);
  print(c2);
}
