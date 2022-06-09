class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({this.id, this.question, this.answer, this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question": "Considera que a sua memória é boa?",
    "options": [
      'Tenho boa memória, apesar de haver pequenos esquecimentos que não interferem no meu dia-a-dia.',
      'Às vezes esqueço algumas coisas como a pergunta que me fizeram, esqueço compromissos ou onde deixei as chaves.',
      'Costumo esquecer o que fui fazer na cozinha, na sala, ou no quarto e também o que estava fazendo.',
      'Não consigo lembrar de informações simples e recentes como o nome de quem acabei de conhecer, mesmo se me esforçar muito.',
      'É impossível lembrar onde estou e quem são as pessoas à minha volta.'
    ],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "Você sabe que dia é hoje?",
    "options": [
      'Sim! Também tenho facilidade em reconhecer as pessoas e os lugares.',
      'Não me lembro muito bem que dia é hoje e tenho uma leve dificuldade para guardar datas.',
      'Não sei bem em que mês estamos, mas sou capaz de reconhecer locais familiares. No entanto, fico meio confuso em locais novos e posso me perder.',
      'Nãor sei. Também não me lembo exatamente quem são meus familiares, onde moro e não me lembro de nada do meu passado.',
      'Tudo que sei é o meu nome, mas às vezes lembro-me dos nomes dos meus filhos, netos ou outros parentes'
    ],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "Você é capaz de tomar decisões?",
    "options": [
      'Sou plenamente capaz de resolver problemas do dia a dia e lido bem com questões pessoais e financeiras.',
      'Tenho alguma dificuldade para entender alguns conceitos abstratos (como por exemplo o por quê de uma pessoa ficar triste).',
      'Estou me sentindo um pouco inseguro e tenho medo de tomar decisões. Por isso prefiro que outros decidam por mim.',
      'Não me sinto capaz de resolver qualquer problema e a única decisão que tomo é o que quero comer.',
      'Não sou capaz de tomar nenhuma decisão e sou totalmente dependente da ajuda de outras pessoas.'
    ],
    "answer_index": 2,
  },
];
