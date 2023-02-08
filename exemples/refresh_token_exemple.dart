/// Para fazer o refresh do token, tenha os dados de acesso antes.
///
import 'package:run_small_dropbox/run_small_dropbox.dart';

// Este é um modulo a parte onde contém minhas credenicas de acesso.
// Algo como:
/*
Map apiconsole = {
  "access_token": "",
  "token_type": "",
  "expires_in": 14399,
  "refresh_token": "",
  "scope": "",
  "uid": "",
  "account_id": "",
  'appKey': "",
  'appSecret': "",
};

*/
import '../.playground/console.dart';

// Crio aqui uma class para mapear os dados do `console`.
class Authentication {
  static String appKey = apiconsole['appKey'];
  static String appSecret = apiconsole['appSecret'];
  static String refreshToken = apiconsole['refresh_token'];
}

Future<void> main() async {
  // Consumindo o `Authentication`.
  var response = await refreshToken(refreshToken: Authentication.refreshToken, appKey: Authentication.appKey, secretKey: Authentication.appSecret);
  print(response.body);
}
