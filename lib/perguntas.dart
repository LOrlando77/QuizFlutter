import 'package:flutter/material.dart';
import 'resultados.dart';

class QuizPage extends StatefulWidget {
  final String userName;

  const QuizPage({super.key, required this.userName});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Question> _questions = [
    Question(text: 'Quantos estados tem no Brasil?', answers: ['24', '25', '26', '27'], correctIndex: 2),
    Question(text: 'Qual é a capital do Brasil?', answers: ['São Paulo', 'Brasília', 'Rio de Janeiro', 'Salvador'], correctIndex: 1),
    Question(text: 'Quais países não fazem fronteira com o Brasil?', answers: ['Uruguai e Paraguai','Alemanha e Argentina', 'Equador e Chile','Guiana Francesa e Chile'], correctIndex: 2),
    Question(text: 'Qual a capital da Bahia?', answers: ['São Paulo', 'Belo Horizonte', 'Recife', 'Salvador'], correctIndex: 3),
    Question(text: 'Qual o maior rio do Brasil?', answers: ['Rio Paraná', 'Rio Amazonas', 'Rio São Francisco', 'Rio Tocantins'], correctIndex: 1),
    Question(text: 'O território brasileiro é dividido em 27 unidades federativas e cinco grandes regiões. As alternativas abaixo apresentam unidades federativas da região Norte do Brasil, com exceção de:', answers: ['Mato Grosso','Tocantins','Amazonas','Roraima'], correctIndex: 0),
    Question(text: 'O Brasil possui uma população total superior aos 200 milhões de habitantes. Uma característica demográfica nacional é a:', answers: ['Diminuição da taxa de envelhecimento da população.','Distribuição heterogênea da população no território.','Acentuação da mortalidade infantil das crianças do país.'], correctIndex: 1),
    Question(text: 'A geomorfologia do Brasil apresenta aspectos bastante heterogêneos em todo o território nacional. Qual a forma de relevo predominante no país?', answers: ['Depressão','Cordilheira','Planície','Planalto'], correctIndex: 3),
    Question(text: 'A partir dos números populacionais apresentados pelo Brasil, qual região possui o maior valor de população absoluta?', answers: [ 'Sul','Sudeste','Nordeste','Norte'], correctIndex: 1),
    Question(text: 'Qual o estado brasileiro que apresenta o maior valor de Produto Interno Bruto (PIB)?', answers: ['Rio de Janeiro','Paraná','Minas Gerais','São Paulo'], correctIndex: 3),
  ];

  int _currentQuestionIndex = 0;
  int _score = 0;

  void _answerQuestion(int selectedIndex) {
    if (_questions[_currentQuestionIndex].correctIndex == selectedIndex) {
      _score++;
    }
    setState(() {
      _currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool quizFinished = _currentQuestionIndex >= _questions.length;

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz - Olá, ${widget.userName}'),
      ),
      body: quizFinished
          ? ResultadoPage(userName: widget.userName, score: _score, total: _questions.length)
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Pergunta ${_currentQuestionIndex + 1} de ${_questions.length}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _questions[_currentQuestionIndex].text,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  ..._questions[_currentQuestionIndex].answers.asMap().entries.map(
                        (entry) => Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: ElevatedButton(
                            onPressed: () => _answerQuestion(entry.key),
                            child: Text(entry.value),
                          ),
                        ),
                      ),
                ],
              ),
            ),
    );
  }
}

class Question {
  final String text;
  final List<String> answers;
  final int correctIndex;

  Question({
    required this.text,
    required this.answers,
    required this.correctIndex,
  });
}
