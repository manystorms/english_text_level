import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'result_screen_model.dart';
export 'result_screen_model.dart';

class ResultScreenWidget extends StatefulWidget {
  final String englishText;
  final String targetEnglishLexel;

  ResultScreenWidget({required this.englishText, required this.targetEnglishLexel});

  @override
  State<ResultScreenWidget> createState() => _ResultScreenWidgetState();
}

class _ResultScreenWidgetState extends State<ResultScreenWidget>
    with TickerProviderStateMixin {
  late ResultScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResultScreenModel());

    _model.getEasyEnglishText(widget.englishText, widget.targetEnglishLexel);

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 100.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            begin: const Offset(0.0, 170.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                        child: Text(
                          '영어 지문 난이도 조절',
                          style: FlutterFlowTheme.of(context)
                              .displaySmall
                              .override(
                                fontFamily: 'Outfit',
                                letterSpacing: 0.0,
                              ),
                        ),
                      ),
                      Divider(
                        height: 32.0,
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).alternate,
                      ),
                      ChangeNotifierProvider<ResultScreenModel>.value(
                        value: _model,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              24.0, 4.0, 24.0, 12.0),
                          child: Consumer<ResultScreenModel>(
                            builder: (context, model, child) {
                              return RichText(
                                text: TextSpan(
                                  children: _model.easyEnglishTextData.map((item) {
                                    return TextSpan(
                                      text: item['word'],
                                      style: TextStyle(
                                        color: Color(int.parse('0xFF' + item['textColor'].substring(1))),
                                        backgroundColor: Color(int.parse('0xFF' + item['highlightColor'].substring(1))),
                                        fontSize: 20,
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ).animateOnPageLoad(
                                  animationsMap['textOnPageLoadAnimation']!);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                const EdgeInsetsDirectional.fromSTEB(12.0, 24.0, 12.0, 12.0),
                child: FFButtonWidget(
                  onPressed: () {
                    context.safePop();
                  },
                  text: '돌아가기',
                  icon: const Icon(
                    Icons.receipt_long,
                    size: 15.0,
                  ),
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 54.0,
                    padding: const EdgeInsets.all(0.0),
                    iconPadding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle:
                    FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Readex Pro',
                      color: Colors.white,
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                    ),
                    elevation: 4.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
