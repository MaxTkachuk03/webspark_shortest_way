import 'package:webspark_shortest_way/models/models.dart';

abstract class AbstractLocal {
  String getURL();
  Future<void> saveURL(String url);
}
