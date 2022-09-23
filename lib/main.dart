import 'dart:io';
import 'package:flutter/material.dart';

import 'package:task_list/views/ios/ios.app.dart';
import 'package:task_list/views/android/android.app.dart';



void main() {
  runApp(Platform.isIOS ? IosApp() : AndroidApp());
}


