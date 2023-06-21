import 'dart:convert';

import 'package:http/http.dart' as http;

class Pokemon {
  late String name;
  late List<String> types;
  late int order;

  Pokemon({required String name, required List<String> types, required int order}) {
    this.name = name;
    this.types = types;
    this.order = order;
  }
}

class Pokeapi {
  var api = "pokeapi.co";
  var endpointPokemons = "/api/v2/pokemon/";

  Future<Pokemon?> getPokemonByName({required String name}) async {
    final result =  await http.get(Uri.https(api, endpointPokemons + name));
    if (result.statusCode != 200) {
      return null;
    }

    final data = json.decode(result.body) as Map<String, dynamic>;
    List<String> types = [];

    for (var type in data["types"]) {
      types.add(type["type"]["name"]);
    }

    return Pokemon(name: data["name"], types: types, order: data["order"]);
  }

}

Future<void> main(List<String> args) async {
  final pokeapi = Pokeapi();
  final pokemonInfo = await pokeapi.getPokemonByName(name: "pikachu");
  if (pokemonInfo != null) {
    print(pokemonInfo.name);
  }
}
