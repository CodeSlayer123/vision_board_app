import '/components/vision_cards/vision_cards_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Test3Model extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Model for VisionCards component.
  late VisionCardsModel visionCardsModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    visionCardsModel = createModel(context, () => VisionCardsModel());
  }

  void dispose() {
    visionCardsModel.dispose();
  }

  /// Additional helper methods are added here.

}
