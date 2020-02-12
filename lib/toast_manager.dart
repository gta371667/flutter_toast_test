import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class ToastManager {
  static final _singleton = ToastManager._internal();

  static ToastManager getInstance() => _singleton;

  factory ToastManager() => _singleton;

  ToastManager._internal() {
    _overlayEntry = _buildOverlayEntry();
  }

  /// 鍵盤是否開啟
  /// true：開啟
  BehaviorSubject<bool> keyboardSubject = BehaviorSubject();

  Stream<bool> get keyboardStream => keyboardSubject.stream;

  /// toast widget
  OverlayEntry _overlayEntry;

  /// 顯示toast
  void showToast(BuildContext context) {
    if (_overlayEntry != null) {
      Overlay.of(context).insert(_overlayEntry);
    } else {
      print("showToast _overlayEntry null");
    }
  }

  /// 關閉toast
  void dismissToast() {
    _overlayEntry?.remove();
  }

  OverlayEntry _buildOverlayEntry() {
    return OverlayEntry(
      builder: (context) {
        return Container(
          alignment: Alignment.bottomRight,
          child: Wrap(
            children: <Widget>[
              StreamBuilder<bool>(
                initialData: false,
                stream: keyboardStream,
                builder: (context, snapshot) {
                  var isOpen = snapshot.data;
                  print("StreamBuilder $isOpen");

                  return AnimatedContainer(
                    duration: Duration(milliseconds: 2000),
                    height: isOpen ? 400 : 30,
                    child: Material(
                      color: Colors.blue,
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

  void dispose() {
    keyboardSubject.close();
  }
}
