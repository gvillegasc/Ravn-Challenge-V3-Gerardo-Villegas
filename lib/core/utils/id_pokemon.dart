String idPokemon(int id) {
  final String stringId = id.toString();
  if (stringId.length == 1) {
    return '#00$stringId';
  } else if (stringId.length == 2) {
    return '#0$stringId';
  }
  return '#$stringId';
}
