import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:webspark_shortest_way/models/models.dart';
import 'package:webspark_shortest_way/repository/repository.dart';
import 'package:webspark_shortest_way/shortest_way.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const String saveURL = 'crypto_coins_box';

  await Hive.initFlutter();

  Hive.registerAdapter(SaveURLAdapter());

  final saveURLBox = await Hive.openBox<SaveURL>(saveURL);

  GetIt.I.registerLazySingleton<AbstractLocal>(
    () => SaveURlLocal(
      saveURLBox: saveURLBox,
    ),
  );

  final dio = Dio();

  GetIt.I.registerLazySingleton<AbstractApiServices>(
    () => ApiServices(
      dio: dio,
    ),
  );

  runApp(ShortestWay());
}
