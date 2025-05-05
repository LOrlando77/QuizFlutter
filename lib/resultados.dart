import 'package:flutter/material.dart';
import 'main.dart';

class ResultadoPage extends StatelessWidget {
  final String userName;
  final int score;
  final int total;

  const ResultadoPage({
    super.key,
    required this.userName,
    required this.score,
    required this.total,
  });

  void _reiniciar(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  String _getFeedback(double nota) {
    if (nota >= 9) {
      return 'Excelente!';
    } else if (nota >= 7) {
      return 'Muito bom!';
    } else if (nota >= 5) {
      return 'Bom, mas pode melhorar.';
    } else {
      return 'Precisa estudar mais!';
    }
  }

  @override
  Widget build(BuildContext context) {
    double notaFinal = (score / total) * 10;
    String feedback = _getFeedback(notaFinal);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Parabéns gênio da geografia, $userName!',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'Pontuação: $score / $total',
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            'Nota final: ${notaFinal.toStringAsFixed(1)}',
            style: const TextStyle(fontSize: 22, color: Colors.blue),
          ),
          const SizedBox(height: 10),
          Text(
            feedback,
            style: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _reiniciar(context),
            child: const Text('Reiniciar'),
          ),
        ],
      ),
    );
  }
}
