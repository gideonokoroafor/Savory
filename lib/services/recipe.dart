class Recipe {
  final String name;
  final String images;
  final double rating;
  final String totalTime;
  final int numberOfServings;
  final String? description;
  final List<String> preparationSteps;

  Recipe({
    required this.name,
    required this.images,
    required this.rating,
    required this.totalTime,
    required this.numberOfServings,
    this.description,
    required this.preparationSteps,
  });

  factory Recipe.fromJson(
    dynamic json,
    List<String> preparationSteps,
    dynamic description,
  ) {
    return Recipe(
      name: json['name'] as String,
      images: json['images'][0]['hostedLargeUrl'] as String,
      rating: json['rating'] as double,
      totalTime: json['totalTime'] as String,
      numberOfServings: json['numberOfServings'] as int,
      description: description != null ? description['text'] as String : null,
      preparationSteps: preparationSteps,
    );
  }

  static List<Recipe> recipesFromSnapshot(
    List<dynamic> snapshot,
    List<dynamic> steps,
    List<dynamic> description,
  ) {
    return List<Recipe>.generate(snapshot.length, (index) {
      final List<String> preparationSteps = steps[index].cast<String>();
      final dynamic recipeDescription = description[index];
      return Recipe.fromJson(
        snapshot[index],
        preparationSteps,
        recipeDescription,
      );
    });
  }

  @override
  String toString() {
    return 'Recipe {name: $name, images: $images, rating: $rating, totalTime: $totalTime, numberOfServings: $numberOfServings, description: $description, preparationSteps: $preparationSteps}';
  }
}
