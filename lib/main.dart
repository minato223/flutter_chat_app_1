// ignore_for_file: import_of_legacy_library_into_null_safe, avoid_print

import 'package:chat_app_1/components/wrapper.dart';
import 'package:chat_app_1/services/constant.dart';
import 'package:chat_app_1/services/mercure_services.dart';
import 'package:dart_mercure/dart_mercure.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // initializeMercure();
    super.initState();
  }

  // void getDocument() async {
  //   String url = Urls().baseUrl + Urls().documentUrl;
  //   print(url);
  //   final response = await http.get(url);

  //   var responseData = json.decode(response.body);

  //   print(responseData);
  // }

  void initializeMercure() {
    var token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJtZXJjdXJlIjp7InB1Ymxpc2giOlsiKiJdfX0.LDlvHo4eZSGmaM3OtpGFVuS_u_iYBZ0SEpJRL7uKK4c';
    print(Urls().mercureHub);
    print(MercureService().topics());
    var mercure = Mercure(token: token, hub_url: Urls().mercureHub);
    mercure.subscribeTopics(
        topics: MercureService().topics(),
        onData: (Event event) {
          print(event);
          MercureService(event: event).eventCallBack[event.event]?.call(event);
        });
  }

  @override
  Widget build(BuildContext context) {
    // MercureService().eventCallBack['new-message']?.call("mino");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: MediaQueryData.fromWindow(ui.window).platformBrightness,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const Wrapper(),
    );
  }
}
