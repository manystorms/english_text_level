import '/flutter_flow/flutter_flow_util.dart';
import 'home_screen_widget.dart' show HomeScreenWidget;
import 'package:flutter/material.dart';

class HomeScreenModel extends FlutterFlowModel<HomeScreenWidget> {
  String targetEnglishLevel = 'normal';

  final unfocusNode = FocusNode();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator = (BuildContext context, String? value) {
    RegExp regex = RegExp(r'^[a-zA-Z0-9\s\.,!?]*$');

    if (value == null || value.isEmpty) {
      return '영어 지문을 입력하시오';
    }else if (!regex.hasMatch(value)) {
      return '영어, 숫자, 문장 부호만 입력 가능합니다';
    }else{
      return null;
    }
  };

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
