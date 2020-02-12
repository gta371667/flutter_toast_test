import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: const Text('Page2'),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
