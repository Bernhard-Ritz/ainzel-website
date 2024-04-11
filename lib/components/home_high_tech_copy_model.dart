import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'home_high_tech_copy_widget.dart' show HomeHighTechCopyWidget;
import 'package:flutter/material.dart';

class HomeHighTechCopyModel extends FlutterFlowModel<HomeHighTechCopyWidget> {
  ///  State fields for stateful widgets in this component.

  InstantTimer? instantTimer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
