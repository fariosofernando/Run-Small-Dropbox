import 'dart:io';

import 'package:run_small_dropbox/run_small_dropbox.dart';

void main(List<String> args) {
  uploadFile(UploadFiles('token', 'goUpTo'), File(''));
}
