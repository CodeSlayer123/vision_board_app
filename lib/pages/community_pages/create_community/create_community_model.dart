import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/drawer_nav/drawer_nav_widget.dart';
import '/components/empty_projects/empty_projects_widget.dart';
import '/components/modal_create_project/modal_create_project_widget.dart';
import '/components/modal_project/modal_project_widget.dart';
import '/components/user_card/user_card_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class CreateCommunityModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  String? inviteCode;

  DocumentReference? communityRef;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for drawerNav component.
  late DrawerNavModel drawerNavModel;
  // Model for WebNav component.
  late WebNavModel webNavModel1;
  // Model for userCard component.
  late UserCardModel userCardModel;
  // Model for WebNav component.
  late WebNavModel webNavModel2;
  // State field(s) for CommunityName widget.
  TextEditingController? communityNameController;
  String? Function(BuildContext, String?)? communityNameControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    drawerNavModel = createModel(context, () => DrawerNavModel());
    webNavModel1 = createModel(context, () => WebNavModel());
    userCardModel = createModel(context, () => UserCardModel());
    webNavModel2 = createModel(context, () => WebNavModel());
  }

  void dispose() {
    drawerNavModel.dispose();
    webNavModel1.dispose();
    userCardModel.dispose();
    webNavModel2.dispose();
    communityNameController?.dispose();
  }

  /// Additional helper methods are added here.

}
