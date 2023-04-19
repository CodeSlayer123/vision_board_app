import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/modal_create_project/modal_create_project_widget.dart';
import '/components/user_card/user_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CommunityPageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  OrganizationsRecord? community;

  ///  State fields for stateful widgets in this page.

  // Model for userCard component.
  late UserCardModel userCardModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    userCardModel = createModel(context, () => UserCardModel());
  }

  void dispose() {
    userCardModel.dispose();
  }

  /// Additional helper methods are added here.

}
