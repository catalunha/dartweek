import 'package:builder_pattern/model/filho.dart';
import 'package:builder_pattern/model/funcionario.dart';

abstract class FuncionarioNome {
  FuncionarioIdade nome(String nome);
}

abstract class FuncionarioIdade {
  FuncionarioProfissao idade(int idade);
}

abstract class FuncionarioProfissao {
  FuncionarioFilhoList profissao(String profissao);
}

abstract class FuncionarioFilhoList {
  FuncionarioFilhoList addFilho(Filho filho);
  Funcionario build();
}

class FuncionarioBuilderCompleto
    implements
        FuncionarioNome,
        FuncionarioIdade,
        FuncionarioProfissao,
        FuncionarioFilhoList {
  Funcionario _funcionario = Funcionario();

  FuncionarioBuilderCompleto._();
  static FuncionarioNome get instance => FuncionarioBuilderCompleto._();

  @override
  FuncionarioIdade nome(String nome) {
    _funcionario.nome = nome;
    return this;
  }

  @override
  FuncionarioProfissao idade(int idade) {
    _funcionario.idade = idade;
    return this;
  }

  @override
  FuncionarioFilhoList profissao(String profissao) {
    _funcionario.profissao = profissao;
    return this;
  }

  @override
  FuncionarioFilhoList addFilho(Filho filho) {
    _funcionario.filhoList ??= [];
    _funcionario.filhoList!.add(filho);
    return this;
  }

  @override
  Funcionario build() {
    return _funcionario;
  }
}
