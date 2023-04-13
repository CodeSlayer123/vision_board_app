import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/empty_members/empty_members_widget.dart';
import '/components/modal_task_create_2/modal_task_create2_widget.dart';
import '/components/modal_user_profile/modal_user_profile_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class ModalCreateProjectModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for projectName widget.
  TextEditingController? projectNameController;
  String? Function(BuildContext, String?)? projectNameControllerValidator;
  String? _projectNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'zzv8enkj' /* Please enter a project name. */,
      );
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for description widget.
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;
  String? _descriptionControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'e68qg04m' /* Please enter a short descripti... */,
      );
    }

    return null;
  }

  // State field(s) for searchField widget.
  TextEditingController? searchFieldController;
  String? Function(BuildContext, String?)? searchFieldControllerValidator;
  List<UsersRecord> simpleSearchResults = [];
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ActivityRecord? newActivity;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ActivityRecord? newActivity2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ProjectsRecord? createdProject;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    projectNameControllerValidator = _projectNameControllerValidator;
    descriptionControllerValidator = _descriptionControllerValidator;
  }

  void dispose() {
    projectNameController?.dispose();
    descriptionController?.dispose();
    searchFieldController?.dispose();
  }

  /// Additional helper methods are added here.

}
