class Config{
  // flutter pub run build_runner build
  // flutter pub run build_runner watch
  // flutter pub run build_runner build --delete-conflicting-outputs
  //flutter packages pub run build_runner build

  static const String baseUrl = 'http://pokeapi.co/api/v2/pokemon';
  //example - https://pokeapi.co/api/v2/pokemon/bulbasaur
  static const String specificPokemonEndPoint = '/';
  //example - https://pokeapi.co/api/v2/pokemon?limit=1200
  static const String allPokemonEndPoint = '?limit=1200';

  // Hive table
  static const int hiveTypeResult = 0;
  static const int hiveTypePokemonName = 1;
  static const int hiveTypePokemon = 2;
  static const int hiveTypeSprites = 3;
  static const int hiveTypePokemonType = 4;
  static const int hiveTypePokemonTypeInfo = 5;

}
