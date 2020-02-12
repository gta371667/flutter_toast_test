# flutter_toast_test

A new Flutter plugin.

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

## 測試是否能使用overlay達到不被鍵盤遮擋的toast
### 結果：
1. 使用overlay依然會被鍵盤遮擋
2. 使用overlay remove後，馬上調用new overlay再inser，不會有閃爍情況
3. overlay顯示後，可以使用Animated來控制overlay的Widget元件
