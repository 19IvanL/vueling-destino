class Player {
  String name;
  int points;
  Player(this.name, this.points);
  @override
  String toString() {
    return name + " " + points.toString();
  }
}

class Question {
  String question;
  List<String> answers;
  int correctAnswer;
  Question(this.question, this.answers, this.correctAnswer);
  @override
  String toString() {
    String s = question + '\n';
    for (int i = 0; i < answers.length; i++) {
      if (i == correctAnswer) s += "-> ";
      s += answers[i];
    }
    return s;
  }
}

List<Question> dummyQuestions() {
  List<Question> list = [];
  list.add(Question(
      "¿Cuál es el nombre oficial de la famosa iglesia de Barcelona?",
      [
        "Sagrada Familia",
        "Basílica de Santa María del Mar",
        "Catedral de Barcelona",
        "Iglesia de Santa María del Pi"
      ],
      0));
  list.add(Question("¿Qué artista famoso diseñó el Parque Güell?",
      ["Antoni Gaudí", "Pablo Picasso", "Salvador Dalí", "Joan Miró"], 0));
  list.shuffle();
  return list;
}
