import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'vision_cards_model.dart';
export 'vision_cards_model.dart';

class VisionCardsWidget extends StatefulWidget {
  const VisionCardsWidget({Key? key}) : super(key: key);

  @override
  _VisionCardsWidgetState createState() => _VisionCardsWidgetState();
}

class _VisionCardsWidgetState extends State<VisionCardsWidget> {
  late VisionCardsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VisionCardsModel());

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

    return StreamBuilder<List<ProjectsRecord>>(
      stream: queryProjectsRecord(
        queryBuilder: (projectsRecord) =>
            projectsRecord.where('term', isEqualTo: 'Short Term'),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: Image.network(
              '',
            ),
          );
        }
        List<ProjectsRecord> staggeredViewProjectsRecordList = snapshot.data!;
        return MasonryGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          itemCount: staggeredViewProjectsRecordList.length,
          itemBuilder: (context, staggeredViewIndex) {
            final staggeredViewProjectsRecord =
                staggeredViewProjectsRecordList[staggeredViewIndex];
            return InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed(
                  'projectDetailsPage2a',
                  queryParams: {
                    'projectRef': serializeParam(
                      staggeredViewProjectsRecord,
                      ParamType.Document,
                    ),
                  }.withoutNulls,
                  extra: <String, dynamic>{
                    'projectRef': staggeredViewProjectsRecord,
                  },
                );
              },
              child: Image.network(
                staggeredViewProjectsRecord.image!,
                fit: BoxFit.cover,
              ),
            );
          },
        );
      },
    );
  }
}
