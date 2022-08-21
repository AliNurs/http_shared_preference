import 'package:flutter/material.dart';
import 'package:shared_preference/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late final SharedPreferences prefs;
  late List<String> myData = [];

  void initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    myData = prefs.getStringList('Key') ?? [''];

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
      appBar: AppBar(),
      body: Center(
        child: ListView.separated(
            padding: const EdgeInsets.all(18),
            itemBuilder: (context, index) => Dismissible(
                  key: ValueKey(myData[index]),
                  onDismissed: (_) {
                    setState(() {
                      print(myData.removeAt(index));
                    });

                    prefs.setStringList('Key', myData);
                  },
                  child: Text(
                    myData[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 25,
                    ),
                  ),
                ),
            separatorBuilder: (context, index) => const Divider(
                  color: Colors.black,
                  thickness: 3,
                ),
            itemCount: myData.length),
      ),
    );
  }
}
