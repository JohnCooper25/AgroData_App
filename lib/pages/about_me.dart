import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:url_launcher/url_launcher.dart';

class Question {
  final String titulo;
  int valor; // mutable para guardar rating
  final String min;
  final String max;

  Question({
    required this.titulo,
    required this.valor,
    required this.min,
    required this.max,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      titulo: json['titulo'],
      valor: json['valor'] ?? 0,
      min: json['min'],
      max: json['max'],
    );
  }
}

class AboutMePage extends StatefulWidget {
  const AboutMePage({super.key});

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  Map<String, List<Question>> _questions = {};
  bool _loading = true;
  final TextEditingController _userIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    try {
      final String response = await rootBundle.loadString('assets/feedback_questions.json');
      final Map<String, dynamic> data = json.decode(response);

      final questionsMap = data.map((key, value) {
        List<Question> questions = (value as List)
            .map((json) => Question.fromJson(json))
            .toList();
        return MapEntry(key, questions);
      });

      setState(() {
        _questions = questionsMap;
        _loading = false;
      });
    } catch (e) {
      print('Error cargando preguntas: $e');
      setState(() {
        _loading = false;
      });
    }
  }

  Widget _buildQuestionCard(Question question) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(question.titulo, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Mínimo: ${question.min}'),
            Text('Máximo: ${question.max}'),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(6, (index) {
                // 0 a 5 estrellas
                return IconButton(
                  icon: Icon(
                    index <= question.valor ? Icons.star : Icons.star_border,
                    color: Colors.amber,
                  ),
                  onPressed: () {
                    setState(() {
                      question.valor = index;
                    });
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  bool _validate() {
    if (_userIdController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor ingresa tu identificación')),
      );
      return false;
    }
    for (var category in _questions.values) {
      for (var q in category) {
        if (q.valor < 0 || q.valor > 5) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Por favor completa todas las valoraciones')),
          );
          return false;
        }
      }
    }
    return true;
  }

  String _buildEmailBody() {
    final buffer = StringBuffer();
    buffer.writeln('Identificación del usuario: ${_userIdController.text.trim()}\n');
    _questions.forEach((category, questions) {
      buffer.writeln('--- $category ---');
      for (var q in questions) {
        buffer.writeln('${q.titulo}');
        buffer.writeln('Valoración: ${q.valor} estrellas');
        buffer.writeln('');
      }
    });
    return buffer.toString();
  }

  Future<void> _sendFeedback() async {
  if (!_validate()) return;

  final Uri mailtoUri = Uri(
    scheme: 'mailto',
    path: 'jluiscatalan1@gmail.com',
    queryParameters: {
      'subject': 'Feedback de la App AgroData',
      'body': _buildEmailBody(),
    },
  );

  if (await canLaunchUrl(mailtoUri)) {
    await launchUrl(mailtoUri);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('No se pudo abrir la aplicación de correo')),
    );
  }
}

  @override
  void dispose() {
    _userIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.headlineSmall;
    return Scaffold(
      appBar: AppBar(title: const Text('Acerca de')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('AgroData', style: titleStyle),
                  const SizedBox(height: 8),
                  const Text('Desarrollado por: Jonathan Catalan M\nContacto: jluiscatalan1@gmail.com\n\nAgroData es una aplicacion dedicada a la creacion y respaldo de registros para cosechas y mantencion de maquinaria.'),
                  const Divider(height: 32),
                  const Text('Tu opinión nos importa. Por favor completa la siguiente retroalimentación:'),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _userIdController,
                    decoration: const InputDecoration(
                      labelText: 'Tu identificación (nombre o email)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),

                  ..._questions.entries.expand((entry) {
                    return [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          entry.key.toUpperCase(),
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      ...entry.value.map(_buildQuestionCard).toList(),
                    ];
                  }),

                  const SizedBox(height: 24),
                  Center(
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.send),
                      label: const Text('Enviar feedback'),
                      onPressed: _sendFeedback,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
