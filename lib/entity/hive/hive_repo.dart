
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveRepo {

  static Future<Box> _openHiveBox(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) {
      Hive.init((await getApplicationDocumentsDirectory()).path);
    }
    return await Hive.openBox(boxName);
  }

  // insert into boxName values (key, data)
  static void saveDataToBox(String boxName, String key, dynamic data) async {
    Future<Box> futureBox = _openHiveBox(boxName);
    futureBox.whenComplete(() {
      Box box = Hive.box(boxName);
      box.put(key, data);
    });
  }

  // select * from boxName where "id" = key
  static Future<Map<String, dynamic>> getDataFromBox(String boxName, String key) async {
    Box box = await _openHiveBox(boxName);
    return box.get(key);
  }

  // truncate table
  static void clearBox(String boxName) async {
    Box box = await _openHiveBox(boxName);
    box.clear();
  }

  // delete from boxName where "id" = key
  static void removeEntity(String boxName, String key) async {
    Box box = await _openHiveBox(boxName);
    box.delete(key);
  }

  // select * from boxName
  static Future<Map> getAllMap(String boxName) async {
    Box box = await _openHiveBox(boxName);
    return box.toMap();
  }

  // select * from boxName
  static Future<List> getAllToList(String boxName) async {
    Box box = await _openHiveBox(boxName);
    List returnedList = [];
    // map ensemble K, V
    // ici, on itère sur la map, et on ajoute toute les values dans une liste
    box.toMap().forEach((key, value) {
      returnedList.add(value);
    });
    // On renvoie cette liste
    return returnedList;
  }

}