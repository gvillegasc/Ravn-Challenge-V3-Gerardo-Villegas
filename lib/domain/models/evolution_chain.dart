class EvolutionChain {
  EvolutionChain({
    required this.chain,
  });

  Chain chain;

  factory EvolutionChain.fromJson(Map<String, dynamic> json) => EvolutionChain(
        chain: Chain.fromJson(json['chain']),
      );
}

class Chain {
  Chain({
    required this.evolvesTo,
  });

  List<EvolvesTo> evolvesTo;

  factory Chain.fromJson(Map<String, dynamic> json) => Chain(
        evolvesTo: List<EvolvesTo>.from(
            json['evolves_to'].map((x) => EvolvesTo.fromJson(x))),
      );
}

class EvolvesTo {
  EvolvesTo({
    required this.species,
  });

  factory EvolvesTo.fromJson(Map<String, dynamic> json) => EvolvesTo(
        species: Species.fromJson(json['species']),
      );

  Species species;
}

class Species {
  Species({
    required this.name,
    required this.url,
    this.id,
    this.spriteFront,
  });

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json['name'],
        url: json['url'],
        id: int.parse((json['url'])
            .toString()
            .replaceAll('https://pokeapi.co/api/v2/pokemon-species/', '')
            .replaceAll('/', '')),
      );

  String name;
  String url;
  int? id;
  String? spriteFront;
}
