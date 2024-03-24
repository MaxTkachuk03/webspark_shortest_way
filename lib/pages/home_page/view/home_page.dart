import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:webspark_shortest_way/bloc/save_url/save_url_bloc.dart';
import 'package:webspark_shortest_way/generated/l10n.dart';
import 'package:webspark_shortest_way/repository/repository.dart';
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
  final urlBloc = SaveUrlBloc(GetIt.I<AbstractLocal>());
  final TextEditingController _urlController = TextEditingController();

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
      body: BlocBuilder<SaveUrlBloc, SaveUrlState>(
        builder: (context, state) {
          return Column(
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
                    child: TextFormField(
                      controller: _urlController,
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
                  if (_urlController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(S.of(context).enter)));
                  } else if (!RegExp('https:/').hasMatch(_urlController.text) ||
                      !RegExp('https:/').hasMatch(_urlController.text)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(S.of(context).invalid)));
                  } else {
                    context
                        .read<SaveUrlBloc>()
                        .add(SaveUrlEvent(url: _urlController.text));
                    print(_urlController.text);
                   GetIt.I<AbstractApiServices>().getApi(_urlController.text);
                   //GetIt.I<AbstractApiServices>().getField(_urlController.text);
                    AutoRouter.of(context).push(const ProcessRoute());
                  }
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
            ],
          );
        },
      ),
    );
  }
}
