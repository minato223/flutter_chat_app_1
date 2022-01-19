// ignore_for_file: import_of_legacy_library_into_null_safe, avoid_print
import 'package:dart_mercure/dart_mercure.dart';

class MercureService {
  Event? event;
  MercureService({this.event});
  String lamine = "";
  Map<String, Function> eventCallBack = {
    "new-message": (Event event) {
      print(event.data);
    }
  };
  void broadCastEvent() {
    eventCallBack[event!.event];
  }

  List<String> topics() => eventCallBack.keys.toList();
}
