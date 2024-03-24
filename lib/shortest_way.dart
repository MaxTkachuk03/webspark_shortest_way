import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:webspark_shortest_way/bloc/save_url/save_url_bloc.dart';
import 'package:webspark_shortest_way/repository/repository.dart';
import 'package:webspark_shortest_way/resources/colors.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:webspark_shortest_way/router/router.dart';
import 'generated/l10n.dart';

class ShortestWay extends StatelessWidget {
  ShortestWay({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SaveUrlBloc(GetIt.I<AbstractLocal>()),
        )
      ],
      child: MaterialApp.router(
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
              titleLarge: TextStyle(color: AppColors.appBarTextColor)),
        ),
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
