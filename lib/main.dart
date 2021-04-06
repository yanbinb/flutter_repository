import 'package:data_transfer_code/count_container.dart';
import 'package:data_transfer_code/event_bus_page.dart';
import 'package:data_transfer_code/notification_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
  // 将debugPrint指定为同步打印数据
  // debugPrint = (String message, {int wrapWidth}) =>
  //     debugPrintSynchronously(message, wrapWidth: wrapWidth);
  // runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          body: TabBarView(physics: NeverScrollableScrollPhysics(), children: [
            CounterPage(),
            NotificationWidget(),
            FirstPage(),
          ]),
          bottomNavigationBar: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: "InheritedWidget",
              ),
              Tab(
                icon: Icon(Icons.rss_feed),
                text: "Notification",
              ),
              Tab(
                icon: Icon(Icons.perm_identity),
                text: "EventBus",
              ),
            ],
            unselectedLabelColor: Colors.blueGrey,
            labelColor: Colors.blue,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.red,
          ),
        ));
  }
}
