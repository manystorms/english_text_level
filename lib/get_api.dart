import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<List<dynamic>> getApi(final String englishText, final String targetEnglishLevel) async {
  const serverUrl = 'http://192.168.1.111:8080/echo?message=';
  const serverUrl2 = '&level=';
  final String englishTextEncodedQuery = Uri.encodeComponent(englishText);
  final String targetElglishLevelEncodedQuery = Uri.encodeComponent(targetEnglishLevel);

  try {
    print(Uri.parse(serverUrl+englishTextEncodedQuery+serverUrl2+targetElglishLevelEncodedQuery));
    final response = await http.get(Uri.parse(serverUrl+englishTextEncodedQuery+serverUrl2+targetElglishLevelEncodedQuery))
        .timeout(const Duration(seconds: 10));
    print(json.decode(response.body));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw '서버와의 연결 오류가 발생했습니다';
    }
  } on TimeoutException catch(e) {
    throw '서버의 응답이 없습니다';
  } catch (e) {
    print(e);
    throw '에러 발생\n에러 메시지: $e';
  }


  /*const String jsonData = '''
  [
    {"word": "Flutter", "textColor": "#000000", "highlightColor": "#FFD700"},
    {"word": "는", "textColor": "#000000", "highlightColor": "#FFFFFF"},
    {"word": " ", "textColor": "#000000", "highlightColor": "#FFFFFF"},
    {"word": "재미있습니다", "textColor": "#000000", "highlightColor": "#87CEEB"},
    {"word": ".", "textColor": "#000000", "highlightColor": "#FFFFFF"}
  ]
  ''';

  return json.decode(jsonData);*/
}