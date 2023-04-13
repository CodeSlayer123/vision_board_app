import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'activity_record.g.dart';

abstract class ActivityRecord
    implements Built<ActivityRecord, ActivityRecordBuilder> {
  static Serializer<ActivityRecord> get serializer =>
      _$activityRecordSerializer;

  String? get activityName;

  DateTime? get activityTime;

  String? get activityDescription;

  String? get activityType;

  DocumentReference? get projectRef;

  DocumentReference? get otherUser;

  bool? get readState;

  String? get activitySubText;

  DocumentReference? get taskRef;

  BuiltList<DocumentReference>? get targetUserRef;

  BuiltList<DocumentReference>? get unreadByUser;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ActivityRecordBuilder builder) => builder
    ..activityName = ''
    ..activityDescription = ''
    ..activityType = ''
    ..readState = false
    ..activitySubText = ''
    ..targetUserRef = ListBuilder()
    ..unreadByUser = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('activity');

  static Stream<ActivityRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ActivityRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ActivityRecord._();
  factory ActivityRecord([void Function(ActivityRecordBuilder) updates]) =
      _$ActivityRecord;

  static ActivityRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createActivityRecordData({
  String? activityName,
  DateTime? activityTime,
  String? activityDescription,
  String? activityType,
  DocumentReference? projectRef,
  DocumentReference? otherUser,
  bool? readState,
  String? activitySubText,
  DocumentReference? taskRef,
}) {
  final firestoreData = serializers.toFirestore(
    ActivityRecord.serializer,
    ActivityRecord(
      (a) => a
        ..activityName = activityName
        ..activityTime = activityTime
        ..activityDescription = activityDescription
        ..activityType = activityType
        ..projectRef = projectRef
        ..otherUser = otherUser
        ..readState = readState
        ..activitySubText = activitySubText
        ..taskRef = taskRef
        ..targetUserRef = null
        ..unreadByUser = null,
    ),
  );

  return firestoreData;
}
