import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'language_picker_model.dart';
export 'language_picker_model.dart';

class LanguagePickerWidget extends StatefulWidget {
  const LanguagePickerWidget({super.key});

  @override
  State<LanguagePickerWidget> createState() => _LanguagePickerWidgetState();
}

class _LanguagePickerWidgetState extends State<LanguagePickerWidget> {
  late LanguagePickerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LanguagePickerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(12.0, 18.0, 12.0, 12.0),
      child: Material(
        color: Colors.transparent,
        elevation: 3.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16.0),
            bottomRight: Radius.circular(16.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Container(
          width: 220.0,
          height: 40.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(16.0),
              bottomRight: Radius.circular(16.0),
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('LANGUAGE_PICKER_Image_plin1bj0_ON_TAP');
                    logFirebaseEvent('Image_set_app_language');
                    setAppLanguage(context, 'en');
                    logFirebaseEvent('Image_update_app_state');
                    FFAppState().update(() {
                      FFAppState().activeLanguage = 'EN';
                    });
                    logFirebaseEvent('Image_close_dialog,_drawer,_etc');
                    Navigator.pop(context);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Image.asset(
                      'assets/images/ENflag.png',
                      width: 30.0,
                      height: 20.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('LANGUAGE_PICKER_Image_mydkg730_ON_TAP');
                    logFirebaseEvent('Image_set_app_language');
                    setAppLanguage(context, 'de');
                    logFirebaseEvent('Image_update_app_state');
                    FFAppState().update(() {
                      FFAppState().activeLanguage = 'DE';
                    });
                    logFirebaseEvent('Image_close_dialog,_drawer,_etc');
                    Navigator.pop(context);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Image.asset(
                      'assets/images/DEflag.png',
                      width: 30.0,
                      height: 20.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('LANGUAGE_PICKER_Image_t11jt3t4_ON_TAP');
                    logFirebaseEvent('Image_set_app_language');
                    setAppLanguage(context, 'fr');
                    logFirebaseEvent('Image_update_app_state');
                    FFAppState().update(() {
                      FFAppState().activeLanguage = 'FR';
                    });
                    logFirebaseEvent('Image_close_dialog,_drawer,_etc');
                    Navigator.pop(context);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Image.asset(
                      'assets/images/FRflag.png',
                      width: 30.0,
                      height: 20.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent('LANGUAGE_PICKER_Image_xoq6bgb8_ON_TAP');
                    logFirebaseEvent('Image_set_app_language');
                    setAppLanguage(context, 'es');
                    logFirebaseEvent('Image_update_app_state');
                    FFAppState().update(() {
                      FFAppState().activeLanguage = 'ES';
                    });
                    logFirebaseEvent('Image_close_dialog,_drawer,_etc');
                    Navigator.pop(context);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Image.asset(
                      'assets/images/ESflag.png',
                      width: 30.0,
                      height: 20.0,
                      fit: BoxFit.cover,
                    ),
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
