import 'package:hive_flutter/hive_flutter.dart';

class LocalDatabaseManager{

  static Future<Box> openBox(String name) async{
    return await Hive.openBox(name);
  }

  static Future<Box> getBox(String name) async{
    if(await Hive.boxExists(name)) {
    return Hive.box(name);
    }else{
    return await Hive.openBox(name);
    }
  }

  static void dispose(){
    Hive.close();
  }
}