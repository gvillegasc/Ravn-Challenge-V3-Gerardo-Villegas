class PokemonMapper {
  PokemonMapper.fromJsonList(List<dynamic> jsonList) {
    for (final item in jsonList) {
      final commit = Pokemon.fromJson(item as Map<String, dynamic>);
      items.add(commit);
    }
  }
  PokemonMapper();

  List<Pokemon> items = [];
}

class Pokemon {
  Pokemon({
    required this.id,
    required this.name,
    required this.types,
    required this.generation,
    required this.sprites,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        id: json['id'],
        name: json['name'],
        types: List<Type>.from(json['types'].map((x) => Type.fromJson(x))),
        generation: generationValues.map[json['generation']]!,
        sprites: Sprites.fromJson(json['sprites']),
      );

  int id;
  String name;
  List<Type> types;
  Generation generation;
  Sprites sprites;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'types': List<dynamic>.from(types.map((x) => x.toJson())),
        'generation': generationValues.reverse[generation],
        'sprites': sprites.toJson(),
      };
}

enum Generation {
  generationI,
  generationII,
  generationIII,
  generationIV,
  generationV,
  generationVI,
  generationVII,
  generationVIII
}

final generationValues = EnumValues({
  'Generation I': Generation.generationI,
  'Generation II': Generation.generationII,
  'Generation III': Generation.generationIII,
  'Generation IV': Generation.generationIV,
  'Generation V': Generation.generationV,
  'Generation VI': Generation.generationVI,
  'Generation VII': Generation.generationVII,
  'Generation VIII': Generation.generationVIII
});

class Sprites {
  Sprites({
    required this.frontDefault,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        frontDefault: json['front_default'],
      );

  String frontDefault;

  Map<String, dynamic> toJson() => {
        'front_default': frontDefault,
      };
}

class Type {
  Type({
    required this.name,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        name: typeNameValues.map[json['name']]!,
      );

  TypeName name;

  Map<String, dynamic> toJson() => {
        'name': typeNameValues.reverse[name],
      };
}

enum TypeName {
  grass,
  poison,
  fire,
  flying,
  water,
  bug,
  normal,
  electric,
  ground,
  fairy,
  fighting,
  psychic,
  rock,
  steel,
  ice,
  ghost,
  dragon,
  dark
}

final typeNameValues = EnumValues({
  'Bug': TypeName.bug,
  'Dark': TypeName.dark,
  'Dragon': TypeName.dragon,
  'Electric': TypeName.electric,
  'Fairy': TypeName.fairy,
  'Fighting': TypeName.fighting,
  'Fire': TypeName.fire,
  'Flying': TypeName.flying,
  'Ghost': TypeName.ghost,
  'Grass': TypeName.grass,
  'Ground': TypeName.ground,
  'Ice': TypeName.ice,
  'Normal': TypeName.normal,
  'Poison': TypeName.poison,
  'Psychic': TypeName.psychic,
  'Rock': TypeName.rock,
  'Steel': TypeName.steel,
  'Water': TypeName.water,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
