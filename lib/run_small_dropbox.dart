import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:path/path.dart' as path;
import 'package:http_parser/http_parser.dart' as http_parser;

import 'models/endpoints_model.dart';
import 'models/endpointsv2_model.dart';

Future<Response> getTemporaryFileLink(Map<String, String>? headers, Object? body) async {
  Future<Response> response = post((EndPoints.getTemporaryFileLink), headers: headers, body: jsonEncode(body));
  return await response.then((responseReceived) => responseReceived);
}

Future<Response> createFolder(Map<String, String>? headers, Object? body) async {
  Future<Response> response = post((EndPoints.createFolder), headers: headers, body: jsonEncode(body));
  return await response.then((responseReceived) => responseReceived);
}

Future<Response> moveFile(Map<String, String>? headers, Object? body) async {
  Future<Response> response = post((EndPoints.moveFile), headers: headers, body: jsonEncode(body));
  return await response.then((responseReceived) => responseReceived);
}

Future<Response> copyFile(Map<String, String>? headers, Object? body) async {
  Future<Response> response = post((EndPoints.copyFile), headers: headers, body: jsonEncode(body));
  return await response.then((responseReceived) => responseReceived);
}

Future<Response> deleteFile(Map<String, String>? headers, Object? body) async {
  Future<Response> response = post((EndPoints.deleteFile), headers: headers, body: jsonEncode(body));
  return await response.then((responseReceived) => responseReceived);
}

Future<Response> refreshToken({required refreshToken, required appKey, required secretKey}) async {
  Future<Response> response = post(Uri.parse(Auth(refreshToken: refreshToken, appKey: appKey, secretKey: secretKey).refresh));
  return await response.then((responseReceived) => responseReceived);
}

Future<Response> uploadFile(String token, String goUpTo, List<File> invoiceFiles) async {
  MultipartRequest request = MultipartRequest('POST', EndPoints.uploadFile);

  request.headers['Authorization'] = token;
  request.headers['Dropbox-API-Arg'] = '{"autorename": false,"mode": "add","mute":false,"path": $goUpTo, "strict_conflict": false}';
  request.headers[HttpHeaders.acceptHeader] = 'application/json';

  request.files.addAll(
    invoiceFiles.map(
      (file) {
        return MultipartFile.fromBytes(
          '--data-binary',
          file.readAsBytesSync(),
          filename: path.basename(file.path),
          contentType: http_parser.MediaType('image', path.extension(file.path)),
        );
      },
    ),
  );

  StreamedResponse streamedResponse = await request.send();
  Future<Response> response = Response.fromStream(streamedResponse);
  return await response;
}
