import 'package:hive_flutter/hive_flutter.dart';
import 'package:webspark_shortest_way/models/models.dart';
import 'package:webspark_shortest_way/repository/repository.dart';

class SaveURlLocal extends AbstractLocal {
  SaveURlLocal({
    required this.saveURLBox,
  });

  final Box<SaveURL> saveURLBox;

  @override
  String getURL() {
    return saveURLBox.get(1)!.url;
  }

  @override
  Future<void> saveURL(String url) async {
    await saveURLBox.put(1, SaveURL(url: url));
  }
}
