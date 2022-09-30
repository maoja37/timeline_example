import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Timeline.tileBuilder(
            shrinkWrap: true,
            cacheExtent: 0,
            physics: NeverScrollableScrollPhysics(),
            builder: TimelineTileBuilder.connected(    
              nodePositionBuilder: (context, index) => 0,
              indicatorPositionBuilder: (context, index) => 0,
              connectorBuilder: (context, index, type) => const SizedBox(
                height: 30,
                child: SolidLineConnector(
                  space: 10,
                  color: Colors.red,
                  thickness: 4,
                ),
              ),
              indicatorBuilder: (context, index) =>
                  SvgPicture.asset(getItems[index]),
              contentsBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text('stuff$index'),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              itemCount: 4,
            ),
          ),
        ),
      ),
    );
  }

  List<String> getItems = [
    'assets/images/card_order_received_blue.svg',
    'assets/images/card_processing_blue.svg',
    'assets/images/card_transit_blue.svg',
    'assets/images/card_ready_blue.svg'
  ];
}
