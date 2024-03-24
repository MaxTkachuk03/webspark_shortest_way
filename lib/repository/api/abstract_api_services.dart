import 'package:webspark_shortest_way/models/models.dart';

abstract class AbstractApiServices{
  Future<List<WayApi>> getApi(String url);
  Future<void> getField(List<WayApi> url);
}