import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:webspark_shortest_way/generated/l10n.dart';
import 'package:webspark_shortest_way/resources/resources.dart';
import 'package:webspark_shortest_way/router/router.dart';
import 'package:webspark_shortest_way/widgets/widgets.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });
  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        //backgroundColor: theme.appBarTheme.backgroundColor,
        title: Text(
          S.of(context).homeScreen,
          style: theme.textTheme.titleLarge,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(S.of(context).validURL),
          Row(
            children: [
              const Icon(Icons.compare_arrows_outlined,
                  color: AppColors.underlineColor),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.url,
                  style: const TextStyle(fontSize: 15.0),
                  cursorWidth: 1.0,
                  decoration: const InputDecoration(
                    focusColor: AppColors.underlineColor,
                    fillColor: AppColors.underlineColor,
                    hoverColor: AppColors.underlineColor,
                    border: UnderlineInputBorder(),
                  ),
                ),
              )
            ],
          ),
          const Spacer(),
          AppButton(
            text: S.of(context).count,
            onPressed: () {
              AutoRouter.of(context).push(const ProcessRoute());
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
