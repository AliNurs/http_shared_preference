import 'package:flutter/material.dart';

import 'package:shared_preference/second_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final SharedPreferences prefs;
  late List<String> dataFromPrefs;
  TextEditingController controller = TextEditingController();

  void initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    dataFromPrefs = prefs.getStringList('Key') ?? [' '];
    if (dataFromPrefs.isNotEmpty) {
      controller.text = dataFromPrefs.first;
    }

    setState(() {});
  }

  @override
  void initState() {
    initPrefs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Preferences'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SecondPage()));
              },
              icon: const Icon(Icons.navigate_next_outlined))
        ],
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 4, color: Colors.indigo),
              ),
            ),
          ),
        ),
        Text(
          controller.text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          dataFromPrefs = [controller.text, ...dataFromPrefs];
          await prefs.setStringList('Key', dataFromPrefs);
          setState(() {});
          print(dataFromPrefs);
        },
        child: const Icon(Icons.save_as_outlined),
      ),
    );
  }
}
