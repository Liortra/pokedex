import 'dart:ui';

import 'package:pokemon/utils/constants.dart';

class AppColors{
  static const blue = Color(0xff2337f0);
  static const navy =  Color(0xff100f7c);
  static const cyan =  Color(0xff0ed6d6);
  static const bg = Color(0x0d2337f0);
  static const yellow =  Color(0xfff7d762);
  static const white =  Color(0xffffffff);
  static const purple =  Color(0xff7c20e5);
  static const grey =  Color(0xffa1a1a1);
  static const black =  Color(0xff282828);
  static const green =  Color(0xff78e587);
  static const red =  Color(0xffe56777);

  static Color pokemonColor(String type){
    switch (type) {
      case Constants.typeNormal:
        return const Color(0xFFbdbeb0);
      case Constants.typePoison:
        return const Color(0xFF995E98);
      case Constants.typePsychic:
        return const Color(0xFFE96EB0);
      case Constants.typeGrass:
        return const Color(0xFF9CD363);
      case Constants.typeGround:
        return const Color(0xFFE3C969);
      case Constants.typeIce:
        return const Color(0xFFAFF4FD);
      case Constants.typeFire:
        return const Color(0xFFE7614D);
      case Constants.typeRock:
        return const Color(0xFFCBBD7C);
      case Constants.typeDragon:
        return const Color(0xFF8475F7);
      case Constants.typeWater:
        return const Color(0xFF6DACF8);
      case Constants.typeBug:
        return const Color(0xFFC5D24A);
      case Constants.typeDark:
        return const Color(0xFF886958);
      case Constants.typeFighting:
        return const Color(0xFF9E5A4A);
      case Constants.typeGhost:
        return const Color(0xFF7774CF);
      case Constants.typeSteel:
        return const Color(0xFFC3C3D9);
      case Constants.typeFlying:
        return const Color(0xFF81A2F8);
      case Constants.typeFairy:
        return const Color(0xFFEEB0FA);
      default:
        return AppColors.black;
    }
  }
}