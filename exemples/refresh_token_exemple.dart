// Para fazer o refresh do token, tenha os dados de acesso de sua conta antes.
//
// Algo como:
// Map apiconsole = {
//   "access_token": "", --> importante
//   "token_type": "",
//   "expires_in": 14399,
//   "refresh_token": "", --> importante
//   "scope": "",
//   "uid": "",
//   "account_id": "",
//   'appKey': "",  --> importante
//   'appSecret': "",  --> importante
// };
//
// No caso de privacidade, armazenei meus dados no .playground/console.dart.

import 'package:run_small_dropbox/run_small_dropbox.dart';
import '../.playground/console.dart'; // Dentro deste modelo, contém o Mapa identico ao apiconsole mostrado acima.

// Criando uma class para mapear os dados da `console`.
class Authentication {
  static String appKey = apiconsole['appKey'];
  static String appSecret = apiconsole['appSecret'];
  static String refreshToken = apiconsole['refresh_token'];
}

Future<void> main() async {
  var response = await refreshToken(refreshToken: Authentication.refreshToken, appKey: Authentication.appKey, secretKey: Authentication.appSecret);
  print(response.body);
}
