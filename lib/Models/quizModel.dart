class QuizClass {
  String category, type, difficulty, question, correctAnswer;
  List<String> incorrectAnswers;

  QuizClass(String category, String type, String difficulty, String question,
      String correctAnswer, List incorrectAnswers) {
    this.category = category.replaceAll('Entertainment: ', '');
    this.type = type;
    this.difficulty = difficulty;
    this.question = question;
    this.correctAnswer = correctAnswer;
    this.incorrectAnswers = incorrectAnswers;
  }

  factory QuizClass.fromJson(Map<String, dynamic> json) {
    return QuizClass(
        json['category'],
        json['type'],
        json['difficulty'],
        json['question'],
        json['correct_answer'],
        json['incorrect_answers'] as List);
  }
}
