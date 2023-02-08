import 'package:run_small_dropbox/connectors/endpointsv2_model.dart';
import 'package:run_small_dropbox/run_small_dropbox.dart';

Map curl = {
  "access_token": "sl.BUfESB3HQ4lpolmiICUMl761DVwSQZcOTMY4wnXY54vrmWo62mPu7POfCAdXgsY3AcbfR1Cbt2Dvl7S8-D2s07dPR089Od53xYqMwD1K-FXMsJXl5auYHEhSTVqnMKvf-zw1qXCkh3K0",
  "token_type": "bearer",
  "expires_in": 14399,
  "refresh_token": "TenrKjFrp5YAAAAAAAAAAXLK9AUrFXkzUWwyWMcM2xK_k-HxM-zDmsaes9uT69TW",
  "scope": "account_info.read account_info.write contacts.read contacts.write file_requests.read file_requests.write files.content.read files.content.write files.metadata.read files.metadata.write sharing.read sharing.write",
  "uid": "4312204624",
  "account_id": "dbid:AABa6H_ISexxsewvr_y6l6TGivyXuBQtXQ4",
};

Map apiconsole = {'appKey': '3m8h0lj7z5cy44h', 'appSecret': 'cwa2mwuq7e395nv', 'refresh_token': curl['refresh_token']};

class Authentication {
  static String appKey = apiconsole['appKey'];
  static String appSecret = apiconsole['appSecret'];
  static String refreshToken = apiconsole['refresh_token'];
}

Future<void> main() async {
  var _response = await refreshToken(refreshToken: Authentication.refreshToken, appKey: Authentication.appKey, secretKey: Authentication.appSecret);
  print(_response.body);
}
