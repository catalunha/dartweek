import 'package:builder_pattern/model/filho.dart';
import 'package:builder_pattern/model/funcionario.dart';

class FuncionarioBuilder {
  final Funcionario _funcionario = Funcionario();
  FuncionarioBuilder._();
  static FuncionarioBuilder get instance => FuncionarioBuilder._();
  FuncionarioBuilder nome(String nome) {
    _funcionario.nome = nome;
    return this;
  }

  FuncionarioBuilder idade(int idade) {
    _funcionario.idade = idade;
    return this;
  }

  FuncionarioBuilder profissao(String profissao) {
    _funcionario.profissao = profissao;
    return this;
  }

  FuncionarioBuilder addFilho(Filho filho) {
    _funcionario.filhoList ??= [];
    _funcionario.filhoList!.add(filho);
    return this;
  }

  Funcionario build() {
    return _funcionario;
  }
}
