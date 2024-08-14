import '/flutter_flow/flutter_flow_util.dart';
import 'result_screen_widget.dart' show ResultScreenWidget;
import 'package:flutter/material.dart';
import 'package:english/get_api.dart';

class ResultScreenModel extends FlutterFlowModel<ResultScreenWidget> with ChangeNotifier{
  final unfocusNode = FocusNode();
  List<dynamic> easyEnglishTextData = [
    {'word': '영어 지문을 쉽게 만들고 있습니다', 'textColor': '#000000', 'highlightColor': '#FFFFFF'}
  ];

  Future<void> getEasyEnglishText(String englishText, String targetEnglishLevel) async{
    try{
      easyEnglishTextData = await getApi(englishText, targetEnglishLevel);
    }catch(error) {
      easyEnglishTextData = [
        {'word': error.toString(), 'textColor': '#000000', 'highlightColor': '#FFFFFF'}
      ];
    }
    notifyListeners();
  }


  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
