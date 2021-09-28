class QuizModel {
  int? id;
  String? questionId;
  String? question;
  int? answerIndex;
  List<dynamic>? options;

  QuizModel({
    this.id,
    required this.questionId,
    required this.question,
    this.answerIndex,
    required this.options,
  });

  QuizModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    questionId = json['question_id'];
    question = json['question'];
    answerIndex = json['answer_index'];
    options = json['options'];
  }
}
