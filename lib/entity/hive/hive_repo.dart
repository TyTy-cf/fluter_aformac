
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveRepo {

  static Future<Box> _openHiveBox(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) {
      Hive.init((await getApplicationDocumentsDirectory()).path);
    }
    return await Hive.openBox(boxName);
  }

  static void saveDataToBox(String boxName, String key, dynamic data) async {
    Future<Box> futureBox = _openHiveBox(boxName);
    futureBox.whenComplete(() {
      Box box = Hive.box(boxName);
      box.put(key, data);
    });
  }

  static dynamic getDataFromBox(String boxName, String key) async {
    Future<Box> futureBox = _openHiveBox(boxName);
    futureBox.whenComplete(() {
      Box box = Hive.box(boxName);
      return box.get(key);
    });
  }

}