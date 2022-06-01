class Question {
  final int? id, answer;
  final String? question;
  final List<String>? options;

  Question({this.id, this.question, this.options,this.answer});
}

const List sample_data = [
  {
    "id": 1,
    "question":
        "How old are you?",
    "options": ['0-18', '18-65', '65+', '-'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "Had a tattoo in the last 4 months?",
    "options": ['Yes', 'No'],
    "answer_index": 1,
  },
  {
    "id": 3,
    "question": "Are you pregnant or recently given birth?",
    "options": ['Yes', 'No'],
    "answer_index": 1,
  },
  {
    "id": 4,
    "question": "Do you have a heart condition?",
    "options": ['Yes', 'No'],
    "answer_index": 1,
  },
  {
    "id": 5,
    "question": "Are you low in iron?",
    "options": ['Yes', 'No'],
    "answer_index": 1,
  },
  {
    "id": 6,
    "question": "Have you injected recreational drugs in the past 5 years?",
    "options": ['Yes', 'No'],
    "answer_index": 1,
  },
];
