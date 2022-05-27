class PokemonForm {
  PokemonForm({
    required this.id,
    required this.name,
    required this.sprites,
  });

  int id;
  String name;
  Sprites sprites;

  factory PokemonForm.fromJson(Map<String, dynamic> json) => PokemonForm(
        id: json['id'],
        name: json['name'],
        sprites: Sprites.fromJson(json['sprites']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'sprites': sprites.toJson(),
      };
}

class Sprites {
  Sprites({
    required this.frontDefault,
    required this.frontShiny,
  });

  String frontDefault;
  String frontShiny;

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        frontDefault: json['front_default'],
        frontShiny: json['front_shiny'],
      );

  Map<String, dynamic> toJson() => {
        'front_default': frontDefault,
        'front_shiny': frontShiny,
      };
}
