import 'package:flutter/widgets.dart';
import 'package:pokechallenge/domain/models/pokemon.dart';

Widget pokemonTag(TypeName name) {
  switch (name) {
    case TypeName.bug:
      return Image.asset('assets/pages/tags/tag_bug.png');
    case TypeName.dark:
      return Image.asset('assets/pages/tags/tag_dark.png');
    case TypeName.dragon:
      return Image.asset('assets/pages/tags/tag_dragon.png');
    case TypeName.electric:
      return Image.asset('assets/pages/tags/tag_electric.png');
    case TypeName.fairy:
      return Image.asset('assets/pages/tags/tag_fairy.png');
    case TypeName.fighting:
      return Image.asset('assets/pages/tags/tag_fight.png');
    case TypeName.fire:
      return Image.asset('assets/pages/tags/tag_fire.png');
    case TypeName.flying:
      return Image.asset('assets/pages/tags/tag_flying.png');
    case TypeName.ghost:
      return Image.asset('assets/pages/tags/tag_ghost.png');
    case TypeName.grass:
      return Image.asset('assets/pages/tags/tag_grass.png');
    case TypeName.ground:
      return Image.asset('assets/pages/tags/tag_ground.png');
    case TypeName.ice:
      return Image.asset('assets/pages/tags/tag_ice.png');
    case TypeName.normal:
      return Image.asset('assets/pages/tags/tag_normal.png');
    case TypeName.poison:
      return Image.asset('assets/pages/tags/tag_poison.png');
    case TypeName.psychic:
      return Image.asset('assets/pages/tags/tag_psychic.png');
    case TypeName.rock:
      return Image.asset('assets/pages/tags/tag_rock.png');
    case TypeName.steel:
      return Image.asset('assets/pages/tags/tag_steel.png');
    case TypeName.water:
      return Image.asset('assets/pages/tags/tag_water.png');
  }
}
