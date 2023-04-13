import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/modal_create_project/modal_create_project_widget.dart';
import '/components/user_card/user_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'new_community_model.dart';
export 'new_community_model.dart';

class NewCommunityWidget extends StatefulWidget {
  const NewCommunityWidget({Key? key}) : super(key: key);

  @override
  _NewCommunityWidgetState createState() => _NewCommunityWidgetState();
}

class _NewCommunityWidgetState extends State<NewCommunityWidget> {
  late NewCommunityModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NewCommunityModel());

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

    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<OrganizationsRecord>(
        stream: OrganizationsRecord.getDocument(
            (currentUserDocument?.communities?.toList() ?? []).first),
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
          final newCommunityOrganizationsRecord = snapshot.data!;
          return GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 16.0, 4.0),
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
                                  scaffoldKey.currentState!.openDrawer();
                                },
                                child: wrapWithModel(
                                  model: _model.userCardModel,
                                  updateCallback: () => setState(() {}),
                                  child: UserCardWidget(),
                                ),
                              ),
                            ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'v59i6qvm' /* Our  Visions */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .displaySmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .displaySmallFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .displaySmallFamily),
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '8daglvaa' /* Help your community! */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodySmall,
                                  ),
                                ),
                                Text(
                                  valueOrDefault<String>(
                                    _model.community != null
                                        ? _model.community!.orgName
                                        : 'Hello World',
                                    'Hello World',
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
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
                                    backgroundColor: Colors.transparent,
                                    barrierColor: Colors.transparent,
                                    context: context,
                                    builder: (bottomSheetContext) {
                                      return GestureDetector(
                                        onTap: () => FocusScope.of(context)
                                            .requestFocus(_unfocusNode),
                                        child: Padding(
                                          padding:
                                              MediaQuery.of(bottomSheetContext)
                                                  .viewInsets,
                                          child: Container(
                                            height: double.infinity,
                                            child: ModalCreateProjectWidget(),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));

                                  FFAppState().update(() {
                                    FFAppState().searchUsers = false;
                                  });
                                },
                                text: FFLocalizations.of(context).getText(
                                  'bge70j4y' /* Create Project */,
                                ),
                                icon: Icon(
                                  Icons.create_new_folder_rounded,
                                  size: 15.0,
                                ),
                                options: FFButtonOptions(
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 20.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: Colors.white,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily),
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                      child: StreamBuilder<List<OrganizationsRecord>>(
                        stream: queryOrganizationsRecord(
                          queryBuilder: (organizationsRecord) =>
                              organizationsRecord.where('OrgMembers',
                                  arrayContains: currentUserReference),
                        ),
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
                          List<OrganizationsRecord> rowOrganizationsRecordList =
                              snapshot.data!;
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(
                                  rowOrganizationsRecordList.length,
                                  (rowIndex) {
                                final rowOrganizationsRecord =
                                    rowOrganizationsRecordList[rowIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 5.0, 0.0),
                                  child: InkWell(
                                    onTap: () async {
                                      setState(() {
                                        _model.community =
                                            rowOrganizationsRecord;
                                      });
                                    },
                                    child: Container(
                                      width: 70.0,
                                      height: 70.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        rowOrganizationsRecord.orgLogo!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
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
                                    's4wbv7sv' /* Short Term Visions */,
                                  ),
                                ),
                                Tab(
                                  text: FFLocalizations.of(context).getText(
                                    'xrra6vyy' /* Long Term Visions */,
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
                                                    .whereIn(
                                                        'owner',
                                                        _model.community != null
                                                            ? _model.community!
                                                                .orgMembers!
                                                                .toList()
                                                            : newCommunityOrganizationsRecord
                                                                .orgMembers!
                                                                .toList())
                                                    .where('term',
                                                        isEqualTo: 'Short Term')
                                                    .where('completed',
                                                        isEqualTo: false),
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
                                          if ((currentUserDocument?.communities
                                                          ?.toList() ??
                                                      [])
                                                  .length <
                                              1)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 100.0, 0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'zxdk72cm' /* You haven't joined any communi... */,
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                                      isEqualTo: false)
                                                  .whereIn(
                                                      'owner',
                                                      _model.community != null
                                                          ? _model.community!
                                                              .orgMembers!
                                                              .toList()
                                                          : newCommunityOrganizationsRecord
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
                                              return Image.network(
                                                staggeredViewProjectsRecord
                                                    .image!,
                                                fit: BoxFit.cover,
                                              );
                                            },
                                          );
                                        },
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if ((currentUserDocument?.communities
                                                          ?.toList() ??
                                                      [])
                                                  .length <
                                              1)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 100.0, 0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'cwe20h6u' /* You haven't joined a community... */,
                                                ),
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
