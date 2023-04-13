import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'test_model.dart';
export 'test_model.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({Key? key}) : super(key: key);

  @override
  _TestWidgetState createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> with TickerProviderStateMixin {
  late TestModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
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
    _model = createModel(context, () => TestModel());

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

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FFButtonWidget(
            onPressed: () async {
              context.safePop();
            },
            text: FFLocalizations.of(context).getText(
              'uvqd315t' /* <- */,
            ),
            options: FFButtonOptions(
              width: 130.0,
              height: 40.0,
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                    color: Colors.white,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).titleSmallFamily),
                  ),
              elevation: 2.0,
              borderSide: BorderSide(
                color: Colors.transparent,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              '7teaxelb' /* Page Title */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium,
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          child: StreamBuilder<List<AllTasksRecord>>(
            stream: queryAllTasksRecord(),
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
              List<AllTasksRecord> listViewAllTasksRecordList = snapshot.data!;
              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: listViewAllTasksRecordList.length,
                itemBuilder: (context, listViewIndex) {
                  final listViewAllTasksRecord =
                      listViewAllTasksRecordList[listViewIndex];
                  return Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 8.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).lineColor,
                          width: 2.0,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Theme(
                                  data: ThemeData(
                                    unselectedWidgetColor: Color(0xFF95A1AC),
                                  ),
                                  child: CheckboxListTile(
                                    value: _model.checkboxListTileValueMap[
                                            listViewAllTasksRecord] ??=
                                        listViewAllTasksRecord.completed!,
                                    onChanged: (newValue) async {
                                      setState(() => _model
                                              .checkboxListTileValueMap[
                                          listViewAllTasksRecord] = newValue!);
                                      if (newValue!) {
                                        final allTasksUpdateData1 =
                                            createAllTasksRecordData(
                                          completed: true,
                                        );
                                        await listViewAllTasksRecord.reference
                                            .update(allTasksUpdateData1);

                                        final allTasksUpdateData2 =
                                            createAllTasksRecordData(
                                          status: 'Completed',
                                        );
                                        await listViewAllTasksRecord.reference
                                            .update(allTasksUpdateData2);
                                      } else {
                                        final allTasksUpdateData1 =
                                            createAllTasksRecordData(
                                          completed: false,
                                        );
                                        await listViewAllTasksRecord.reference
                                            .update(allTasksUpdateData1);

                                        final allTasksUpdateData2 =
                                            createAllTasksRecordData(
                                          status: 'In Progress',
                                        );
                                        await listViewAllTasksRecord.reference
                                            .update(allTasksUpdateData2);
                                      }
                                    },
                                    title: Text(
                                      listViewAllTasksRecord.taskName!,
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall,
                                    ),
                                    tileColor: Color(0xFFF5F5F5),
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    dense: true,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                  ),
                                ),
                              ),
                              Container(
                                height: 32.0,
                                decoration: BoxDecoration(
                                  color: () {
                                    if (listViewAllTasksRecord.status ==
                                        'Not Started') {
                                      return FlutterFlowTheme.of(context)
                                          .secondary30;
                                    } else if (listViewAllTasksRecord.status ==
                                        'In Progress') {
                                      return FlutterFlowTheme.of(context)
                                          .primary30;
                                    } else if (listViewAllTasksRecord.status ==
                                        'Complete') {
                                      return FlutterFlowTheme.of(context)
                                          .tertiary30;
                                    } else {
                                      return FlutterFlowTheme.of(context)
                                          .error30;
                                    }
                                  }(),
                                  borderRadius: BorderRadius.circular(32.0),
                                  border: Border.all(
                                    color: () {
                                      if (listViewAllTasksRecord.status ==
                                          'Not Started') {
                                        return FlutterFlowTheme.of(context)
                                            .secondary;
                                      } else if (listViewAllTasksRecord
                                              .status ==
                                          'In Progress') {
                                        return FlutterFlowTheme.of(context)
                                            .primary;
                                      } else if (listViewAllTasksRecord
                                              .status ==
                                          'Complete') {
                                        return FlutterFlowTheme.of(context)
                                            .alternate;
                                      } else {
                                        return FlutterFlowTheme.of(context)
                                            .tertiary;
                                      }
                                    }(),
                                  ),
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  child: Text(
                                    listViewAllTasksRecord.status!,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(
                            height: 20.0,
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).lineColor,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 0.0, 10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'r9zkzajt' /* Due */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontWeight: FontWeight.bold,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    listViewAllTasksRecord.dueDate!.toString(),
                                    style:
                                        FlutterFlowTheme.of(context).bodySmall,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation']!),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
