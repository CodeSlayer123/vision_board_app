import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  String? get status;

  String? get userRole;

  String? get userBio;

  BuiltList<DocumentReference>? get tasks;

  @BuiltValueField(wireName: 'OrgRef')
  DocumentReference? get orgRef;

  bool? get isAdmin;

  int? get shortTerms;

  int? get longTerms;

  @BuiltValueField(wireName: 'Communities')
  BuiltList<DocumentReference>? get communities;

  int? get completedProjects;

  bool? get hasCompletedProjects;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..status = ''
    ..userRole = ''
    ..userBio = ''
    ..tasks = ListBuilder()
    ..isAdmin = false
    ..shortTerms = 0
    ..longTerms = 0
    ..communities = ListBuilder()
    ..completedProjects = 0
    ..hasCompletedProjects = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? status,
  String? userRole,
  String? userBio,
  DocumentReference? orgRef,
  bool? isAdmin,
  int? shortTerms,
  int? longTerms,
  int? completedProjects,
  bool? hasCompletedProjects,
}) {
  final firestoreData = serializers.toFirestore(
    UsersRecord.serializer,
    UsersRecord(
      (u) => u
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber
        ..status = status
        ..userRole = userRole
        ..userBio = userBio
        ..tasks = null
        ..orgRef = orgRef
        ..isAdmin = isAdmin
        ..shortTerms = shortTerms
        ..longTerms = longTerms
        ..communities = null
        ..completedProjects = completedProjects
        ..hasCompletedProjects = hasCompletedProjects,
    ),
  );

  return firestoreData;
}
