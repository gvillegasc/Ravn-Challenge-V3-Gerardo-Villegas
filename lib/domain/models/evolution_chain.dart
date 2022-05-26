class EvolutionChain {
  EvolutionChain({
    required this.chain,
  });
  factory EvolutionChain.fromJson(Map<String, dynamic> json) => EvolutionChain(
        chain: Chain.fromJson(json['chain']),
      );

  Chain chain;
}

class Chain {
  Chain({
    required this.evolvesTo,
    required this.species,
  });

  factory Chain.fromJson(Map<String, dynamic> json) => Chain(
        evolvesTo:
            List<Chain>.from(json['evolves_to'].map((x) => Chain.fromJson(x))),
        species: Species.fromJson(json['species']),
      );

  List<Chain> evolvesTo;
  Species species;
}

class Species {
  Species({
    this.name,
    this.url,
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

  String? name;
  String? url;
  int? id;
  String? spriteFront;
}
