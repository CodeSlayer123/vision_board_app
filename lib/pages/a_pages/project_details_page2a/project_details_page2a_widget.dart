import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'project_details_page2a_model.dart';
export 'project_details_page2a_model.dart';

class ProjectDetailsPage2aWidget extends StatefulWidget {
  const ProjectDetailsPage2aWidget({
    Key? key,
    this.projectRef,
    int? tabIndex,
    this.fromTask,
  })  : this.tabIndex = tabIndex ?? 0,
        super(key: key);

  final ProjectsRecord? projectRef;
  final int tabIndex;
  final bool? fromTask;

  @override
  _ProjectDetailsPage2aWidgetState createState() =>
      _ProjectDetailsPage2aWidgetState();
}

class _ProjectDetailsPage2aWidgetState extends State<ProjectDetailsPage2aWidget>
    with TickerProviderStateMixin {
  late ProjectDetailsPage2aModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 30.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: Offset(0.0, 30.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProjectDetailsPage2aModel());

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<ProjectsRecord>(
      stream: ProjectsRecord.getDocument(widget.projectRef!.reference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primary,
              ),
            ),
          );
        }
        final projectDetailsPage2aProjectsRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: Color(0xFFFA8072),
              automaticallyImplyLeading: false,
              actions: [],
              flexibleSpace: FlexibleSpaceBar(
                title: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30.0,
                              borderWidth: 1.0,
                              buttonSize: 50.0,
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                size: 30.0,
                              ),
                              onPressed: () async {
                                context.safePop();
                              },
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  4.0, 0.0, 0.0, 0.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'ku70mr3f' /* Back */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .displaySmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .displaySmallFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: 16.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .displaySmallFamily),
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                centerTitle: true,
                expandedTitleScale: 1.0,
              ),
              elevation: 0.0,
            ),
            body: SafeArea(
              child: Stack(
                children: [
                  if (responsiveVisibility(
                    context: context,
                    tablet: false,
                    desktop: false,
                  ))
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 4.0, 16.0, 12.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              width: 230.0,
                                              height: 50.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 4.0),
                                                child: AutoSizeText(
                                                  projectDetailsPage2aProjectsRecord
                                                      .projectName!,
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMediumFamily),
                                                        lineHeight: 1.2,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (projectDetailsPage2aProjectsRecord
                                              .owner !=
                                          currentUserReference)
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 4.0, 16.0, 12.0),
                                              child: StreamBuilder<UsersRecord>(
                                                stream: UsersRecord.getDocument(
                                                    projectDetailsPage2aProjectsRecord
                                                        .owner!),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final columnUsersRecord =
                                                      snapshot.data!;
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      if (currentUserReference !=
                                                          projectDetailsPage2aProjectsRecord
                                                              .owner)
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.9, 0.0),
                                                          child: Container(
                                                            width: 60.0,
                                                            height: 60.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .lineColor,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2.0,
                                                                          2.0,
                                                                          2.0,
                                                                          2.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    'viewUser',
                                                                    queryParams:
                                                                        {
                                                                      'userRef':
                                                                          serializeParam(
                                                                        columnUsersRecord,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <
                                                                        String,
                                                                        dynamic>{
                                                                      'userRef':
                                                                          columnUsersRecord,
                                                                    },
                                                                  );
                                                                },
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              60.0),
                                                                  child: Image
                                                                      .network(
                                                                    columnUsersRecord
                                                                        .photoUrl!,
                                                                    width: 80.0,
                                                                    height:
                                                                        80.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.85, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      5.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            columnUsersRecord
                                                                .displayName!,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 5.0, 0.0, 15.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            30.0, 0.0, 0.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: true
                                              ? null
                                              : () {
                                                  print('Button pressed ...');
                                                },
                                          text:
                                              projectDetailsPage2aProjectsRecord
                                                  .term!,
                                          options: FFButtonOptions(
                                            width: 130.0,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: Color(0xFFFA8072),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmallFamily,
                                                      color: Colors.white,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily),
                                                    ),
                                            elevation: 4.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            disabledColor: Color(0xFFFA8072),
                                            disabledTextColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                          ),
                                        ),
                                      ),
                                      if (!projectDetailsPage2aProjectsRecord
                                          .isPublic!)
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    130.0, 0.0, 0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.eyeSlash,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              size: 30.0,
                                            ),
                                          ),
                                        ),
                                      if (projectDetailsPage2aProjectsRecord
                                              .isPublic ??
                                          true)
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    130.0, 0.0, 0.0, 0.0),
                                            child: FaIcon(
                                              FontAwesomeIcons.eye,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              size: 30.0,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 3.0,
                                  color: Color(0x33000000),
                                  offset: Offset(0.0, 1.0),
                                )
                              ],
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                LinearPercentIndicator(
                                  percent: valueOrDefault<double>(
                                    functions.progressBarValue(
                                        valueOrDefault<int>(
                                          widget.projectRef!.numberTasks,
                                          0,
                                        ),
                                        valueOrDefault<int>(
                                          widget.projectRef!.completedTasks,
                                          0,
                                        ),
                                        projectDetailsPage2aProjectsRecord,
                                        currentUserReference!.id,
                                        false),
                                    0.0,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 1.0,
                                  lineHeight: 12.0,
                                  animation: true,
                                  progressColor: Color(0xFFFA8072),
                                  backgroundColor:
                                      FlutterFlowTheme.of(context).lineColor,
                                  barRadius: Radius.circular(0.0),
                                  padding: EdgeInsets.zero,
                                ),
                              ],
                            ),
                          ),
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 16.0, 24.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: SelectionArea(
                                            child: Text(
                                          FFLocalizations.of(context).getText(
                                            'ixvld9x8' /* Completed Tasks */,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        )),
                                      ),
                                      Expanded(
                                        child: SelectionArea(
                                            child: Text(
                                          FFLocalizations.of(context).getText(
                                            'aw5psdmi' /* Number of Tasks */,
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        )),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 8.0, 0.0),
                                      child: Container(
                                        width: 160.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .lineColor,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: FlutterFlowCountController(
                                          decrementIconBuilder: (enabled) =>
                                              FaIcon(
                                            FontAwesomeIcons.minus,
                                            color: enabled
                                                ? FlutterFlowTheme.of(context)
                                                    .primaryText
                                                : FlutterFlowTheme.of(context)
                                                    .lineColor,
                                            size: 20.0,
                                          ),
                                          incrementIconBuilder: (enabled) =>
                                              FaIcon(
                                            FontAwesomeIcons.plus,
                                            color: enabled
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : FlutterFlowTheme.of(context)
                                                    .lineColor,
                                            size: 20.0,
                                          ),
                                          countBuilder: (count) => Text(
                                            count.toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .titleSmall,
                                          ),
                                          count:
                                              _model.countControllerValue1 ??=
                                                  widget.projectRef!
                                                      .completedTasks!,
                                          updateCount: (count) async {
                                            setState(() => _model
                                                .countControllerValue1 = count);
                                            final projectsUpdateData =
                                                createProjectsRecordData(
                                              completedTasks:
                                                  _model.countControllerValue1,
                                            );
                                            await widget.projectRef!.reference
                                                .update(projectsUpdateData);
                                          },
                                          stepSize: 1,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 16.0, 8.0, 0.0),
                                      child: Container(
                                        width: 160.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .lineColor,
                                            width: 1.0,
                                          ),
                                        ),
                                        child: FlutterFlowCountController(
                                          decrementIconBuilder: (enabled) =>
                                              FaIcon(
                                            FontAwesomeIcons.minus,
                                            color: enabled
                                                ? FlutterFlowTheme.of(context)
                                                    .primaryText
                                                : FlutterFlowTheme.of(context)
                                                    .lineColor,
                                            size: 20.0,
                                          ),
                                          incrementIconBuilder: (enabled) =>
                                              FaIcon(
                                            FontAwesomeIcons.plus,
                                            color: enabled
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : FlutterFlowTheme.of(context)
                                                    .lineColor,
                                            size: 20.0,
                                          ),
                                          countBuilder: (count) => Text(
                                            count.toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .titleSmall,
                                          ),
                                          count: _model
                                                  .countControllerValue2 ??=
                                              widget.projectRef!.numberTasks!,
                                          updateCount: (count) async {
                                            setState(() => _model
                                                .countControllerValue2 = count);
                                            final projectsUpdateData =
                                                createProjectsRecordData(
                                              numberTasks:
                                                  _model.countControllerValue2,
                                            );
                                            await widget.projectRef!.reference
                                                .update(projectsUpdateData);
                                          },
                                          stepSize: 1,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          Expanded(
                            child: DefaultTabController(
                              length: 3,
                              initialIndex: min(
                                  valueOrDefault<int>(
                                    widget.tabIndex,
                                    0,
                                  ),
                                  2),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment(0.0, 0),
                                    child: TabBar(
                                      isScrollable: true,
                                      labelColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      unselectedLabelColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryText,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.normal,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                      indicatorColor:
                                          FlutterFlowTheme.of(context).primary,
                                      tabs: [
                                        Tab(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'oifb7p3f' /* Project */,
                                          ),
                                        ),
                                        Tab(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'enoj0w2c' /* Tasks */,
                                          ),
                                        ),
                                        Tab(
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'h7ggih6b' /* Gallery */,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 12.0, 16.0, 20.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 7.0,
                                                  color: Color(0x2F1D2429),
                                                  offset: Offset(0.0, 3.0),
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Stack(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12.0, 12.0,
                                                          12.0, 12.0),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image.network(
                                                            projectDetailsPage2aProjectsRecord
                                                                .image!,
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                1.0,
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            20.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    Container(
                                                                  width: 300.0,
                                                                  height: 50.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Text(
                                                                    projectDetailsPage2aProjectsRecord
                                                                        .projectName!,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF101213),
                                                                          fontSize:
                                                                              18.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Text(
                                                                projectDetailsPage2aProjectsRecord
                                                                    .description!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF57636C),
                                                                      fontSize:
                                                                          14.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodySmallFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                if (widget.projectRef!.owner ==
                                                    currentUserReference)
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 0.75),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderRadius: 30.0,
                                                      borderWidth: 0.0,
                                                      buttonSize: 60.0,
                                                      fillColor:
                                                          Color(0xFFFA8072),
                                                      icon: FaIcon(
                                                        FontAwesomeIcons.pen,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 25.0,
                                                      ),
                                                      onPressed: () async {
                                                        if (Navigator.of(
                                                                context)
                                                            .canPop()) {
                                                          context.pop();
                                                        }
                                                        context.pushNamed(
                                                          'editProject',
                                                          queryParams: {
                                                            'projectRef':
                                                                serializeParam(
                                                              widget.projectRef,
                                                              ParamType
                                                                  .Document,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'projectRef': widget
                                                                .projectRef,
                                                            kTransitionInfoKey:
                                                                TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .bottomToTop,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      240),
                                                            ),
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Stack(
                                          children: [
                                            Stack(
                                              children: [
                                                SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.85, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                '${projectDetailsPage2aProjectsRecord.numberTasks?.toString()} Tasks!',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ),
                                                          ),
                                                          CircularPercentIndicator(
                                                            percent:
                                                                valueOrDefault<
                                                                    double>(
                                                              functions.progressBarValue(
                                                                  projectDetailsPage2aProjectsRecord
                                                                      .numberTasks,
                                                                  projectDetailsPage2aProjectsRecord
                                                                      .completedTasks,
                                                                  projectDetailsPage2aProjectsRecord,
                                                                  currentUserReference!
                                                                      .id,
                                                                  true),
                                                              0.0,
                                                            ),
                                                            radius: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.25,
                                                            lineWidth: 10.0,
                                                            animation: true,
                                                            progressColor:
                                                                Color(
                                                                    0xFFFA8072),
                                                            backgroundColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .lineColor,
                                                            center: Text(
                                                              formatNumber(
                                                                functions.tasksLeft(
                                                                    projectDetailsPage2aProjectsRecord
                                                                        .numberTasks,
                                                                    projectDetailsPage2aProjectsRecord
                                                                        .completedTasks),
                                                                formatType:
                                                                    FormatType
                                                                        .percent,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .displaySmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .displaySmallFamily,
                                                                    fontSize:
                                                                        24.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).displaySmallFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          20.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: StreamBuilder<
                                                                  List<
                                                                      AllTasksRecord>>(
                                                                stream:
                                                                    queryAllTasksRecord(
                                                                  queryBuilder: (allTasksRecord) => allTasksRecord
                                                                      .where(
                                                                          'projectRef',
                                                                          isEqualTo: widget
                                                                              .projectRef!
                                                                              .reference)
                                                                      .orderBy(
                                                                          'timeCreated'),
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<AllTasksRecord>
                                                                      listViewAllTasksRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  if (listViewAllTasksRecordList
                                                                      .isEmpty) {
                                                                    return Image
                                                                        .network(
                                                                      '',
                                                                    );
                                                                  }
                                                                  return ListView
                                                                      .builder(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount:
                                                                        listViewAllTasksRecordList
                                                                            .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            listViewIndex) {
                                                                      final listViewAllTasksRecord =
                                                                          listViewAllTasksRecordList[
                                                                              listViewIndex];
                                                                      return Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            8.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color: listViewAllTasksRecord.completed!
                                                                                ? FlutterFlowTheme.of(context).secondary
                                                                                : FlutterFlowTheme.of(context).primary,
                                                                            borderRadius:
                                                                                BorderRadius.circular(12.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).lineColor,
                                                                              width: 2.0,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Stack(
                                                                            children: [
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  if (projectDetailsPage2aProjectsRecord.owner == currentUserReference)
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        if (widget.projectRef!.owner == currentUserReference)
                                                                                          Expanded(
                                                                                            child: Theme(
                                                                                              data: ThemeData(
                                                                                                unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                              ),
                                                                                              child: CheckboxListTile(
                                                                                                value: _model.checkboxListTileValueMap1[listViewAllTasksRecord] ??= listViewAllTasksRecord.completed!,
                                                                                                onChanged: (newValue) async {
                                                                                                  setState(() => _model.checkboxListTileValueMap1[listViewAllTasksRecord] = newValue!);
                                                                                                  if (newValue!) {
                                                                                                    final allTasksUpdateData = createAllTasksRecordData(
                                                                                                      completed: true,
                                                                                                      status: 'Completed',
                                                                                                    );
                                                                                                    await listViewAllTasksRecord.reference.update(allTasksUpdateData);

                                                                                                    final projectsUpdateData = {
                                                                                                      'completedTasks': FieldValue.increment(1),
                                                                                                    };
                                                                                                    await projectDetailsPage2aProjectsRecord.reference.update(projectsUpdateData);
                                                                                                  } else {
                                                                                                    final allTasksUpdateData = createAllTasksRecordData(
                                                                                                      completed: false,
                                                                                                      status: 'In Progress',
                                                                                                    );
                                                                                                    await listViewAllTasksRecord.reference.update(allTasksUpdateData);

                                                                                                    final projectsUpdateData = {
                                                                                                      'completedTasks': FieldValue.increment(-(1)),
                                                                                                    };
                                                                                                    await widget.projectRef!.reference.update(projectsUpdateData);

                                                                                                    context.pushNamed(
                                                                                                      'projectDetailsPage2a',
                                                                                                      queryParams: {
                                                                                                        'projectRef': serializeParam(
                                                                                                          widget.projectRef,
                                                                                                          ParamType.Document,
                                                                                                        ),
                                                                                                        'tabIndex': serializeParam(
                                                                                                          1,
                                                                                                          ParamType.int,
                                                                                                        ),
                                                                                                      }.withoutNulls,
                                                                                                      extra: <String, dynamic>{
                                                                                                        'projectRef': widget.projectRef,
                                                                                                      },
                                                                                                    );
                                                                                                  }
                                                                                                },
                                                                                                title: Text(
                                                                                                  listViewAllTasksRecord.taskName!,
                                                                                                  textAlign: TextAlign.start,
                                                                                                  style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                ),
                                                                                                tileColor: Color(0xFFF5F5F5),
                                                                                                activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                checkColor: FlutterFlowTheme.of(context).tertiary,
                                                                                                dense: true,
                                                                                                controlAffinity: ListTileControlAffinity.leading,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  if (projectDetailsPage2aProjectsRecord.owner == currentUserReference)
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 0.0, 0.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                  child: Container(
                                                                                                    height: 32.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: () {
                                                                                                        if (listViewAllTasksRecord.status == 'Not Started') {
                                                                                                          return FlutterFlowTheme.of(context).secondary30;
                                                                                                        } else if (listViewAllTasksRecord.status == 'In Progress') {
                                                                                                          return FlutterFlowTheme.of(context).primary30;
                                                                                                        } else if (listViewAllTasksRecord.status == 'Complete') {
                                                                                                          return FlutterFlowTheme.of(context).tertiary30;
                                                                                                        } else {
                                                                                                          return FlutterFlowTheme.of(context).error30;
                                                                                                        }
                                                                                                      }(),
                                                                                                      borderRadius: BorderRadius.circular(32.0),
                                                                                                      border: Border.all(
                                                                                                        color: () {
                                                                                                          if (listViewAllTasksRecord.status == 'Not Started') {
                                                                                                            return FlutterFlowTheme.of(context).secondary;
                                                                                                          } else if (listViewAllTasksRecord.status == 'In Progress') {
                                                                                                            return FlutterFlowTheme.of(context).primary;
                                                                                                          } else if (listViewAllTasksRecord.status == 'Complete') {
                                                                                                            return FlutterFlowTheme.of(context).alternate;
                                                                                                          } else {
                                                                                                            return FlutterFlowTheme.of(context).tertiary;
                                                                                                          }
                                                                                                        }(),
                                                                                                      ),
                                                                                                    ),
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                      child: Text(
                                                                                                        listViewAllTasksRecord.status!,
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Align(
                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                child: FlutterFlowIconButton(
                                                                                                  borderColor: Colors.transparent,
                                                                                                  borderRadius: 30.0,
                                                                                                  borderWidth: 1.0,
                                                                                                  buttonSize: 60.0,
                                                                                                  icon: Icon(
                                                                                                    Icons.remove_red_eye_sharp,
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    size: 20.0,
                                                                                                  ),
                                                                                                  onPressed: () async {
                                                                                                    context.pushNamed(
                                                                                                      'viewTask',
                                                                                                      queryParams: {
                                                                                                        'projectRef': serializeParam(
                                                                                                          projectDetailsPage2aProjectsRecord,
                                                                                                          ParamType.Document,
                                                                                                        ),
                                                                                                        'taskRef': serializeParam(
                                                                                                          listViewAllTasksRecord,
                                                                                                          ParamType.Document,
                                                                                                        ),
                                                                                                      }.withoutNulls,
                                                                                                      extra: <String, dynamic>{
                                                                                                        'projectRef': projectDetailsPage2aProjectsRecord,
                                                                                                        'taskRef': listViewAllTasksRecord,
                                                                                                      },
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  if (projectDetailsPage2aProjectsRecord.owner != currentUserReference)
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 30.0, 0.0),
                                                                                          child: Text(
                                                                                            listViewAllTasksRecord.taskName!,
                                                                                            style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  if (projectDetailsPage2aProjectsRecord.owner != currentUserReference)
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 0.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                child: Container(
                                                                                                  height: 32.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: () {
                                                                                                      if (listViewAllTasksRecord.status == 'Not Started') {
                                                                                                        return FlutterFlowTheme.of(context).secondary30;
                                                                                                      } else if (listViewAllTasksRecord.status == 'In Progress') {
                                                                                                        return FlutterFlowTheme.of(context).primary30;
                                                                                                      } else if (listViewAllTasksRecord.status == 'Complete') {
                                                                                                        return FlutterFlowTheme.of(context).tertiary30;
                                                                                                      } else {
                                                                                                        return FlutterFlowTheme.of(context).error30;
                                                                                                      }
                                                                                                    }(),
                                                                                                    borderRadius: BorderRadius.circular(32.0),
                                                                                                    border: Border.all(
                                                                                                      color: () {
                                                                                                        if (listViewAllTasksRecord.status == 'Not Started') {
                                                                                                          return FlutterFlowTheme.of(context).secondary;
                                                                                                        } else if (listViewAllTasksRecord.status == 'In Progress') {
                                                                                                          return FlutterFlowTheme.of(context).primary;
                                                                                                        } else if (listViewAllTasksRecord.status == 'Complete') {
                                                                                                          return FlutterFlowTheme.of(context).alternate;
                                                                                                        } else {
                                                                                                          return FlutterFlowTheme.of(context).tertiary;
                                                                                                        }
                                                                                                      }(),
                                                                                                    ),
                                                                                                  ),
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                    child: Text(
                                                                                                      listViewAllTasksRecord.status!,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: FlutterFlowIconButton(
                                                                                                borderColor: Colors.transparent,
                                                                                                borderRadius: 30.0,
                                                                                                borderWidth: 1.0,
                                                                                                buttonSize: 60.0,
                                                                                                icon: Icon(
                                                                                                  Icons.remove_red_eye_sharp,
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  size: 20.0,
                                                                                                ),
                                                                                                onPressed: () async {
                                                                                                  context.pushNamed(
                                                                                                    'viewTask',
                                                                                                    queryParams: {
                                                                                                      'projectRef': serializeParam(
                                                                                                        projectDetailsPage2aProjectsRecord,
                                                                                                        ParamType.Document,
                                                                                                      ),
                                                                                                      'taskRef': serializeParam(
                                                                                                        listViewAllTasksRecord,
                                                                                                        ParamType.Document,
                                                                                                      ),
                                                                                                    }.withoutNulls,
                                                                                                    extra: <String, dynamic>{
                                                                                                      'projectRef': projectDetailsPage2aProjectsRecord,
                                                                                                      'taskRef': listViewAllTasksRecord,
                                                                                                    },
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation1']!),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            if (widget.projectRef!.owner ==
                                                currentUserReference)
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.9, 0.75),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30.0,
                                                  borderWidth: 0.0,
                                                  buttonSize: 60.0,
                                                  fillColor: Color(0xFFFA8072),
                                                  icon: Icon(
                                                    Icons.add,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 40.0,
                                                  ),
                                                  onPressed: () async {
                                                    if (Navigator.of(context)
                                                        .canPop()) {
                                                      context.pop();
                                                    }
                                                    context.pushNamed(
                                                      'createTask',
                                                      queryParams: {
                                                        'projectRef':
                                                            serializeParam(
                                                          widget.projectRef,
                                                          ParamType.Document,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'projectRef':
                                                            widget.projectRef,
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .bottomToTop,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  250),
                                                        ),
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.15),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (projectDetailsPage2aProjectsRecord
                                                          .numberTasks! <
                                                      1)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  50.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          '3mjtxnss' /* No tasks have been added yet! */,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontSize:
                                                                      18.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (widget.projectRef!.owner ==
                                                currentUserReference)
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 20.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -0.7, 0.0),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            final selectedMedia =
                                                                await selectMediaWithSourceBottomSheet(
                                                              context: context,
                                                              allowPhoto: true,
                                                            );
                                                            if (selectedMedia !=
                                                                    null &&
                                                                selectedMedia.every((m) =>
                                                                    validateFileFormat(
                                                                        m.storagePath,
                                                                        context))) {
                                                              setState(() =>
                                                                  _model.isDataUploading1 =
                                                                      true);
                                                              var selectedUploadedFiles =
                                                                  <FFUploadedFile>[];
                                                              var downloadUrls =
                                                                  <String>[];
                                                              try {
                                                                showUploadMessage(
                                                                  context,
                                                                  'Uploading file...',
                                                                  showLoading:
                                                                      true,
                                                                );
                                                                selectedUploadedFiles =
                                                                    selectedMedia
                                                                        .map((m) =>
                                                                            FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                            ))
                                                                        .toList();

                                                                downloadUrls = (await Future
                                                                        .wait(
                                                                  selectedMedia
                                                                      .map(
                                                                    (m) async =>
                                                                        await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                  ),
                                                                ))
                                                                    .where((u) =>
                                                                        u !=
                                                                        null)
                                                                    .map((u) =>
                                                                        u!)
                                                                    .toList();
                                                              } finally {
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .hideCurrentSnackBar();
                                                                _model.isDataUploading1 =
                                                                    false;
                                                              }
                                                              if (selectedUploadedFiles
                                                                          .length ==
                                                                      selectedMedia
                                                                          .length &&
                                                                  downloadUrls
                                                                          .length ==
                                                                      selectedMedia
                                                                          .length) {
                                                                setState(() {
                                                                  _model.uploadedLocalFile1 =
                                                                      selectedUploadedFiles
                                                                          .first;
                                                                  _model.uploadedFileUrl1 =
                                                                      downloadUrls
                                                                          .first;
                                                                });
                                                                showUploadMessage(
                                                                    context,
                                                                    'Success!');
                                                              } else {
                                                                setState(() {});
                                                                showUploadMessage(
                                                                    context,
                                                                    'Failed to upload data');
                                                                return;
                                                              }
                                                            }

                                                            final projectsUpdateData =
                                                                {
                                                              'gallery': FieldValue
                                                                  .arrayUnion([
                                                                _model
                                                                    .uploadedFileUrl1
                                                              ]),
                                                            };
                                                            await widget
                                                                .projectRef!
                                                                .reference
                                                                .update(
                                                                    projectsUpdateData);
                                                          },
                                                          text: FFLocalizations
                                                                  .of(context)
                                                              .getText(
                                                            '8a9dewam' /* Upload Image */,
                                                          ),
                                                          icon: Icon(
                                                            Icons.image,
                                                            size: 15.0,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width: 150.0,
                                                            height: 40.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondary,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleSmallFamily),
                                                                    ),
                                                            elevation: 2.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            Expanded(
                                              child:
                                                  StreamBuilder<ProjectsRecord>(
                                                stream:
                                                    ProjectsRecord.getDocument(
                                                        widget.projectRef!
                                                            .reference),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final staggeredViewProjectsRecord =
                                                      snapshot.data!;
                                                  return Builder(
                                                    builder: (context) {
                                                      final galleryItem =
                                                          staggeredViewProjectsRecord
                                                              .gallery!
                                                              .toList()
                                                              .map((e) => e)
                                                              .toList();
                                                      return MasonryGridView
                                                          .count(
                                                        crossAxisCount: 2,
                                                        crossAxisSpacing: 10.0,
                                                        mainAxisSpacing: 10.0,
                                                        itemCount:
                                                            galleryItem.length,
                                                        itemBuilder: (context,
                                                            galleryItemIndex) {
                                                          final galleryItemItem =
                                                              galleryItem[
                                                                  galleryItemIndex];
                                                          return InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              await Navigator
                                                                  .push(
                                                                context,
                                                                PageTransition(
                                                                  type:
                                                                      PageTransitionType
                                                                          .fade,
                                                                  child:
                                                                      FlutterFlowExpandedImageView(
                                                                    image: Image
                                                                        .network(
                                                                      galleryItemItem,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                    allowRotation:
                                                                        true,
                                                                    tag:
                                                                        galleryItemItem,
                                                                    useHeroAnimation:
                                                                        true,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                            child: Hero(
                                                              tag:
                                                                  galleryItemItem,
                                                              transitionOnUserGestures:
                                                                  true,
                                                              child:
                                                                  Image.network(
                                                                galleryItemItem,
                                                                width: 100.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (responsiveVisibility(
                    context: context,
                    phone: false,
                    tabletLandscape: false,
                  ))
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          shape: BoxShape.rectangle,
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 4.0, 16.0, 12.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 230.0,
                                                  height: 50.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 4.0),
                                                    child: AutoSizeText(
                                                      projectDetailsPage2aProjectsRecord
                                                          .projectName!,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .headlineMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineMediumFamily),
                                                                lineHeight: 1.2,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (projectDetailsPage2aProjectsRecord
                                                  .owner !=
                                              currentUserReference)
                                            Expanded(
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 4.0, 16.0, 12.0),
                                                  child: StreamBuilder<
                                                      UsersRecord>(
                                                    stream: UsersRecord.getDocument(
                                                        projectDetailsPage2aProjectsRecord
                                                            .owner!),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final columnUsersRecord =
                                                          snapshot.data!;
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          if (currentUserReference !=
                                                              projectDetailsPage2aProjectsRecord
                                                                  .owner)
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.9, 0.0),
                                                              child: Container(
                                                                width: 60.0,
                                                                height: 60.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .lineColor,
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          2.0,
                                                                          2.0,
                                                                          2.0,
                                                                          2.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        'viewUser',
                                                                        queryParams:
                                                                            {
                                                                          'userRef':
                                                                              serializeParam(
                                                                            columnUsersRecord,
                                                                            ParamType.Document,
                                                                          ),
                                                                        }.withoutNulls,
                                                                        extra: <
                                                                            String,
                                                                            dynamic>{
                                                                          'userRef':
                                                                              columnUsersRecord,
                                                                        },
                                                                      );
                                                                    },
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              60.0),
                                                                      child: Image
                                                                          .network(
                                                                        columnUsersRecord
                                                                            .photoUrl!,
                                                                        width:
                                                                            80.0,
                                                                        height:
                                                                            80.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.85, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                columnUsersRecord
                                                                    .displayName!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 15.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    30.0, 0.0, 0.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: true
                                                  ? null
                                                  : () {
                                                      print(
                                                          'Button pressed ...');
                                                    },
                                              text:
                                                  projectDetailsPage2aProjectsRecord
                                                      .term!,
                                              options: FFButtonOptions(
                                                width: 130.0,
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color: Color(0xFFFA8072),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: Colors.white,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                elevation: 4.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                disabledColor:
                                                    Color(0xFFFA8072),
                                                disabledTextColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                              ),
                                            ),
                                          ),
                                          if (!projectDetailsPage2aProjectsRecord
                                              .isPublic!)
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        130.0, 0.0, 0.0, 0.0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.eyeSlash,
                                                  color: Colors.black,
                                                  size: 30.0,
                                                ),
                                              ),
                                            ),
                                          if (projectDetailsPage2aProjectsRecord
                                                  .isPublic ??
                                              true)
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        130.0, 0.0, 0.0, 0.0),
                                                child: FaIcon(
                                                  FontAwesomeIcons.eye,
                                                  color: Colors.black,
                                                  size: 30.0,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3.0,
                                      color: Color(0x33000000),
                                      offset: Offset(0.0, 1.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    LinearPercentIndicator(
                                      percent: valueOrDefault<double>(
                                        functions.progressBarValue(
                                            valueOrDefault<int>(
                                              widget.projectRef!.numberTasks,
                                              0,
                                            ),
                                            valueOrDefault<int>(
                                              widget.projectRef!.completedTasks,
                                              0,
                                            ),
                                            projectDetailsPage2aProjectsRecord,
                                            currentUserReference!.id,
                                            false),
                                        0.0,
                                      ),
                                      width: MediaQuery.of(context).size.width *
                                          1.0,
                                      lineHeight: 12.0,
                                      animation: true,
                                      progressColor: Color(0xFFFA8072),
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .lineColor,
                                      barRadius: Radius.circular(0.0),
                                      padding: EdgeInsets.zero,
                                    ),
                                  ],
                                ),
                              ),
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                                tablet: false,
                                tabletLandscape: false,
                                desktop: false,
                              ))
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 16.0, 24.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: SelectionArea(
                                                child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'c5s8jfl1' /* Completed Tasks */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            )),
                                          ),
                                          Expanded(
                                            child: SelectionArea(
                                                child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '2teeqmeh' /* Number of Tasks */,
                                              ),
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                            )),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 8.0, 0.0),
                                          child: Container(
                                            width: 160.0,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .lineColor,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: FlutterFlowCountController(
                                              decrementIconBuilder: (enabled) =>
                                                  FaIcon(
                                                FontAwesomeIcons.minus,
                                                color: enabled
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .lineColor,
                                                size: 20.0,
                                              ),
                                              incrementIconBuilder: (enabled) =>
                                                  FaIcon(
                                                FontAwesomeIcons.plus,
                                                color: enabled
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .lineColor,
                                                size: 20.0,
                                              ),
                                              countBuilder: (count) => Text(
                                                count.toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall,
                                              ),
                                              count: _model
                                                      .countControllerValue3 ??=
                                                  widget.projectRef!
                                                      .completedTasks!,
                                              updateCount: (count) async {
                                                setState(() => _model
                                                        .countControllerValue3 =
                                                    count);
                                                final projectsUpdateData =
                                                    createProjectsRecordData(
                                                  completedTasks: _model
                                                      .countControllerValue3,
                                                );
                                                await widget
                                                    .projectRef!.reference
                                                    .update(projectsUpdateData);
                                              },
                                              stepSize: 1,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 16.0, 8.0, 0.0),
                                          child: Container(
                                            width: 160.0,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(25.0),
                                              shape: BoxShape.rectangle,
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .lineColor,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: FlutterFlowCountController(
                                              decrementIconBuilder: (enabled) =>
                                                  FaIcon(
                                                FontAwesomeIcons.minus,
                                                color: enabled
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .lineColor,
                                                size: 20.0,
                                              ),
                                              incrementIconBuilder: (enabled) =>
                                                  FaIcon(
                                                FontAwesomeIcons.plus,
                                                color: enabled
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .lineColor,
                                                size: 20.0,
                                              ),
                                              countBuilder: (count) => Text(
                                                count.toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall,
                                              ),
                                              count: _model
                                                      .countControllerValue4 ??=
                                                  widget
                                                      .projectRef!.numberTasks!,
                                              updateCount: (count) async {
                                                setState(() => _model
                                                        .countControllerValue4 =
                                                    count);
                                                final projectsUpdateData =
                                                    createProjectsRecordData(
                                                  numberTasks: _model
                                                      .countControllerValue4,
                                                );
                                                await widget
                                                    .projectRef!.reference
                                                    .update(projectsUpdateData);
                                              },
                                              stepSize: 1,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              Expanded(
                                child: DefaultTabController(
                                  length: 3,
                                  initialIndex: min(
                                      valueOrDefault<int>(
                                        widget.tabIndex,
                                        0,
                                      ),
                                      2),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment(0.0, 0),
                                        child: TabBar(
                                          isScrollable: true,
                                          labelColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          unselectedLabelColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          indicatorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          tabs: [
                                            Tab(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                'y3qn15xi' /* Project */,
                                              ),
                                            ),
                                            Tab(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '5ere0xot' /* Tasks */,
                                              ),
                                            ),
                                            Tab(
                                              text: FFLocalizations.of(context)
                                                  .getText(
                                                '6row1e9p' /* Gallery */,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: TabBarView(
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 12.0, 16.0, 20.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 7.0,
                                                      color: Color(0x2F1D2429),
                                                      offset: Offset(0.0, 3.0),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  12.0,
                                                                  12.0,
                                                                  12.0),
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              child:
                                                                  Image.network(
                                                                projectDetailsPage2aProjectsRecord
                                                                    .image!,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          8.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Container(
                                                                    width:
                                                                        300.0,
                                                                    height:
                                                                        80.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child: Text(
                                                                      projectDetailsPage2aProjectsRecord
                                                                          .projectName!,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            color:
                                                                                Color(0xFF101213),
                                                                            fontSize:
                                                                                18.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  child: Text(
                                                                    projectDetailsPage2aProjectsRecord
                                                                        .description!,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF57636C),
                                                                          fontSize:
                                                                              14.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    if (widget.projectRef!
                                                            .owner ==
                                                        currentUserReference)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1.0, 0.75),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 30.0,
                                                          borderWidth: 0.0,
                                                          buttonSize: 60.0,
                                                          fillColor:
                                                              Color(0xFFFA8072),
                                                          icon: FaIcon(
                                                            FontAwesomeIcons
                                                                .pen,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 25.0,
                                                          ),
                                                          onPressed: () async {
                                                            if (Navigator.of(
                                                                    context)
                                                                .canPop()) {
                                                              context.pop();
                                                            }
                                                            context.pushNamed(
                                                              'editProject',
                                                              queryParams: {
                                                                'projectRef':
                                                                    serializeParam(
                                                                  widget
                                                                      .projectRef,
                                                                  ParamType
                                                                      .Document,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                'projectRef': widget
                                                                    .projectRef,
                                                                kTransitionInfoKey:
                                                                    TransitionInfo(
                                                                  hasTransition:
                                                                      true,
                                                                  transitionType:
                                                                      PageTransitionType
                                                                          .bottomToTop,
                                                                  duration: Duration(
                                                                      milliseconds:
                                                                          240),
                                                                ),
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Stack(
                                              children: [
                                                Stack(
                                                  children: [
                                                    SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        -0.9,
                                                                        0.0),
                                                                child: Text(
                                                                  '${projectDetailsPage2aProjectsRecord.numberTasks?.toString()} Tasks!',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        100.0,
                                                                        0.0,
                                                                        0.0),
                                                                child:
                                                                    CircularPercentIndicator(
                                                                  percent:
                                                                      valueOrDefault<
                                                                          double>(
                                                                    functions.progressBarValue(
                                                                        projectDetailsPage2aProjectsRecord
                                                                            .numberTasks,
                                                                        projectDetailsPage2aProjectsRecord
                                                                            .completedTasks,
                                                                        projectDetailsPage2aProjectsRecord,
                                                                        currentUserReference!
                                                                            .id,
                                                                        true),
                                                                    0.0,
                                                                  ),
                                                                  radius: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.125,
                                                                  lineWidth:
                                                                      10.0,
                                                                  animation:
                                                                      true,
                                                                  progressColor:
                                                                      Color(
                                                                          0xFFFA8072),
                                                                  backgroundColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .lineColor,
                                                                  center: Text(
                                                                    formatNumber(
                                                                      functions.tasksLeft(
                                                                          projectDetailsPage2aProjectsRecord
                                                                              .numberTasks,
                                                                          projectDetailsPage2aProjectsRecord
                                                                              .completedTasks),
                                                                      formatType:
                                                                          FormatType
                                                                              .percent,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .displaySmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).displaySmallFamily,
                                                                          fontSize:
                                                                              24.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).displaySmallFamily),
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          20.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: StreamBuilder<
                                                                      List<
                                                                          AllTasksRecord>>(
                                                                    stream:
                                                                        queryAllTasksRecord(
                                                                      queryBuilder: (allTasksRecord) => allTasksRecord
                                                                          .where(
                                                                              'projectRef',
                                                                              isEqualTo: widget.projectRef!.reference)
                                                                          .orderBy('timeCreated'),
                                                                    ),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<AllTasksRecord>
                                                                          listViewAllTasksRecordList =
                                                                          snapshot
                                                                              .data!;
                                                                      if (listViewAllTasksRecordList
                                                                          .isEmpty) {
                                                                        return Image
                                                                            .network(
                                                                          '',
                                                                        );
                                                                      }
                                                                      return ListView
                                                                          .builder(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        shrinkWrap:
                                                                            true,
                                                                        scrollDirection:
                                                                            Axis.vertical,
                                                                        itemCount:
                                                                            listViewAllTasksRecordList.length,
                                                                        itemBuilder:
                                                                            (context,
                                                                                listViewIndex) {
                                                                          final listViewAllTasksRecord =
                                                                              listViewAllTasksRecordList[listViewIndex];
                                                                          return Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                0.0,
                                                                                16.0,
                                                                                8.0),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(
                                                                                color: listViewAllTasksRecord.completed! ? FlutterFlowTheme.of(context).secondary : FlutterFlowTheme.of(context).primary,
                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).lineColor,
                                                                                  width: 2.0,
                                                                                ),
                                                                              ),
                                                                              child: Stack(
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      if (projectDetailsPage2aProjectsRecord.owner == currentUserReference)
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            if (widget.projectRef!.owner == currentUserReference)
                                                                                              Expanded(
                                                                                                child: Theme(
                                                                                                  data: ThemeData(
                                                                                                    unselectedWidgetColor: Color(0xFF95A1AC),
                                                                                                  ),
                                                                                                  child: CheckboxListTile(
                                                                                                    value: _model.checkboxListTileValueMap2[listViewAllTasksRecord] ??= listViewAllTasksRecord.completed!,
                                                                                                    onChanged: (newValue) async {
                                                                                                      setState(() => _model.checkboxListTileValueMap2[listViewAllTasksRecord] = newValue!);
                                                                                                      if (newValue!) {
                                                                                                        final allTasksUpdateData = createAllTasksRecordData(
                                                                                                          completed: true,
                                                                                                          status: 'Completed',
                                                                                                        );
                                                                                                        await listViewAllTasksRecord.reference.update(allTasksUpdateData);

                                                                                                        final projectsUpdateData = {
                                                                                                          'completedTasks': FieldValue.increment(1),
                                                                                                        };
                                                                                                        await projectDetailsPage2aProjectsRecord.reference.update(projectsUpdateData);
                                                                                                      } else {
                                                                                                        final allTasksUpdateData = createAllTasksRecordData(
                                                                                                          completed: false,
                                                                                                          status: 'In Progress',
                                                                                                        );
                                                                                                        await listViewAllTasksRecord.reference.update(allTasksUpdateData);

                                                                                                        final projectsUpdateData = {
                                                                                                          'completedTasks': FieldValue.increment(-(1)),
                                                                                                        };
                                                                                                        await widget.projectRef!.reference.update(projectsUpdateData);

                                                                                                        context.pushNamed(
                                                                                                          'projectDetailsPage2a',
                                                                                                          queryParams: {
                                                                                                            'projectRef': serializeParam(
                                                                                                              widget.projectRef,
                                                                                                              ParamType.Document,
                                                                                                            ),
                                                                                                            'tabIndex': serializeParam(
                                                                                                              1,
                                                                                                              ParamType.int,
                                                                                                            ),
                                                                                                          }.withoutNulls,
                                                                                                          extra: <String, dynamic>{
                                                                                                            'projectRef': widget.projectRef,
                                                                                                          },
                                                                                                        );
                                                                                                      }
                                                                                                    },
                                                                                                    title: Text(
                                                                                                      listViewAllTasksRecord.taskName!,
                                                                                                      textAlign: TextAlign.start,
                                                                                                      style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                                    ),
                                                                                                    tileColor: Color(0xFFF5F5F5),
                                                                                                    activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                    checkColor: FlutterFlowTheme.of(context).tertiary,
                                                                                                    dense: true,
                                                                                                    controlAffinity: ListTileControlAffinity.leading,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                          ],
                                                                                        ),
                                                                                      if (projectDetailsPage2aProjectsRecord.owner == currentUserReference)
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 0.0, 0.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                    child: Container(
                                                                                                      height: 32.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: () {
                                                                                                          if (listViewAllTasksRecord.status == 'Not Started') {
                                                                                                            return FlutterFlowTheme.of(context).secondary30;
                                                                                                          } else if (listViewAllTasksRecord.status == 'In Progress') {
                                                                                                            return FlutterFlowTheme.of(context).primary30;
                                                                                                          } else if (listViewAllTasksRecord.status == 'Complete') {
                                                                                                            return FlutterFlowTheme.of(context).tertiary30;
                                                                                                          } else {
                                                                                                            return FlutterFlowTheme.of(context).error30;
                                                                                                          }
                                                                                                        }(),
                                                                                                        borderRadius: BorderRadius.circular(32.0),
                                                                                                        border: Border.all(
                                                                                                          color: () {
                                                                                                            if (listViewAllTasksRecord.status == 'Not Started') {
                                                                                                              return FlutterFlowTheme.of(context).secondary;
                                                                                                            } else if (listViewAllTasksRecord.status == 'In Progress') {
                                                                                                              return FlutterFlowTheme.of(context).primary;
                                                                                                            } else if (listViewAllTasksRecord.status == 'Complete') {
                                                                                                              return FlutterFlowTheme.of(context).alternate;
                                                                                                            } else {
                                                                                                              return FlutterFlowTheme.of(context).tertiary;
                                                                                                            }
                                                                                                          }(),
                                                                                                        ),
                                                                                                      ),
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                        child: Text(
                                                                                                          listViewAllTasksRecord.status!,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Align(
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: FlutterFlowIconButton(
                                                                                                    borderColor: Colors.transparent,
                                                                                                    borderRadius: 30.0,
                                                                                                    borderWidth: 1.0,
                                                                                                    buttonSize: 60.0,
                                                                                                    icon: Icon(
                                                                                                      Icons.remove_red_eye_sharp,
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      size: 20.0,
                                                                                                    ),
                                                                                                    onPressed: () async {
                                                                                                      context.pushNamed(
                                                                                                        'viewTask',
                                                                                                        queryParams: {
                                                                                                          'projectRef': serializeParam(
                                                                                                            projectDetailsPage2aProjectsRecord,
                                                                                                            ParamType.Document,
                                                                                                          ),
                                                                                                          'taskRef': serializeParam(
                                                                                                            listViewAllTasksRecord,
                                                                                                            ParamType.Document,
                                                                                                          ),
                                                                                                        }.withoutNulls,
                                                                                                        extra: <String, dynamic>{
                                                                                                          'projectRef': projectDetailsPage2aProjectsRecord,
                                                                                                          'taskRef': listViewAllTasksRecord,
                                                                                                        },
                                                                                                      );
                                                                                                    },
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      if (projectDetailsPage2aProjectsRecord.owner != currentUserReference)
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 30.0, 0.0),
                                                                                              child: Text(
                                                                                                listViewAllTasksRecord.taskName!,
                                                                                                style: FlutterFlowTheme.of(context).headlineSmall,
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      if (projectDetailsPage2aProjectsRecord.owner != currentUserReference)
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 0.0, 0.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                    child: Container(
                                                                                                      height: 32.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: () {
                                                                                                          if (listViewAllTasksRecord.status == 'Not Started') {
                                                                                                            return FlutterFlowTheme.of(context).secondary30;
                                                                                                          } else if (listViewAllTasksRecord.status == 'In Progress') {
                                                                                                            return FlutterFlowTheme.of(context).primary30;
                                                                                                          } else if (listViewAllTasksRecord.status == 'Complete') {
                                                                                                            return FlutterFlowTheme.of(context).tertiary30;
                                                                                                          } else {
                                                                                                            return FlutterFlowTheme.of(context).error30;
                                                                                                          }
                                                                                                        }(),
                                                                                                        borderRadius: BorderRadius.circular(32.0),
                                                                                                        border: Border.all(
                                                                                                          color: () {
                                                                                                            if (listViewAllTasksRecord.status == 'Not Started') {
                                                                                                              return FlutterFlowTheme.of(context).secondary;
                                                                                                            } else if (listViewAllTasksRecord.status == 'In Progress') {
                                                                                                              return FlutterFlowTheme.of(context).primary;
                                                                                                            } else if (listViewAllTasksRecord.status == 'Complete') {
                                                                                                              return FlutterFlowTheme.of(context).alternate;
                                                                                                            } else {
                                                                                                              return FlutterFlowTheme.of(context).tertiary;
                                                                                                            }
                                                                                                          }(),
                                                                                                        ),
                                                                                                      ),
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                        child: Text(
                                                                                                          listViewAllTasksRecord.status!,
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Align(
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: FlutterFlowIconButton(
                                                                                                    borderColor: Colors.transparent,
                                                                                                    borderRadius: 30.0,
                                                                                                    borderWidth: 1.0,
                                                                                                    buttonSize: 60.0,
                                                                                                    icon: Icon(
                                                                                                      Icons.remove_red_eye_sharp,
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      size: 20.0,
                                                                                                    ),
                                                                                                    onPressed: () async {
                                                                                                      context.pushNamed(
                                                                                                        'viewTask',
                                                                                                        queryParams: {
                                                                                                          'projectRef': serializeParam(
                                                                                                            projectDetailsPage2aProjectsRecord,
                                                                                                            ParamType.Document,
                                                                                                          ),
                                                                                                          'taskRef': serializeParam(
                                                                                                            listViewAllTasksRecord,
                                                                                                            ParamType.Document,
                                                                                                          ),
                                                                                                        }.withoutNulls,
                                                                                                        extra: <String, dynamic>{
                                                                                                          'projectRef': projectDetailsPage2aProjectsRecord,
                                                                                                          'taskRef': listViewAllTasksRecord,
                                                                                                        },
                                                                                                      );
                                                                                                    },
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation2']!),
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                if (widget.projectRef!.owner ==
                                                    currentUserReference)
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.9, 0.75),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 30.0,
                                                      borderWidth: 0.0,
                                                      buttonSize: 60.0,
                                                      fillColor:
                                                          Color(0xFFFA8072),
                                                      icon: Icon(
                                                        Icons.add,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 40.0,
                                                      ),
                                                      onPressed: () async {
                                                        if (Navigator.of(
                                                                context)
                                                            .canPop()) {
                                                          context.pop();
                                                        }
                                                        context.pushNamed(
                                                          'createTask',
                                                          queryParams: {
                                                            'projectRef':
                                                                serializeParam(
                                                              widget.projectRef,
                                                              ParamType
                                                                  .Document,
                                                            ),
                                                          }.withoutNulls,
                                                          extra: <String,
                                                              dynamic>{
                                                            'projectRef': widget
                                                                .projectRef,
                                                            kTransitionInfoKey:
                                                                TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .bottomToTop,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      250),
                                                            ),
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (projectDetailsPage2aProjectsRecord
                                                              .numberTasks! <
                                                          1)
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      50.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '2huepb9o' /* No tasks have been added yet! */,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontSize:
                                                                      18.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily),
                                                                ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (widget.projectRef!.owner ==
                                                    currentUserReference)
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  0.0,
                                                                  20.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -0.7, 0.0),
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                final selectedMedia =
                                                                    await selectMediaWithSourceBottomSheet(
                                                                  context:
                                                                      context,
                                                                  allowPhoto:
                                                                      true,
                                                                );
                                                                if (selectedMedia !=
                                                                        null &&
                                                                    selectedMedia.every((m) =>
                                                                        validateFileFormat(
                                                                            m.storagePath,
                                                                            context))) {
                                                                  setState(() =>
                                                                      _model.isDataUploading2 =
                                                                          true);
                                                                  var selectedUploadedFiles =
                                                                      <FFUploadedFile>[];
                                                                  var downloadUrls =
                                                                      <String>[];
                                                                  try {
                                                                    showUploadMessage(
                                                                      context,
                                                                      'Uploading file...',
                                                                      showLoading:
                                                                          true,
                                                                    );
                                                                    selectedUploadedFiles = selectedMedia
                                                                        .map((m) => FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                              blurHash: m.blurHash,
                                                                            ))
                                                                        .toList();

                                                                    downloadUrls = (await Future
                                                                            .wait(
                                                                      selectedMedia
                                                                          .map(
                                                                        (m) async => await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                      ),
                                                                    ))
                                                                        .where((u) =>
                                                                            u !=
                                                                            null)
                                                                        .map((u) =>
                                                                            u!)
                                                                        .toList();
                                                                  } finally {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .hideCurrentSnackBar();
                                                                    _model.isDataUploading2 =
                                                                        false;
                                                                  }
                                                                  if (selectedUploadedFiles
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length &&
                                                                      downloadUrls
                                                                              .length ==
                                                                          selectedMedia
                                                                              .length) {
                                                                    setState(
                                                                        () {
                                                                      _model.uploadedLocalFile2 =
                                                                          selectedUploadedFiles
                                                                              .first;
                                                                      _model.uploadedFileUrl2 =
                                                                          downloadUrls
                                                                              .first;
                                                                    });
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Success!');
                                                                  } else {
                                                                    setState(
                                                                        () {});
                                                                    showUploadMessage(
                                                                        context,
                                                                        'Failed to upload data');
                                                                    return;
                                                                  }
                                                                }

                                                                final projectsUpdateData =
                                                                    {
                                                                  'gallery':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    _model
                                                                        .uploadedFileUrl1
                                                                  ]),
                                                                };
                                                                await widget
                                                                    .projectRef!
                                                                    .reference
                                                                    .update(
                                                                        projectsUpdateData);
                                                              },
                                                              text: FFLocalizations
                                                                      .of(context)
                                                                  .getText(
                                                                'uokihzc9' /* Upload Image */,
                                                              ),
                                                              icon: Icon(
                                                                Icons.image,
                                                                size: 15.0,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 150.0,
                                                                height: 40.0,
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                iconPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondary,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: Colors
                                                                          .white,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleSmallFamily),
                                                                    ),
                                                                elevation: 2.0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                Expanded(
                                                  child: StreamBuilder<
                                                      ProjectsRecord>(
                                                    stream: ProjectsRecord
                                                        .getDocument(widget
                                                            .projectRef!
                                                            .reference),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      final staggeredViewProjectsRecord =
                                                          snapshot.data!;
                                                      return Builder(
                                                        builder: (context) {
                                                          final galleryItem =
                                                              staggeredViewProjectsRecord
                                                                  .gallery!
                                                                  .toList()
                                                                  .map((e) => e)
                                                                  .toList();
                                                          return MasonryGridView
                                                              .count(
                                                            crossAxisCount: 2,
                                                            crossAxisSpacing:
                                                                10.0,
                                                            mainAxisSpacing:
                                                                10.0,
                                                            itemCount:
                                                                galleryItem
                                                                    .length,
                                                            itemBuilder: (context,
                                                                galleryItemIndex) {
                                                              final galleryItemItem =
                                                                  galleryItem[
                                                                      galleryItemIndex];
                                                              return InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  await Navigator
                                                                      .push(
                                                                    context,
                                                                    PageTransition(
                                                                      type: PageTransitionType
                                                                          .fade,
                                                                      child:
                                                                          FlutterFlowExpandedImageView(
                                                                        image: Image
                                                                            .network(
                                                                          galleryItemItem,
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                        allowRotation:
                                                                            true,
                                                                        tag:
                                                                            galleryItemItem,
                                                                        useHeroAnimation:
                                                                            true,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                                child: Hero(
                                                                  tag:
                                                                      galleryItemItem,
                                                                  transitionOnUserGestures:
                                                                      true,
                                                                  child: Image
                                                                      .network(
                                                                    galleryItemItem,
                                                                    width:
                                                                        100.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
