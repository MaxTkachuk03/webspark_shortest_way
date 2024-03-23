import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:webspark_shortest_way/generated/l10n.dart';
import 'package:webspark_shortest_way/pages/pages.dart';
import 'package:webspark_shortest_way/resources/resources.dart';
import 'package:webspark_shortest_way/router/router.dart';
import 'package:webspark_shortest_way/widgets/widgets.dart';

@RoutePage()
class ProcessPage extends StatefulWidget {
  const ProcessPage({super.key});

  @override
  State<ProcessPage> createState() => _ProcessPageState();
}

class _ProcessPageState extends State<ProcessPage> {
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
          S.of(context).processScreen,
          style: theme.textTheme.titleLarge,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Text(
            S.of(context).calculation,
            textAlign: TextAlign.center,
          ),
          Text(
            "100%",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16.0),
          ),
          const Spacer(),
          AppButton(
            text: S.of(context).send,
            onPressed: () {
              AutoRouter.of(context).push(const ResultListRoute());
            },
          ),
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
