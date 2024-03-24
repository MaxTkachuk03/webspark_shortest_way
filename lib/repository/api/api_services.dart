// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:webspark_shortest_way/models/way_model.dart';
import 'package:webspark_shortest_way/repository/repository.dart';

class ApiServices extends AbstractApiServices {
  ApiServices({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<List<WayApi>> getApi(String url) async {
    dio.interceptors.add(
      PrettyDioLogger(
        request: false,
        responseBody: true,
        compact: true,
        maxWidth: 90,
      ),
    );
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final data = _fromJsonToList(response).toList();
      getField(data);
      return data;
    } else {
      throw Exception('Failed to load ');
    }
  }

  List<WayApi> _fromJsonToList(Response response) {
    //!
    final List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(
      response.data['data'],
    );
    //!
    // final List<Map<String, dynamic>> data = List.from(response.data['data']);

    return data.map((tasks) => WayApi.fromJson(tasks)).toList();
  }

  @override
  Future<void> getField(List<WayApi> url) async {
    List<String> modifiedDataList = [];
    List<String> characters = [];

    final data = url[0];
    final List<String> list = data.field;

    for (String str in list) {
      characters = str.split('');
      for (int i = 0; i < characters.length; i += 3) {
        modifiedDataList.add(characters.sublist(i, i + 3).join());
      }
      
    }
    // }

    print(modifiedDataList);
    print("------");
    print(characters[0]);
    print("------");

    //final dataRaw = data['data'] as Map<String, dynamic>;

    //  final coinData = dataRaw["field"] as Map<String, dynamic>;
  }

  // Future<void> spit(String url)async {
  //
  //  final wayList = await getApi(url);
  //  List<String> dataList = wayList['field'];

  //   // Split each string element into individual characters and group them into groups of three
  //
  // }
}
