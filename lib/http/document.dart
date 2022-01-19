// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Document {
  Future<String> uploadImage(File file, String url) async {
    String fileName = file.path.split("/").last;
    var stream = http.ByteStream(Stream.castFrom(file.openRead()));
    var length = await file.length();
    var uri = Uri.parse(url);
    var request = http.MultipartRequest("POST", uri);
    var multipartFileSign =
        http.MultipartFile('file', stream, length, filename: fileName);
    request.files.add(multipartFileSign);
    var response = await request.send();
    // print(response.statusCode);
    // listen for response
    var returnData = "";
    await response.stream.transform(utf8.decoder).listen((value) {
      returnData = value;
    }).asFuture();
    return returnData;
  }
}
