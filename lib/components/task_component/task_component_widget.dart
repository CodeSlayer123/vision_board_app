import '/backend/backend.dart';
import '/components/modal_task_details/modal_task_details_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'task_component_model.dart';
export 'task_component_model.dart';

class TaskComponentWidget extends StatefulWidget {
  const TaskComponentWidget({
    Key? key,
    this.taskRef,
  }) : super(key: key);

  final AllTasksRecord? taskRef;

  @override
  _TaskComponentWidgetState createState() => _TaskComponentWidgetState();
}

class _TaskComponentWidgetState extends State<TaskComponentWidget>
    with TickerProviderStateMixin {
  late TaskComponentModel _model;

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
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TaskComponentModel());

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
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
      child: InkWell(
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () async {
          if (MediaQuery.of(context).size.width >= 728.0) {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              barrierColor: Color(0x0A000000),
              context: context,
              builder: (bottomSheetContext) {
                return Padding(
                  padding: MediaQuery.of(bottomSheetContext).viewInsets,
                  child: Container(
                    height: double.infinity,
                    child: ModalTaskDetailsWidget(
                      taskRef: widget.taskRef,
                    ),
                  ),
                );
              },
            ).then((value) => setState(() {}));
          } else {
            context.pushNamed(
              'taskDetails',
              queryParams: {
                'taskRef': serializeParam(
                  widget.taskRef,
                  ParamType.Document,
                ),
              }.withoutNulls,
              extra: <String, dynamic>{
                'taskRef': widget.taskRef,
              },
            );
          }
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: () {
              if (widget.taskRef!.status == 'Not Started') {
                return FlutterFlowTheme.of(context).secondary30;
              } else if (widget.taskRef!.status == 'In Progress') {
                return FlutterFlowTheme.of(context).primary30;
              } else if (widget.taskRef!.status == 'Complete') {
                return FlutterFlowTheme.of(context).tertiary30;
              } else {
                return FlutterFlowTheme.of(context).error30;
              }
            }(),
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(
              color: () {
                if (widget.taskRef!.status == 'Not Started') {
                  return FlutterFlowTheme.of(context).secondary;
                } else if (widget.taskRef!.status == 'In Progress') {
                  return FlutterFlowTheme.of(context).primary;
                } else if (widget.taskRef!.status == 'Complete') {
                  return FlutterFlowTheme.of(context).alternate;
                } else {
                  return FlutterFlowTheme.of(context).tertiary;
                }
              }(),
              width: 2.0,
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
            child: FutureBuilder<ProjectsRecord>(
              future:
                  ProjectsRecord.getDocumentOnce(widget.taskRef!.projectRef!),
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
                final columnProjectsRecord = snapshot.data!;
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 12.0, 0.0),
                            child: Text(
                              widget.taskRef!.taskName!,
                              style: FlutterFlowTheme.of(context).headlineSmall,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                      child: Text(
                        columnProjectsRecord.projectName!,
                        style: FlutterFlowTheme.of(context).bodySmall,
                      ),
                    ),
                    Divider(
                      height: 24.0,
                      thickness: 1.0,
                      color: FlutterFlowTheme.of(context).lineColor,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'uuuaezib' /* Completed */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontWeight: FontWeight.bold,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 0.0, 0.0),
                          child: Text(
                            dateTimeFormat(
                              'MMMEd',
                              widget.taskRef!.dueDate!,
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                            style: FlutterFlowTheme.of(context).bodySmall,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              4.0, 0.0, 0.0, 0.0),
                          child: Text(
                            dateTimeFormat(
                              'jm',
                              widget.taskRef!.dueDate!,
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                            style: FlutterFlowTheme.of(context).bodySmall,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right_rounded,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 24.0,
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
    );
  }
}
