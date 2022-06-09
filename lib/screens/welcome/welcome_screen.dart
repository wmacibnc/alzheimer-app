import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz/constants.dart';
import 'package:quiz/screens/quiz/quiz_screen.dart';
import 'package:quiz/controllers/question_controller.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String estado = 'DF';
  String sexo = 'MASCULINO';
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    _controller.checkEstado(estado);
    _controller.checkSexo(sexo);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 2), //2/6
                  Text(
                    "Teste de Alzheimer",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  new Text(
                    "Um teste de apenas dez perguntas que pode detectar, em cerca de cinco minutos, os primeiros sinais do Mal de Alzheimer.",
                    style: new TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),

                  Spacer(), // 1/6

                  TextField(
                    onChanged: (valorCampo) {
                      _controller.checkNome(valorCampo);
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF1C2341),
                      hintText: "Nome do paciente",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                  Spacer(),
                  new Text(
                    "Qual é o seu estado?",
                    style: new TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  DropdownButton<String>(
                    value: estado,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    underline: Container(
                      height: 2,
                      color: Colors.pink,
                    ),
                    onChanged: (String newValue) {
                      //estado = newValue;
                      setState(() {
                        estado = newValue;
                        _controller.checkEstado(estado);
                      });
                    },
                    items: <String>[
                      'AC',
                      'AL',
                      'AP',
                      'AM',
                      'BA',
                      'CE',
                      'DF',
                      'ES',
                      'GO',
                      'MA',
                      'MT',
                      'MS',
                      'MG',
                      'PA',
                      'PB',
                      'PR',
                      'PE',
                      'PI',
                      'RJ',
                      'RN',
                      'RS',
                      'RO',
                      'RR',
                      'SC',
                      'SP',
                      'SE',
                      'TO'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),

                  Spacer(),
                  new Text(
                    "Qual é o seu sexo?",
                    style: new TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  DropdownButton<String>(
                    value: sexo,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    underline: Container(
                      height: 2,
                      color: Colors.pink,
                    ),
                    onChanged: (String newValue) {
                      //sexo = newValue;
                      setState(() {
                        sexo = newValue;
                      });
                    },
                    items: <String>['MASCULINO', 'FEMININO', 'INDEFINIDO']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),

                  Spacer(),

                  // 1/6
                  TextField(
                    onChanged: (valorCampo) {
                      _controller.checkIdade(valorCampo);
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF1C2341),
                      hintText: "Idade do paciente",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                  Spacer(), // 1/6
                  InkWell(
                    onTap: () => Get.to(QuizScreen()),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Iniciar Teste",
                        style: Theme.of(context)
                            .textTheme
                            .button
                            .copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  Spacer(flex: 2), // it will take 2/6 spaces
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
