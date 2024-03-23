import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:webspark_shortest_way/generated/l10n.dart';
import 'package:webspark_shortest_way/resources/resources.dart';

@RoutePage()
class PreviewPage extends StatefulWidget {
  const PreviewPage({super.key});

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
    final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final height = MediaQuery.of(context).size.height;
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        //   GridView.builder(
        //     shrinkWrap: true,
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 3, // Кількість стовпців у сітці
        //   ),
        //   itemCount: colors.length,
        //   itemBuilder: (BuildContext context, int index) {
        //     return Container(
        //       decoration: BoxDecoration(
        //         border: Border.all(color: colors[index], width: 2), // Сірий бордер
        //       ),
        //       child: Center(
        //         child: Text(
        //           'Item ${index + 1}',
        //           style: TextStyle(fontSize: 20, color: Colors.white),
        //         ),
        //       ),
              
        //       margin: EdgeInsets.all(4),
        //     );
        //   },
        // ),
      
          Container(
            decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColors.underlineColor, width: 1.5), // Додаємо рамку
                  ),
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3, // Кількість стовпців у сітці
              children: List.generate(12, (index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: AppColors.blockedBox, width: 1), // Додаємо рамку
                  ),
                  child: Center(
                    child: Text(
                      'Item $index',
                      
                    ),
                  ),
                );
              }),
            ),
          ),
          Text("0000"),
          //const Spacer(),
        ],
      ),

      // GridView.builder(
      //     gridDelegate:
      //         SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      //     itemBuilder: (context, index) {
      //       return Center(
      //         child: Text(
      //           "ggg",
      //         ),
      //       );
      //     }),
    );
  }
}
