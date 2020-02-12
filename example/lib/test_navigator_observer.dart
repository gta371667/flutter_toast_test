import 'package:flutter/material.dart';

class TestNavigatorObserver extends NavigatorObserver {
  static var tag = "TestNavigatorObserver";

  @override
  void didPush(Route route, Route previousRoute) {
    print("$tag didPush");
    super.didPush(route, previousRoute);
  }

  @override
  void didRemove(Route route, Route previousRoute) {
    print("$tag didRemove");
    super.didRemove(route, previousRoute);
  }

  @override
  void didReplace({Route newRoute, Route oldRoute}) {
    print("$tag didReplace");
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didStartUserGesture(Route route, Route previousRoute) {
    print("$tag didStartUserGesture");
    super.didStartUserGesture(route, previousRoute);
  }

  @override
  void didPop(Route route, Route previousRoute) {
    print("$tag didPop");
    super.didPop(route, previousRoute);
  }

  @override
  void didStopUserGesture() {
    print("$tag didStopUserGesture");
    super.didStopUserGesture();
  }
}
