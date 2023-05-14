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
    "¿Cuál es la emblemática estructura arquitectónica de Barcelona diseñada por Antoni Gaudí?",
    [
      "La Sagrada Familia",
      "El Museo Picasso",
      "El Parque Güell",
      "La Plaza de Cataluña"
    ],
    0,
  ));

  list.add(Question(
    "¿Cuál es el famoso bulevar de Barcelona conocido por sus tiendas, restaurantes y vida nocturna?",
    ["Las Ramblas", "El Barrio Gótico", "El Paseo de Gracia", "La Barceloneta"],
    0,
  ));

  list.add(Question(
    "¿Cuál es el equipo de fútbol más importante de Barcelona?",
    ["FC Barcelona", "RCD Espanyol", "Real Madrid", "Atletico Madrid"],
    0,
  ));

  list.add(Question(
    "¿Qué montaña ofrece una vista panorámica impresionante de toda la ciudad de Barcelona?",
    ["Montjuïc", "Tibidabo", "Montserrat", "Collserola"],
    1,
  ));

  list.add(Question(
    "¿Cuál es la playa más popular de Barcelona?",
    ["Barceloneta", "Bogatell", "Nova Icaria", "Mar Bella"],
    0,
  ));

  list.add(Question(
    "¿En qué año se celebraron los Juegos Olímpicos en Barcelona?",
    ["1988", "1992", "1996", "2000"],
    1,
  ));

  list.add(Question(
    "¿Qué famoso arco triunfal se encuentra al final de la Avenida María Cristina en Barcelona?",
    [
      "El Arco de Triunfo",
      "La Puerta de Alcalá",
      "El Arco de Berlín",
      "El Monumento a Colón"
    ],
    0,
  ));

  list.add(Question(
    "¿Cuál es el parque más grande de Barcelona?",
    [
      "El Parque de la Ciudadela",
      "El Parque de Montjuïc",
      "El Parque de la Diagonal",
      "El Parque de la Barceloneta"
    ],
    1,
  ));

  list.add(Question(
    "¿Cuál es el mercado más famoso de Barcelona, conocido por su arquitectura modernista?",
    [
      "El Mercado de Sant Antoni",
      "El Mercado de la Boquería",
      "El Mercado de la Concepción",
      "El Mercado de la Barceloneta"
    ],
    1,
  ));

  list.add(Question(
    "¿Cuál es el nombre del estadio de fútbol del FC Barcelona?",
    [
      "Estadio Olímpico",
      "Estadio Vicente Calderón",
      "Camp Nou",
      "Estadio Santiago Bernabéu"
    ],
    2,
  ));

  list.shuffle();
  return list;
}
