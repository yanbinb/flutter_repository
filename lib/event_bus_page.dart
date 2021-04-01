import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';

class CustomEvent {
  String msg;
  CustomEvent(this.msg);
}

//建立公共的event bus
EventBus eventBus = new EventBus();

class FirstPage extends StatefulWidget {
  FirstPage({Key key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String msg = "通知：";
  StreamSubscription subscription;

  @override
  void initState() {
    //监听CustomEvent事件，刷新UI
    subscription = eventBus.on<CustomEvent>().listen((event) {
      print(event);
      setState(() {
        msg += event.msg;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Text(msg),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => SecondPage())),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: RaisedButton(
          child: Text('Fire Event'),
          // 触发CustomEvent事件
          onPressed: () => eventBus.fire(CustomEvent("hello"))),
    );
  }
}
