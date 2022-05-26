class PokemonSpecies {
  PokemonSpecies({
    required this.color,
    required this.evolutionChain,
    required this.flavorTextEntries,
    required this.isLegendary,
  });

  factory PokemonSpecies.fromJson(Map<String, dynamic> json) => PokemonSpecies(
        color: Color.fromJson(json['color']),
        evolutionChain: EvolutionChain.fromJson(json['evolution_chain']),
        flavorTextEntries: List<FlavorTextEntry>.from(
            json['flavor_text_entries']
                .map((x) => FlavorTextEntry.fromJson(x))),
        isLegendary: json['is_legendary'],
      );

  Color color;
  EvolutionChain evolutionChain;
  List<FlavorTextEntry> flavorTextEntries;
  bool isLegendary;
}

class Color {
  Color({
    required this.name,
  });

  factory Color.fromJson(Map<String, dynamic> json) => Color(
        name: json['name'],
      );

  String name;
}

class EvolutionChain {
  EvolutionChain({
    required this.url,
  });

  factory EvolutionChain.fromJson(Map<String, dynamic> json) => EvolutionChain(
        url: json['url'],
      );

  String url;
}

class FlavorTextEntry {
  FlavorTextEntry({
    required this.flavorText,
  });

  factory FlavorTextEntry.fromJson(Map<String, dynamic> json) =>
      FlavorTextEntry(
        flavorText: json['flavor_text'],
      );

  String flavorText;
}
