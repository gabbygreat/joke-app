class JokeModel {
  final bool error;
  final String category;
  final String type;
  final String? joke;
  final String? setup;
  final String? delivery;
  final int id;
  final bool safe;

  JokeModel({
    required this.error,
    required this.category,
    required this.type,
    this.joke,
    this.setup,
    this.delivery,
    required this.id,
    required this.safe,
  });

  static JokeModel fromMap(Map<String, dynamic> map) {
    return JokeModel(
      error: map['error'],
      category: map['category'],
      type: map['type'],
      id: map['id'],
      joke: map['joke'],
      delivery: map['delivery'],
      setup: map['setup'],
      safe: map['safe'],
    );
  }
}
