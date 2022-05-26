import 'package:flutter/widgets.dart';

Color pokemonColor(String colorName, bool isLightrightness) {
  switch (colorName) {
    case 'blue':
      return isLightrightness
          ? const Color(0xFF4C86F3)
          : const Color(0xFF5892FF);
    case 'brown':
      return isLightrightness
          ? const Color(0xFFA8702C)
          : const Color(0xFFB47C38);
    case 'gray':
      return isLightrightness
          ? const Color(0xFFA0A0A0)
          : const Color(0xFFACACAC);
    case 'green':
      return isLightrightness
          ? const Color(0xFF5EB963)
          : const Color(0xFF6AC56F);
    case 'pink':
      return isLightrightness
          ? const Color(0xFFEC8ECA)
          : const Color(0xFFF89AD6);
    case 'purple':
      return isLightrightness
          ? const Color(0xFFA166C2)
          : const Color(0xFFAD72CE);
    case 'red':
      return isLightrightness
          ? const Color(0xFFE15669)
          : const Color(0xFFED6275);
    case 'white':
      return isLightrightness
          ? const Color(0xFFF0F0F0)
          : const Color(0xFFF7F7F7);
    case 'yellow':
      return isLightrightness
          ? const Color(0xFFEAD13C)
          : const Color(0xFFF6DD48);
    default:
      return isLightrightness
          ? const Color(0xFF585858)
          : const Color(0xFF626262);
  }
}
