import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:http_parser/http_parser.dart' as http_parser;

import 'connectors/parts/urs_part.dart';
import 'connectors/parts/auth_part.dart';

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

/// Use para obter um novo token quando o em uso for a expirar.
///
Future<Response> refreshToken({required refreshToken, required appKey, required secretKey}) async {
  Future<Response> response = post(Uri.parse(Auth(refreshToken: refreshToken, appKey: appKey, secretKey: secretKey).refresh));
  return await response.then((responseReceived) => responseReceived);
}

Future<Response> uploadFile(String token, String goUpTo, File dataFile) async {
  // MultipartRequest request = MultipartRequest('POST', EndPoints.uploadFile);

  // final file = File('/my/binary/file');
  Uint8List data = await dataFile.readAsBytes();

  Map<String, String> headers = {
    'Authorization': 'Bearer $token',
    'Content-type': 'application/octet-stream',
    'Dropbox-API-Arg': '{"path": $goUpTo, "mode": "overwrite"}',
  };

  final response = http.post(EndPoints.uploadFile, body: data, headers: headers);

  return response;
}
