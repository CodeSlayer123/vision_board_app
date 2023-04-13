import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'organizations_record.g.dart';

abstract class OrganizationsRecord
    implements Built<OrganizationsRecord, OrganizationsRecordBuilder> {
  static Serializer<OrganizationsRecord> get serializer =>
      _$organizationsRecordSerializer;

  @BuiltValueField(wireName: 'OrgName')
  String? get orgName;

  DateTime? get createdOn;

  @BuiltValueField(wireName: 'OrgMembers')
  BuiltList<DocumentReference>? get orgMembers;

  @BuiltValueField(wireName: 'OrgLogo')
  String? get orgLogo;

  @BuiltValueField(wireName: 'OrgDescription')
  String? get orgDescription;

  DateTime? get lastEdited;

  @BuiltValueField(wireName: 'OrgAdmin')
  DocumentReference? get orgAdmin;

  @BuiltValueField(wireName: 'InviteCode')
  String? get inviteCode;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(OrganizationsRecordBuilder builder) => builder
    ..orgName = ''
    ..orgMembers = ListBuilder()
    ..orgLogo = ''
    ..orgDescription = ''
    ..inviteCode = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('organizations');

  static Stream<OrganizationsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<OrganizationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  OrganizationsRecord._();
  factory OrganizationsRecord(
          [void Function(OrganizationsRecordBuilder) updates]) =
      _$OrganizationsRecord;

  static OrganizationsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createOrganizationsRecordData({
  String? orgName,
  DateTime? createdOn,
  String? orgLogo,
  String? orgDescription,
  DateTime? lastEdited,
  DocumentReference? orgAdmin,
  String? inviteCode,
}) {
  final firestoreData = serializers.toFirestore(
    OrganizationsRecord.serializer,
    OrganizationsRecord(
      (o) => o
        ..orgName = orgName
        ..createdOn = createdOn
        ..orgMembers = null
        ..orgLogo = orgLogo
        ..orgDescription = orgDescription
        ..lastEdited = lastEdited
        ..orgAdmin = orgAdmin
        ..inviteCode = inviteCode,
    ),
  );

  return firestoreData;
}
