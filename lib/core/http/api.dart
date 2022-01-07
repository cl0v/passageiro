import 'package:flutter/foundation.dart';

const String DEV_BASE_URL_V2 = 'apiv2.dev.buzzao.com.br'; // Add /api em todos os endpoints
const String API_BASE_URL_V2 = 'apiv2.buzzao.com.br'; // Add /api em todos os endpoints
const String DEV_BASE_URL = 'api.dev.buzzao.com.br';
const String API_BASE_URL = 'api.buzzao.com.br';

String get api => kDebugMode ? DEV_BASE_URL : API_BASE_URL;
String get apiV2 => kDebugMode ? DEV_BASE_URL_V2 : API_BASE_URL_V2;
