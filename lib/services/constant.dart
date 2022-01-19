import 'package:flutter/widgets.dart';

class MyColors {
  Color greyColor = const Color(0xff8d9095);
  Color searchBarColor = const Color(0xffebebec);
  Color navBorderColor = const Color(0xffebebec);
  Color activeColor = const Color(0xff38ca70);
  Color messageBoxBackGroundColor = const Color(0xfff7f6f9);
}

class Env {
  // String baseUrl = "https://10.0.2.2:8000/api";
  String host = "192.168.2.8";
  // String host = "10.0.2.2";
}

class Urls {
  //String host = "192.168.2.8";
  String mercureHub = 'http://${Env().host}:3000/.well-known/mercure';
  String baseUrl = "http://${Env().host}:8000/api";
  String documentUrl = "/documents";
}
