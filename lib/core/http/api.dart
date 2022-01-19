import 'package:flutter/foundation.dart';

String get api => kDebugMode ? devBaseUrl : apiBaseUrl;
String get apiV2 => kDebugMode ? devBaseUrlV2 : apiBaseUrlV2;

const String devBaseUrl = 'http://api.dev.buzzao.com.br';
const String apiBaseUrl = 'http://api.buzzao.com.br';

const String devBaseUrlV2 = 'http://apiv2.dev.buzzao.com.br'; // Add /api em todos os endpoints
const String apiBaseUrlV2 = 'http://apiv2.buzzao.com.br'; // Add /api em todos os endpoints

