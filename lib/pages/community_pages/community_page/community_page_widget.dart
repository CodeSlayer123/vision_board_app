import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/drawer_nav/drawer_nav_widget.dart';
import '/components/empty_projects/empty_projects_widget.dart';
import '/components/modal_create_project/modal_create_project_widget.dart';
import '/components/modal_project/modal_project_widget.dart';
import '/components/user_card/user_card_widget.dart';
import '/components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'community_page_model.dart';
export 'community_page_model.dart';

class CommunityPageWidget extends StatefulWidget {
  const CommunityPageWidget({Key? key}) : super(key: key);

  @override
  _CommunityPageWidgetState createState() => _CommunityPageWidgetState();
}

class _CommunityPageWidgetState extends State<CommunityPageWidget>
    with TickerProviderStateMixin {
  late CommunityPageModel _model;

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
          begin: Offset(30.0, 0.0),
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
          begin: Offset(30.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CommunityPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.initialCommunity =
            (currentUserDocument?.communities?.toList() ?? []).first;
      });
    });

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

    return StreamBuilder<OrganizationsRecord>(
      stream: OrganizationsRecord.getDocument(_model.initialCommunity!),
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
        final communityPageOrganizationsRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            drawer: Drawer(
              elevation: 16.0,
              child: wrapWithModel(
                model: _model.drawerNavModel,
                updateCallback: () => setState(() {}),
                child: DrawerNavWidget(),
              ),
            ),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                    ))
                      wrapWithModel(
                        model: _model.webNavModel1,
                        updateCallback: () => setState(() {}),
                        child: WebNavWidget(
                          navBGOne:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          navColorOne:
                              FlutterFlowTheme.of(context).secondaryText,
                          navBgTwo:
                              FlutterFlowTheme.of(context).primaryBackground,
                          navColorTwo: Color(0x93F68FCD),
                          navBgThree:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          navColorThree:
                              FlutterFlowTheme.of(context).secondaryText,
                          navColorFour:
                              FlutterFlowTheme.of(context).secondaryText,
                          navBGFour:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                      ),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 10.0, 16.0, 4.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    if (responsiveVisibility(
                                      context: context,
                                      tablet: false,
                                      tabletLandscape: false,
                                      desktop: false,
                                    ))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 12.0, 0.0),
                                        child: InkWell(
                                          onTap: () async {
                                            scaffoldKey.currentState!
                                                .openDrawer();
                                          },
                                          child: wrapWithModel(
                                            model: _model.userCardModel,
                                            updateCallback: () =>
                                                setState(() {}),
                                            child: UserCardWidget(),
                                          ),
                                        ),
                                      ),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            FFLocalizations.of(context).getText(
                                              'xhrko9y5' /* Our  Visions */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .displaySmall
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .displaySmallFamily,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondary,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .displaySmallFamily),
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 4.0, 0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'mzk1970e' /* Help your community! */,
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (responsiveVisibility(
                                      context: context,
                                      phone: false,
                                      tablet: false,
                                    ))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              barrierColor: Colors.transparent,
                                              context: context,
                                              builder: (bottomSheetContext) {
                                                return GestureDetector(
                                                  onTap: () =>
                                                      FocusScope.of(context)
                                                          .requestFocus(
                                                              _unfocusNode),
                                                  child: Padding(
                                                    padding: MediaQuery.of(
                                                            bottomSheetContext)
                                                        .viewInsets,
                                                    child: Container(
                                                      height: double.infinity,
                                                      child:
                                                          ModalCreateProjectWidget(),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));

                                            FFAppState().update(() {
                                              FFAppState().searchUsers = false;
                                            });
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'e26kmn7t' /* Create Project */,
                                          ),
                                          icon: Icon(
                                            Icons.create_new_folder_rounded,
                                            size: 15.0,
                                          ),
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 20.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
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
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                                tablet: false,
                              ))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 4.0, 24.0),
                                  child: StreamBuilder<List<ProjectsRecord>>(
                                    stream: queryProjectsRecord(
                                      queryBuilder: (projectsRecord) =>
                                          projectsRecord
                                              .where('usersAssigned',
                                                  arrayContains:
                                                      currentUserReference)
                                              .orderBy('lastEdited',
                                                  descending: true),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                          ),
                                        );
                                      }
                                      List<ProjectsRecord>
                                          desktopViewProjectsRecordList =
                                          snapshot.data!;
                                      if (desktopViewProjectsRecordList
                                          .isEmpty) {
                                        return Center(
                                          child: Container(
                                            height: 600.0,
                                            child: EmptyProjectsWidget(
                                              title: 'No Projects',
                                              bodyText:
                                                  'You don\'t have any projects you are assigned too.',
                                            ),
                                          ),
                                        );
                                      }
                                      return Wrap(
                                        spacing: 0.0,
                                        runSpacing: 0.0,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: List.generate(
                                            desktopViewProjectsRecordList
                                                .length, (desktopViewIndex) {
                                          final desktopViewProjectsRecord =
                                              desktopViewProjectsRecordList[
                                                  desktopViewIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 8.0, 12.0, 8.0),
                                            child: Container(
                                              width: 430.0,
                                              constraints: BoxConstraints(
                                                maxHeight: 200.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x34090F13),
                                                    offset: Offset(0.0, 2.0),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: InkWell(
                                                onTap: () async {
                                                  if (MediaQuery.of(context)
                                                          .size
                                                          .width >=
                                                      768.0) {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      barrierColor:
                                                          Color(0x14000000),
                                                      context: context,
                                                      builder:
                                                          (bottomSheetContext) {
                                                        return GestureDetector(
                                                          onTap: () => FocusScope
                                                                  .of(context)
                                                              .requestFocus(
                                                                  _unfocusNode),
                                                          child: Padding(
                                                            padding: MediaQuery.of(
                                                                    bottomSheetContext)
                                                                .viewInsets,
                                                            child:
                                                                ModalProjectWidget(
                                                              projectRef:
                                                                  desktopViewProjectsRecord,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));
                                                  } else {
                                                    context.pushNamed(
                                                      'projectDetailsPage',
                                                      queryParams: {
                                                        'projectRef':
                                                            serializeParam(
                                                          desktopViewProjectsRecord,
                                                          ParamType.Document,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'projectRef':
                                                            desktopViewProjectsRecord,
                                                      },
                                                    );
                                                  }
                                                },
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  0.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  12.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  12.0),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    12.0,
                                                                    12.0,
                                                                    12.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            AutoSizeText(
                                                              desktopViewProjectsRecord
                                                                  .projectName!
                                                                  .maybeHandleOverflow(
                                                                maxChars: 40,
                                                                replacement:
                                                                    '…',
                                                              ),
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineSmallFamily,
                                                                    color: Colors
                                                                        .white,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          12.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                '${desktopViewProjectsRecord.numberTasks?.toString()} tasks',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBtnText,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  12.0,
                                                                  12.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Builder(
                                                            builder: (context) {
                                                              final projectMembers =
                                                                  desktopViewProjectsRecord
                                                                      .usersAssigned!
                                                                      .toList();
                                                              return Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: List.generate(
                                                                    projectMembers
                                                                        .length,
                                                                    (projectMembersIndex) {
                                                                  final projectMembersItem =
                                                                      projectMembers[
                                                                          projectMembersIndex];
                                                                  return FutureBuilder<
                                                                      UsersRecord>(
                                                                    future: UsersRecord
                                                                        .getDocumentOnce(
                                                                            projectMembersItem),
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
                                                                      final userCarUsersRecord =
                                                                          snapshot
                                                                              .data!;
                                                                      return Container(
                                                                        width:
                                                                            40.0,
                                                                        height:
                                                                            40.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0xFFEEEEEE),
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                36.0,
                                                                            height:
                                                                                36.0,
                                                                            clipBehavior:
                                                                                Clip.antiAlias,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              userCarUsersRecord.photoUrl!,
                                                                              fit: BoxFit.fitWidth,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                }),
                                                              );
                                                            },
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        8.0,
                                                                        0.0),
                                                            child: Text(
                                                              dateTimeFormat(
                                                                'relative',
                                                                desktopViewProjectsRecord
                                                                    .lastEdited!,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  12.0,
                                                                  12.0,
                                                                  16.0),
                                                      child:
                                                          LinearPercentIndicator(
                                                        percent: valueOrDefault<
                                                            double>(
                                                          functions
                                                              .progressBarValue(
                                                                  valueOrDefault<
                                                                      int>(
                                                                    desktopViewProjectsRecord
                                                                        .numberTasks,
                                                                    0,
                                                                  ),
                                                                  valueOrDefault<
                                                                      int>(
                                                                    desktopViewProjectsRecord
                                                                        .completedTasks,
                                                                    0,
                                                                  ),
                                                                  desktopViewProjectsRecord,
                                                                  currentUserReference!
                                                                      .id,
                                                                  false),
                                                          0.0,
                                                        ),
                                                        width: 400.0,
                                                        lineHeight: 16.0,
                                                        animation: true,
                                                        progressColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .lineColor,
                                                        barRadius:
                                                            Radius.circular(
                                                                12.0),
                                                        padding:
                                                            EdgeInsets.zero,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'containerOnPageLoadAnimation1']!),
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                ),
                              Divider(
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).accent4,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                    ))
                      wrapWithModel(
                        model: _model.webNavModel2,
                        updateCallback: () => setState(() {}),
                        child: WebNavWidget(
                          navBGOne:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          navColorOne:
                              FlutterFlowTheme.of(context).secondaryText,
                          navBgTwo:
                              FlutterFlowTheme.of(context).primaryBackground,
                          navColorTwo: Color(0x93F68FCD),
                          navBgThree:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          navColorThree:
                              FlutterFlowTheme.of(context).secondaryText,
                          navColorFour:
                              FlutterFlowTheme.of(context).secondaryText,
                          navBGFour:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                      ),
                    Expanded(
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 10.0, 16.0, 4.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          StreamBuilder<
                                              List<OrganizationsRecord>>(
                                            stream: queryOrganizationsRecord(
                                              queryBuilder: (organizationsRecord) =>
                                                  organizationsRecord.where(
                                                      'OrgMembers',
                                                      arrayContains:
                                                          currentUserReference),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50.0,
                                                    height: 50.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<OrganizationsRecord>
                                                  rowOrganizationsRecordList =
                                                  snapshot.data!;
                                              return Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: List.generate(
                                                    rowOrganizationsRecordList
                                                        .length, (rowIndex) {
                                                  final rowOrganizationsRecord =
                                                      rowOrganizationsRecordList[
                                                          rowIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                5.0, 0.0),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        setState(() {
                                                          _model.community =
                                                              rowOrganizationsRecord;
                                                        });
                                                      },
                                                      child: Container(
                                                        width: 50.0,
                                                        height: 50.0,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          'https://picsum.photos/seed/551/600',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (responsiveVisibility(
                                      context: context,
                                      phone: false,
                                      tablet: false,
                                    ))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              barrierColor: Colors.transparent,
                                              context: context,
                                              builder: (bottomSheetContext) {
                                                return GestureDetector(
                                                  onTap: () =>
                                                      FocusScope.of(context)
                                                          .requestFocus(
                                                              _unfocusNode),
                                                  child: Padding(
                                                    padding: MediaQuery.of(
                                                            bottomSheetContext)
                                                        .viewInsets,
                                                    child: Container(
                                                      height: double.infinity,
                                                      child:
                                                          ModalCreateProjectWidget(),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));

                                            FFAppState().update(() {
                                              FFAppState().searchUsers = false;
                                            });
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            'dnk9in7a' /* Create Project */,
                                          ),
                                          icon: Icon(
                                            Icons.create_new_folder_rounded,
                                            size: 15.0,
                                          ),
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 0.0, 20.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
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
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              if (responsiveVisibility(
                                context: context,
                                phone: false,
                                tablet: false,
                              ))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 4.0, 24.0),
                                  child: StreamBuilder<List<ProjectsRecord>>(
                                    stream: queryProjectsRecord(
                                      queryBuilder: (projectsRecord) =>
                                          projectsRecord
                                              .where('usersAssigned',
                                                  arrayContains:
                                                      currentUserReference)
                                              .orderBy('lastEdited',
                                                  descending: true),
                                    ),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 50.0,
                                            height: 50.0,
                                            child: CircularProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                            ),
                                          ),
                                        );
                                      }
                                      List<ProjectsRecord>
                                          desktopViewProjectsRecordList =
                                          snapshot.data!;
                                      if (desktopViewProjectsRecordList
                                          .isEmpty) {
                                        return Center(
                                          child: Container(
                                            height: 600.0,
                                            child: EmptyProjectsWidget(
                                              title: 'No Projects',
                                              bodyText:
                                                  'You don\'t have any projects you are assigned too.',
                                            ),
                                          ),
                                        );
                                      }
                                      return Wrap(
                                        spacing: 0.0,
                                        runSpacing: 0.0,
                                        alignment: WrapAlignment.start,
                                        crossAxisAlignment:
                                            WrapCrossAlignment.start,
                                        direction: Axis.horizontal,
                                        runAlignment: WrapAlignment.start,
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: List.generate(
                                            desktopViewProjectsRecordList
                                                .length, (desktopViewIndex) {
                                          final desktopViewProjectsRecord =
                                              desktopViewProjectsRecordList[
                                                  desktopViewIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 8.0, 12.0, 8.0),
                                            child: Container(
                                              width: 430.0,
                                              constraints: BoxConstraints(
                                                maxHeight: 200.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x34090F13),
                                                    offset: Offset(0.0, 2.0),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: InkWell(
                                                onTap: () async {
                                                  if (MediaQuery.of(context)
                                                          .size
                                                          .width >=
                                                      768.0) {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      barrierColor:
                                                          Color(0x14000000),
                                                      context: context,
                                                      builder:
                                                          (bottomSheetContext) {
                                                        return GestureDetector(
                                                          onTap: () => FocusScope
                                                                  .of(context)
                                                              .requestFocus(
                                                                  _unfocusNode),
                                                          child: Padding(
                                                            padding: MediaQuery.of(
                                                                    bottomSheetContext)
                                                                .viewInsets,
                                                            child:
                                                                ModalProjectWidget(
                                                              projectRef:
                                                                  desktopViewProjectsRecord,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ).then((value) =>
                                                        setState(() {}));
                                                  } else {
                                                    context.pushNamed(
                                                      'projectDetailsPage',
                                                      queryParams: {
                                                        'projectRef':
                                                            serializeParam(
                                                          desktopViewProjectsRecord,
                                                          ParamType.Document,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'projectRef':
                                                            desktopViewProjectsRecord,
                                                      },
                                                    );
                                                  }
                                                },
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  0.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  0.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  12.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  12.0),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    12.0,
                                                                    12.0,
                                                                    12.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            AutoSizeText(
                                                              desktopViewProjectsRecord
                                                                  .projectName!
                                                                  .maybeHandleOverflow(
                                                                maxChars: 40,
                                                                replacement:
                                                                    '…',
                                                              ),
                                                              maxLines: 1,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineSmallFamily,
                                                                    color: Colors
                                                                        .white,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          12.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                '${desktopViewProjectsRecord.numberTasks?.toString()} tasks',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBtnText,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  12.0,
                                                                  12.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Builder(
                                                            builder: (context) {
                                                              final projectMembers =
                                                                  desktopViewProjectsRecord
                                                                      .usersAssigned!
                                                                      .toList();
                                                              return Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: List.generate(
                                                                    projectMembers
                                                                        .length,
                                                                    (projectMembersIndex) {
                                                                  final projectMembersItem =
                                                                      projectMembers[
                                                                          projectMembersIndex];
                                                                  return FutureBuilder<
                                                                      UsersRecord>(
                                                                    future: UsersRecord
                                                                        .getDocumentOnce(
                                                                            projectMembersItem),
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
                                                                      final userCarUsersRecord =
                                                                          snapshot
                                                                              .data!;
                                                                      return Container(
                                                                        width:
                                                                            40.0,
                                                                        height:
                                                                            40.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0xFFEEEEEE),
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                36.0,
                                                                            height:
                                                                                36.0,
                                                                            clipBehavior:
                                                                                Clip.antiAlias,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              userCarUsersRecord.photoUrl!,
                                                                              fit: BoxFit.fitWidth,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                }),
                                                              );
                                                            },
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        8.0,
                                                                        0.0),
                                                            child: Text(
                                                              dateTimeFormat(
                                                                'relative',
                                                                desktopViewProjectsRecord
                                                                    .lastEdited!,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  12.0,
                                                                  12.0,
                                                                  16.0),
                                                      child:
                                                          LinearPercentIndicator(
                                                        percent: valueOrDefault<
                                                            double>(
                                                          functions
                                                              .progressBarValue(
                                                                  valueOrDefault<
                                                                      int>(
                                                                    desktopViewProjectsRecord
                                                                        .numberTasks,
                                                                    0,
                                                                  ),
                                                                  valueOrDefault<
                                                                      int>(
                                                                    desktopViewProjectsRecord
                                                                        .completedTasks,
                                                                    0,
                                                                  ),
                                                                  desktopViewProjectsRecord,
                                                                  currentUserReference!
                                                                      .id,
                                                                  false),
                                                          0.0,
                                                        ),
                                                        width: 400.0,
                                                        lineHeight: 16.0,
                                                        animation: true,
                                                        progressColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        backgroundColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .lineColor,
                                                        barRadius:
                                                            Radius.circular(
                                                                12.0),
                                                        padding:
                                                            EdgeInsets.zero,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'containerOnPageLoadAnimation2']!),
                                          );
                                        }),
                                      );
                                    },
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                if (responsiveVisibility(
                  context: context,
                  tabletLandscape: false,
                  desktop: false,
                ))
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: DefaultTabController(
                        length: 2,
                        initialIndex: 0,
                        child: Column(
                          children: [
                            TabBar(
                              isScrollable: true,
                              labelColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              unselectedLabelColor:
                                  FlutterFlowTheme.of(context).secondaryText,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                              indicatorColor: Color(0xFF897DEE),
                              tabs: [
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    's48zkxhm' /* Short Term Visions */,
                                  ),
                                ),
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    '2u4laz59' /* Long Term Visions */,
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: TabBarView(
                                children: [
                                  Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.45),
                                        child:
                                            StreamBuilder<List<ProjectsRecord>>(
                                          stream: queryProjectsRecord(
                                            queryBuilder: (projectsRecord) =>
                                                projectsRecord
                                                    .where('term',
                                                        isEqualTo: 'Short Term')
                                                    .where('completed',
                                                        isNotEqualTo: true)
                                                    .whereIn(
                                                        'owner',
                                                        _model.community != null
                                                            ? _model.community!
                                                                .orgMembers!
                                                                .toList()
                                                            : communityPageOrganizationsRecord
                                                                .orgMembers!
                                                                .toList()),
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<ProjectsRecord>
                                                staggeredViewProjectsRecordList =
                                                snapshot.data!;
                                            return MasonryGridView.count(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 10.0,
                                              mainAxisSpacing: 10.0,
                                              itemCount:
                                                  staggeredViewProjectsRecordList
                                                      .length,
                                              itemBuilder: (context,
                                                  staggeredViewIndex) {
                                                final staggeredViewProjectsRecord =
                                                    staggeredViewProjectsRecordList[
                                                        staggeredViewIndex];
                                                return InkWell(
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'projectDetailsPage2a',
                                                      queryParams: {
                                                        'projectRef':
                                                            serializeParam(
                                                          staggeredViewProjectsRecord,
                                                          ParamType.Document,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        'projectRef':
                                                            staggeredViewProjectsRecord,
                                                      },
                                                    );
                                                  },
                                                  child: Image.network(
                                                    staggeredViewProjectsRecord
                                                        .image!,
                                                    fit: BoxFit.cover,
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (valueOrDefault(
                                                  currentUserDocument
                                                      ?.shortTerms,
                                                  0) <
                                              1)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 100.0, 0.0, 0.0),
                                              child: AuthUserStreamWidget(
                                                builder: (context) => Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'r5ocotv3' /* There are no current short ter... */,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 18.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Stack(
                                    children: [
                                      StreamBuilder<List<ProjectsRecord>>(
                                        stream: queryProjectsRecord(
                                          queryBuilder: (projectsRecord) =>
                                              projectsRecord
                                                  .where('term',
                                                      isEqualTo: 'Long Term')
                                                  .where('completed',
                                                      isNotEqualTo: true)
                                                  .whereIn(
                                                      'owner',
                                                      _model.community!
                                                          .orgMembers!
                                                          .toList()),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                ),
                                              ),
                                            );
                                          }
                                          List<ProjectsRecord>
                                              staggeredViewProjectsRecordList =
                                              snapshot.data!;
                                          return MasonryGridView.count(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 10.0,
                                            mainAxisSpacing: 10.0,
                                            itemCount:
                                                staggeredViewProjectsRecordList
                                                    .length,
                                            itemBuilder:
                                                (context, staggeredViewIndex) {
                                              final staggeredViewProjectsRecord =
                                                  staggeredViewProjectsRecordList[
                                                      staggeredViewIndex];
                                              return InkWell(
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'projectDetailsPage2a',
                                                    queryParams: {
                                                      'projectRef':
                                                          serializeParam(
                                                        staggeredViewProjectsRecord,
                                                        ParamType.Document,
                                                      ),
                                                    }.withoutNulls,
                                                    extra: <String, dynamic>{
                                                      'projectRef':
                                                          staggeredViewProjectsRecord,
                                                    },
                                                  );
                                                },
                                                child: Image.network(
                                                  staggeredViewProjectsRecord
                                                      .image!,
                                                  fit: BoxFit.cover,
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if (valueOrDefault(
                                                  currentUserDocument
                                                      ?.longTerms,
                                                  0) <
                                              1)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 100.0, 0.0, 0.0),
                                              child: AuthUserStreamWidget(
                                                builder: (context) => Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'lrf52knm' /* There are no current long term... */,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        fontSize: 18.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
                                                ),
                                              ),
                                            ),
                                        ],
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
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
