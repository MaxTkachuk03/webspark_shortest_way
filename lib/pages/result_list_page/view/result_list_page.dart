import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:webspark_shortest_way/generated/l10n.dart';
import 'package:webspark_shortest_way/resources/resources.dart';
import 'package:webspark_shortest_way/router/router.dart';

@RoutePage()
class ResultListPage extends StatefulWidget {
  const ResultListPage({super.key});

  @override
  State<ResultListPage> createState() => _ResultListPageState();
}

class _ResultListPageState extends State<ResultListPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.appBarTextColor,
            ),
            onPressed: () {
              AutoRouter.of(context).back();
            },
          ),
          backgroundColor: theme.appBarTheme.backgroundColor,
          title: Text(
            S.of(context).resultScreen,
            style: theme.textTheme.titleLarge,
          ),
        ),
        body: ListView.separated(
          itemCount: 20,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              height: 20.0,
              color: AppColors.underlineColor,
            );
          },
          itemBuilder: (context, index) {
            return Center(
                child: TextButton(
              onPressed: () {
                AutoRouter.of(context).push(const PreviewRoute());
              },
              child: Text(
                "ggg",
              ),
            ));
          },
        ));
  }
}
