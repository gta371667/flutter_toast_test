import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:mx_toast/keyboard_observer.dart';
import 'package:mx_toast_example/page1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(KeyboardObserver());
  }

  @override
  Widget build(BuildContext context) {
    /// remove inset overlay 閃閃
    /// 抓鍵盤外框高度 animated

    return BotToastInit(
      child: MaterialApp(
        navigatorObservers: [
          BotToastNavigatorObserver(),
//          TestNavigatorObserver(),
        ],
        home: Page1(),
      ),
    );
  }
}
