class Pokemon {
  int id;
  String name;
  String image;

  Pokemon({
    required this.id,
    required this.name,
    required this.image,
  });

  factory Pokemon.fromJson(Map <String,dynamic> json) {
    return Pokemon(
      id: json["id"],
      name: json["name"],
      image: json["sprites"]["front_shiny"],
    );
  }
}