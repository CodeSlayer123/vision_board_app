import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/drawer_nav/drawer_nav_widget.dart';
import '/components/user_card/user_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyVisionsModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  int? completedVisions = 0;

  ///  State fields for stateful widgets in this page.

  // Model for drawerNav component.
  late DrawerNavModel drawerNavModel;
  // Model for userCard component.
  late UserCardModel userCardModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    drawerNavModel = createModel(context, () => DrawerNavModel());
    userCardModel = createModel(context, () => UserCardModel());
  }

  void dispose() {
    drawerNavModel.dispose();
    userCardModel.dispose();
  }

  /// Additional helper methods are added here.

}
