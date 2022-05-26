class PokemonSpecies {
  PokemonSpecies({
    required this.colorName,
    required this.evolutionChain,
    required this.flavorTextEntries,
    required this.isLegendary,
  });

  factory PokemonSpecies.fromJson(Map<String, dynamic> json) => PokemonSpecies(
        colorName: ColorName.fromJson(json['color']),
        evolutionChain: EvolutionChainUrl.fromJson(json['evolution_chain']),
        flavorTextEntries: List<FlavorTextEntry>.from(
            json['flavor_text_entries']
                .map((x) => FlavorTextEntry.fromJson(x))),
        isLegendary: json['is_legendary'],
      );

  ColorName colorName;
  EvolutionChainUrl evolutionChain;
  List<FlavorTextEntry> flavorTextEntries;
  bool isLegendary;
}

class ColorName {
  ColorName({
    required this.name,
  });

  factory ColorName.fromJson(Map<String, dynamic> json) => ColorName(
        name: json['name'],
      );

  String name;
}

class EvolutionChainUrl {
  EvolutionChainUrl({
    required this.url,
  });

  factory EvolutionChainUrl.fromJson(Map<String, dynamic> json) =>
      EvolutionChainUrl(
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
