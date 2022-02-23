import 'filho.dart';

class Funcionario {
  String? nome;
  int? idade;
  String? profissao;
  List<Filho>? filhoList;
  Funcionario({
    this.nome,
    this.idade,
    this.profissao,
    this.filhoList,
  });

  @override
  String toString() {
    return 'Funcionario(nome: $nome, idade: $idade, profissao: $profissao, filhoList: $filhoList)';
  }
}
