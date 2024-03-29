// To parse this JSON data, do
//
//     final typeResponse = typeResponseFromJson(jsonString);

import 'dart:convert';

TypeResponse typeResponseFromJson(String str) =>
    TypeResponse.fromJson(json.decode(str));

String typeResponseToJson(TypeResponse data) => json.encode(data.toJson());

class TypeResponse {
  TypeResponse({
    this.damageRelations,
    this.gameIndices,
    this.generation,
    this.id,
    this.moveDamageClass,
    this.moves,
    this.name,
    this.names,
    this.pastDamageRelations,
    this.pokemon,
  });

  DamageRelations damageRelations;
  List<GameIndex> gameIndices;
  Generation generation;
  int id;
  Generation moveDamageClass;
  List<Generation> moves;
  String name;
  List<Name> names;
  List<dynamic> pastDamageRelations;
  List<Pokemon> pokemon;

  factory TypeResponse.fromJson(Map<String, dynamic> json) => TypeResponse(
        damageRelations: json["damage_relations"] == null
            ? null
            : DamageRelations.fromJson(json["damage_relations"]),
        gameIndices: json["game_indices"] == null
            ? null
            : List<GameIndex>.from(
                json["game_indices"].map((x) => GameIndex.fromJson(x))),
        generation: json["generation"] == null
            ? null
            : Generation.fromJson(json["generation"]),
        id: json["id"] == null ? null : json["id"],
        moveDamageClass: json["move_damage_class"] == null
            ? null
            : Generation.fromJson(json["move_damage_class"]),
        moves: json["moves"] == null
            ? null
            : List<Generation>.from(
                json["moves"].map((x) => Generation.fromJson(x))),
        name: json["name"] == null ? null : json["name"],
        names: json["names"] == null
            ? null
            : List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
        pastDamageRelations: json["past_damage_relations"] == null
            ? null
            : List<dynamic>.from(json["past_damage_relations"].map((x) => x)),
        pokemon: json["pokemon"] == null
            ? null
            : List<Pokemon>.from(
                json["pokemon"].map((x) => Pokemon.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "damage_relations":
            damageRelations == null ? null : damageRelations.toJson(),
        "game_indices": gameIndices == null
            ? null
            : List<dynamic>.from(gameIndices.map((x) => x.toJson())),
        "generation": generation == null ? null : generation.toJson(),
        "id": id == null ? null : id,
        "move_damage_class":
            moveDamageClass == null ? null : moveDamageClass.toJson(),
        "moves": moves == null
            ? null
            : List<dynamic>.from(moves.map((x) => x.toJson())),
        "name": name == null ? null : name,
        "names": names == null
            ? null
            : List<dynamic>.from(names.map((x) => x.toJson())),
        "past_damage_relations": pastDamageRelations == null
            ? null
            : List<dynamic>.from(pastDamageRelations.map((x) => x)),
        "pokemon": pokemon == null
            ? null
            : List<dynamic>.from(pokemon.map((x) => x.toJson())),
      };
}

class DamageRelations {
  DamageRelations({
    this.doubleDamageFrom,
    this.doubleDamageTo,
    this.halfDamageFrom,
    this.halfDamageTo,
    this.noDamageFrom,
    this.noDamageTo,
  });

  List<Generation> doubleDamageFrom;
  List<Generation> doubleDamageTo;
  List<Generation> halfDamageFrom;
  List<Generation> halfDamageTo;
  List<Generation> noDamageFrom;
  List<Generation> noDamageTo;

  factory DamageRelations.fromJson(Map<String, dynamic> json) {
    return DamageRelations(
      doubleDamageFrom: json["double_damage_from"] == null ||
              json["double_damage_from"].isEmpty
          ? []
          : List<Generation>.from(
              json["double_damage_from"].map((x) => Generation.fromJson(x))),
      doubleDamageTo:
          json["double_damage_to"] == null || json["double_damage_to"].isEmpty
              ? []
              : List<Generation>.from(
                  json["double_damage_to"].map((x) => Generation.fromJson(x))),
      halfDamageFrom:
          json["half_damage_from"] == null || json["half_damage_from"].isEmpty
              ? []
              : List<Generation>.from(
                  json["half_damage_from"].map((x) => Generation.fromJson(x))),
      halfDamageTo:
          json["half_damage_to"] == null || json["half_damage_to"].isEmpty
              ? []
              : List<Generation>.from(
                  json["half_damage_to"].map((x) => Generation.fromJson(x))),
      noDamageFrom:
          json["no_damage_from"] == null || json["no_damage_from"].isEmpty
              ? []
              : List<Generation>.from(
                  json["no_damage_from"].map((x) => Generation.fromJson(x))),
      noDamageTo: json["no_damage_to"] == null || json["no_damage_to"].isEmpty
          ? []
          : List<Generation>.from(
              json["no_damage_to"].map((x) => Generation.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "double_damage_from": doubleDamageFrom == null
            ? null
            : List<dynamic>.from(doubleDamageFrom.map((x) => x.toJson())),
        "double_damage_to": doubleDamageTo == null
            ? null
            : List<dynamic>.from(doubleDamageTo.map((x) => x)),
        "half_damage_from": halfDamageFrom == null
            ? null
            : List<dynamic>.from(halfDamageFrom.map((x) => x)),
        "half_damage_to": halfDamageTo == null
            ? null
            : List<dynamic>.from(halfDamageTo.map((x) => x.toJson())),
        "no_damage_from": noDamageFrom == null
            ? null
            : List<dynamic>.from(noDamageFrom.map((x) => x.toJson())),
        "no_damage_to": noDamageTo == null
            ? null
            : List<dynamic>.from(noDamageTo.map((x) => x.toJson())),
      };
}

class Generation {
  Generation({
    this.name,
    this.url,
  });

  String name;
  String url;

  factory Generation.fromJson(Map<String, dynamic> json) => Generation(
        name: json["name"] == null ? null : json["name"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "url": url == null ? null : url,
      };
}

class GameIndex {
  GameIndex({
    this.gameIndex,
    this.generation,
  });

  int gameIndex;
  Generation generation;

  factory GameIndex.fromJson(Map<String, dynamic> json) => GameIndex(
        gameIndex: json["game_index"] == null ? null : json["game_index"],
        generation: json["generation"] == null
            ? null
            : Generation.fromJson(json["generation"]),
      );

  Map<String, dynamic> toJson() => {
        "game_index": gameIndex == null ? null : gameIndex,
        "generation": generation == null ? null : generation.toJson(),
      };
}

class Name {
  Name({
    this.language,
    this.name,
  });

  Generation language;
  String name;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        language: json["language"] == null
            ? null
            : Generation.fromJson(json["language"]),
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "language": language == null ? null : language.toJson(),
        "name": name == null ? null : name,
      };
}

class Pokemon {
  Pokemon({
    this.pokemon,
    this.slot,
  });

  Generation pokemon;
  int slot;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        pokemon: json["pokemon"] == null
            ? null
            : Generation.fromJson(json["pokemon"]),
        slot: json["slot"] == null ? null : json["slot"],
      );

  Map<String, dynamic> toJson() => {
        "pokemon": pokemon == null ? null : pokemon.toJson(),
        "slot": slot == null ? null : slot,
      };
}
