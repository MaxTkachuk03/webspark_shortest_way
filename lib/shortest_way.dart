import 'package:flutter/material.dart';
import 'package:webspark_shortest_way/resources/colors.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:webspark_shortest_way/router/router.dart';
import 'generated/l10n.dart';

class ShortestWay extends StatelessWidget {
  ShortestWay({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.themeUpColor,
        ),
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: AppColors.appBarTextColor
          )
        ),
      ),
      routerConfig: _appRouter.config(),
    );
  }
}
