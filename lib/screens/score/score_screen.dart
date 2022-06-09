import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/constants.dart';
import 'package:quiz/controllers/question_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dio/dio.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    Dio dio = Dio();

    double pontuacao = _qnController.numOfCorrectAns;
    String resultado = "";
    String descricao = "";
    String nome = _qnController.nome;
    String idade = _qnController.idade;
    String estado = _qnController.estado;
    String sexo = _qnController.sexo;

    String url =
        "https://teste-alzheimer-default-rtdb.firebaseio.com/resultado.json";

    Map<String, Object> body = {
      'nome': nome,
      'idade': idade,
      'estado': estado,
      'sexo': sexo,
      'score': pontuacao
    };

    dio.post(url, data: body);

    if (pontuacao <= 1) {
      resultado = "Suas chances de estar com Alzheimer são mínimas!";
      descricao =
          "Segundo as suas respostas, parece que você está ótimo e não tem risco de ter Alzheimer nos próximos anos. \n Por isso continue se alimentando bem, fazendo exercícios e mantendo a mente ativa.";
    } else if (pontuacao <= 5) {
      resultado = "Parecem existir alguns sinais de perda de memória.";
      descricao =
          "Recomendamos que você repita este teste outro dia, com mais calma e muita atenção. Se o resultado continuar o mesmo, procure um neurologista para fazer uma avaliação mais detalhada. /n/n Ainda assim, os sinais que apresenta são mínimos e, por isso, as chances de serem Alzheimer são baixas. Provavelmente o que você precisa é descansar e tirar umas férias porque o cansaço, o stress e a ansiedade também prejudicam a memória e a atenção.";
    } else if (pontuacao <= 12) {
      resultado = "É possível que esteja apresentando sinais de Alzheimer.";
      descricao =
          "Segundo as suas respostas, parece que você está começando a sinalizar pequenas perdas da função cerebral, que podem indicar Alzheimer. \n No entanto, a única forma de confirmar essa hipótese é consultando um neurologista, que poderá fazer uma avaliação mais detalhada e pedir exames.";
    } else if (pontuacao <= 20) {
      resultado = "É possível que esteja apresentando sinais de Alzheimer.";
      descricao =
          "Segundo as suas respostas, parece que você está começando a sinalizar pequenas perdas da função cerebral, que podem indicar Alzheimer. /n/n No entanto, a única forma de confirmar essa hipótese é consultando um neurologista, que poderá fazer uma avaliação mais detalhada e pedir exames.";
    } else {
      resultado = "É muito provável que esteja desenvolvendo Alzheimer.";
      descricao =
          "Suas respostas mostram alguns sinais que podem ser indicativos do desenvolvimento de Alzheimer. Aconselhamos que marque uma consulta com um neurologista para fazer uma avaliação mais detalhada.";
    }

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          Column(
            children: [
              Text("\n\n"),
              Text(
                "Resultado do paciente $nome que mora em $estado do sexo $sexo.",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: kSecondaryColor),
              ),
              Text("\n\n"),
              Text(
                resultado,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: kWhiteColor),
              ),
              Text("\n\n"),
              Text(
                descricao,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: kSecondaryColor),
              ),
              Text("\n\n"),
              new Text(
                "O teste não equivale a um diagnóstico médico.",
                style: new TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                    fontWeight: FontWeight.normal),
              ),
              new Text(
                "O teste avalia mudanças nas habilidades cognitivas e funcionais do paciente.",
                style: new TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                    fontWeight: FontWeight.normal),
              ),
              new Text(
                "O teste é de autoria de James E Galvin e New York University Langone Medical Center",
                style: new TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
