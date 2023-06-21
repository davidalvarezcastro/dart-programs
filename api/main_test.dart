import 'package:test/test.dart';

import 'main.dart';

void main() {
  final pokeapi = Pokeapi();

  test('gets name', () async {
    final name = "pikachu";
    final pokemonInfo = await pokeapi.getPokemonByName(name: name);
    if (pokemonInfo != null) {
      expect(pokemonInfo.name, name);
    }
  });

  test('gets name (II)', () async {
    final name = "mew";
    final pokemonInfo = await pokeapi.getPokemonByName(name: name);
    if (pokemonInfo != null) {
      expect(pokemonInfo.name, name);
    }
  });

  test('gets type', () async {
    final name = "mew";
    final types = ["psychic"];
    final pokemonInfo = await pokeapi.getPokemonByName(name: name);
    if (pokemonInfo != null) {
      expect(pokemonInfo.types, types);
    }
  });

  test('gets type (II)', () async {
    final name = "charizard";
    final types = ["fire", "flying"];
    final pokemonInfo = await pokeapi.getPokemonByName(name: name);
    if (pokemonInfo != null) {
      expect(pokemonInfo.types, types);
    }
  });
}
