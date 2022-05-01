import 'package:flutter/material.dart';
import 'package:haystack/haystack.dart';
//import 'package:haystack/haystack.dart';
import 'package:haystack_client/haystack_client.dart';

void main() async {
  HSkySparkClient hSSC = HSkySparkClient('http://192.168.1.18:8080/api/demo/', 'su', 'su');
  //await hSSC.open();
  runApp(MyApp(hSSC));
}

class MyApp extends StatelessWidget {
  late final HSkySparkClient hSSC;
  MyApp(this.hSSC);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Halo Vorrrlt',
      theme: ThemeData(
        // This is the theme of your application.

        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(hSSC, title: 'Halo Vorrrlt'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  late final HSkySparkClient hSSC;

  MyHomePage(this.hSSC, {Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState(hSSC);
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late final HSkySparkClient hSSC;

  _MyHomePageState(this.hSSC);

  void _incrementCounter()  async {
    HGrid hGrid = await hSSC.eval("readById(@p:demo:r:29f46b5c-60923dad)");
    for (dynamic i in hGrid){
      //for (var j in i) {
        print("этто $i");
      //}
    }
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Вы сказали 'Халоу Ворлд' раз:",
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        label: Text("Сказать 'Халоу Ворлд'"),
      ),
    );
  }
}

