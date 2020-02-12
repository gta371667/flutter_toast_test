import 'package:flutter/material.dart';
import 'package:mx_toast/toast_manager.dart';
import 'package:mx_toast_example/page2.dart';
import 'package:rxdart/rxdart.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  OverlayEntry _overlayEntry;

  BehaviorSubject<bool> ob1 = BehaviorSubject();

  Stream<bool> get obStream => ob1.stream;

  @override
  void initState() {
    super.initState();
    _overlayEntry = _buildBottom();

    ToastManager.getInstance().keyboardStream.listen((isOpen) {
      if (isOpen) {
        _overlayEntry?.remove();
        _overlayEntry = _buildCenter();
        Overlay.of(context).insert(_overlayEntry);
      } else {
        _overlayEntry?.remove();
        _overlayEntry = _buildCenter();
        Overlay.of(context).insert(_overlayEntry);
      }
    });
  }

  OverlayEntry _buildBottom() {
    return OverlayEntry(
      builder: (context) {
        return Container(
          alignment: Alignment.bottomCenter,
          child: Wrap(
            children: <Widget>[
              Material(
                color: Colors.red,
                child: Container(
                  height: 30,
                  child: Text("aaaaa"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  OverlayEntry _buildCenter() {
    return OverlayEntry(
      builder: (context) {
        return Container(
          alignment: Alignment.bottomCenter,
          child: Wrap(
            children: <Widget>[
              Material(
                color: Colors.red,
                child: Container(
                  height: 300,
                  child: Text("aaaaa"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    ob1.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: const Text('Page1'),
      ),
      body: Column(
        children: <Widget>[
          Wrap(
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Text("關鍵盤"),
              ),
              FlatButton(
                onPressed: () {
                  Overlay.of(context).insert(_overlayEntry);

//                  ToastManager.getInstance().showToast(context);
                },
                child: Text("no builder"),
              ),
              Builder(
                builder: (context) {
                  return FlatButton(
                    onPressed: () {
//                      showDialog(
//                        context: context,
//                        builder: (context) {
//                          return Material(
//                            child: Text("asdasd"),
//                          );
//                        },
//                      );

//                      Overlay.of(context).insert(_overlayEntry);

                    //使用Overlay依然會被鍵盤遮擋
                      //若須使用需要在鍵盤彈出十，調整浮出視窗位置
                      //因此與botToast功能重複

                      ToastManager.getInstance().showToast(context);

//                      BotToast.showText(text: "asdjalsjdlasd");
                    },
                    child: Text("show"),
                  );
                },
              ),
              FlatButton(
                onPressed: () {
//                  _overlayEntry?.remove();
                  ToastManager.getInstance().dismissToast();
//                  BotToast.showText(text: "asdasdsad");
                },
                child: Text("close"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Page2(),
                    ),
                  );
                },
                child: Text("pushPage2"),
              ),
            ],
          ),
          TextField(),
        ],
      ),
    );
  }

  OverlayEntry buildOverlayEntry() {
    return OverlayEntry(
      builder: (context) {
        return Container(
          alignment: Alignment.bottomCenter,
          child: Wrap(
            children: <Widget>[
              StreamBuilder<bool>(
                initialData: false,
                stream: obStream,
                builder: (context, snapshot) {
                  var isOpen = snapshot.data;
                  print("StreamBuilder $isOpen");

                  return AnimatedContainer(
                    duration: Duration(milliseconds: 100),
                    height: isOpen ? 400 : 30,
                    child: Material(
                      color: Colors.red,
                      child: Container(
                        height: 30,
                        child: Text("aaaaa"),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
