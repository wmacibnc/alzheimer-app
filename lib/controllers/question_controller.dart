import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:quiz/models/Questions.dart';
import 'package:quiz/screens/score/score_screen.dart';

// We use get package for our state management

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  // Lets animated our progress bar

  AnimationController _animationController;
  Animation _animation;
  // so that we can access our animation outside
  Animation get animation => this._animation;

  PageController _pageController;
  PageController get pageController => this._pageController;

  List<Question> _questions = sample_data
      .map(
        (question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer: question['answer_index']),
      )
      .toList();
  List<Question> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  int _correctAns;
  int get correctAns => this._correctAns;

  int _selectedAns;
  int get selectedAns => this._selectedAns;

  String _nome = "";
  String get nome => this._nome;

  String _idade = "";
  String get idade => this._idade;

  String _estado = "";
  String get estado => this._estado;

  String _sexo = "";
  String get sexo => this._sexo;

  // for more about obs please check documentation
  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  double _numOfCorrectAns = 0;
  double get numOfCorrectAns => this._numOfCorrectAns;

  // called immediately after the widget is allocated memory
  @override
  void onInit() {
    // Our animation duration is 60 s
    // so our plan is to fill the progress bar within 60s
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        // update like setState
        update();
      });

    // start our animation
    // Once 60s is completed go to the next qn
    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  // // called just before the Controller is deleted from memory
  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkNome(String nome) {
    _nome = nome;
  }

  void checkIdade(String idade) {
    _idade = idade;
  }

  void checkEstado(String estado) {
    _estado = estado;
  }

  void checkSexo(String sexo) {
    _sexo = sexo;
  }

  void checkAns(Question question, int selectedIndex) {
    // because once user press any option then it will run
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;
    // if (_correctAns == _selectedAns) _numOfCorrectAns++;
    switch (_selectedAns) {
      case 0:
        _numOfCorrectAns += 0;
        break;
      case 1:
        _numOfCorrectAns += 0.5;
        break;
      case 2:
        _numOfCorrectAns += 1;
        break;
      case 3:
        _numOfCorrectAns += 2;
        break;
      case 4:
        _numOfCorrectAns += 3;
        break;
    }

    // It will stop the counter
    _animationController.stop();
    update();

    // Once user select an ans after 3s it will go to the next qn
    Future.delayed(Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);

      // Reset the counter
      _animationController.reset();

      // Then start it again
      // Once timer is finish go to the next qn
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      // Get package provide us simple way to naviigate another page
      Get.to(ScoreScreen());
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
