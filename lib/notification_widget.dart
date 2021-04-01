import 'package:flutter/material.dart';

class CustomNotification extends Notification {
  final String msg;
  CustomNotification(this.msg);
}

//抽离出一个子Widget用来发通知
class CustomChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      //Notification 类提供了 dispatch 方法，可以让我们沿着 context 对应的 Element 节点树向上逐层发送通知。
      onPressed: () => CustomNotification('hi').dispatch(context),
      child: Text('Fire Notification'),
    );
  }
}

class NotificationWidget extends StatefulWidget {
  NotificationWidget({Key key}) : super(key: key);

  @override
  _NotificationWidgetState createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  String _msg = "通知：";

  @override
  Widget build(BuildContext context) {
    //监听通知 泛型：监听CustomNotification
    return NotificationListener<CustomNotification>(
        onNotification: (notification) {
          setState(() {
            _msg += notification.msg + "  ";
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text(_msg), CustomChild()],
        ));
  }
}
