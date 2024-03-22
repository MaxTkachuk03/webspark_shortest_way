import 'package:flutter/material.dart';
import 'package:webspark_shortest_way/generated/l10n.dart';

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(S.of(context).homeScreen),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(S.of(context).validURL),
            Row(
              children: [
                const Icon(Icons.compare_arrows_outlined, color: Colors.grey),
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
                      focusColor: Colors.grey,
                      border: UnderlineInputBorder(),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
