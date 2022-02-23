import 'package:builder_pattern/builders/funcionario_builder.dart';
import 'package:builder_pattern/builders/funcionario_builder_completo.dart';
import 'package:builder_pattern/dio/custom_dio_builder.dart';
import 'package:builder_pattern/model/filho.dart';

void execute() async {
  var resultPost = await CustomDioBuilder.instance
      .post()
      .path('https://jsonplaceholder.typicode.com/posts')
      .addHeaders('Content-type', 'application/json')
      .params()
      .data({"title": "titlex", "body": "bodyx", "userId": 1}).run();
  print(resultPost.data);
  var resultGet = await CustomDioBuilder.instance
      .get()
      .path('https://jsonplaceholder.typicode.com/posts')
      // .addHeaders('Content-type', 'application/json')
      .params()
      .queryParameters()
      .addQueryParameters('userId', 1)
      // .data({"title": "titlex", "body": "bodyx", "userId": 1})
      .run();
  print(resultGet.data);
  // var funcionario1 = FuncionarioBuilder.instance
  //     .nome('f10')
  //     .idade(10)
  //     .profissao('FullStack Flutter')
  //     .addFilho(Filho(nome: 'f1', idade: 1))
  //     .addFilho(Filho(nome: 'f2', idade: 2))
  //     .build();
  // print(funcionario1);

  // var funcionario2 = FuncionarioBuilderCompleto.instance
  //     .nome('f20')
  //     .idade(20)
  //     .profissao('dev')
  //     .addFilho(Filho(nome: 'f3', idade: 3))
  //     .build();
}
