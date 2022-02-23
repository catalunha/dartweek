import 'package:prototype/cliente_prototype.dart';
import 'package:prototype/telefone.dart';

class Cliente implements Prototype<Cliente> {
  String? nome;
  DateTime? dataNascimento;
  String? _cpf;
  List<Telefone> telefoneList = [];

  Cliente._();
  factory Cliente() {
    var c = Cliente._();
    c.nome = 'm';
    c.dataNascimento = DateTime.now();
    c._cpf = '123';
    c.telefoneList = [Telefone(numero: '1'), Telefone(numero: '2')];
    return c;
  }

  @override
  clone() {
    var c = Cliente();
    c.nome = nome;
    c.dataNascimento = dataNascimento;
    c._cpf = _cpf;
    c.telefoneList = [...telefoneList];
    return c;
  }

  @override
  String toString() {
    return 'Cliente(nome: $nome, dataNascimento: $dataNascimento, _cpf: $_cpf, telefoneList: $telefoneList)';
  }
}
