// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organizations_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<OrganizationsRecord> _$organizationsRecordSerializer =
    new _$OrganizationsRecordSerializer();

class _$OrganizationsRecordSerializer
    implements StructuredSerializer<OrganizationsRecord> {
  @override
  final Iterable<Type> types = const [
    OrganizationsRecord,
    _$OrganizationsRecord
  ];
  @override
  final String wireName = 'OrganizationsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, OrganizationsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.orgName;
    if (value != null) {
      result
        ..add('OrgName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdOn;
    if (value != null) {
      result
        ..add('createdOn')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.orgMembers;
    if (value != null) {
      result
        ..add('OrgMembers')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.orgLogo;
    if (value != null) {
      result
        ..add('OrgLogo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.orgDescription;
    if (value != null) {
      result
        ..add('OrgDescription')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastEdited;
    if (value != null) {
      result
        ..add('lastEdited')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.orgAdmin;
    if (value != null) {
      result
        ..add('OrgAdmin')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.inviteCode;
    if (value != null) {
      result
        ..add('InviteCode')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  OrganizationsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new OrganizationsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'OrgName':
          result.orgName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'createdOn':
          result.createdOn = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'OrgMembers':
          result.orgMembers.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'OrgLogo':
          result.orgLogo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'OrgDescription':
          result.orgDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'lastEdited':
          result.lastEdited = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'OrgAdmin':
          result.orgAdmin = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'InviteCode':
          result.inviteCode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$OrganizationsRecord extends OrganizationsRecord {
  @override
  final String? orgName;
  @override
  final DateTime? createdOn;
  @override
  final BuiltList<DocumentReference<Object?>>? orgMembers;
  @override
  final String? orgLogo;
  @override
  final String? orgDescription;
  @override
  final DateTime? lastEdited;
  @override
  final DocumentReference<Object?>? orgAdmin;
  @override
  final String? inviteCode;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$OrganizationsRecord(
          [void Function(OrganizationsRecordBuilder)? updates]) =>
      (new OrganizationsRecordBuilder()..update(updates))._build();

  _$OrganizationsRecord._(
      {this.orgName,
      this.createdOn,
      this.orgMembers,
      this.orgLogo,
      this.orgDescription,
      this.lastEdited,
      this.orgAdmin,
      this.inviteCode,
      this.ffRef})
      : super._();

  @override
  OrganizationsRecord rebuild(
          void Function(OrganizationsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  OrganizationsRecordBuilder toBuilder() =>
      new OrganizationsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrganizationsRecord &&
        orgName == other.orgName &&
        createdOn == other.createdOn &&
        orgMembers == other.orgMembers &&
        orgLogo == other.orgLogo &&
        orgDescription == other.orgDescription &&
        lastEdited == other.lastEdited &&
        orgAdmin == other.orgAdmin &&
        inviteCode == other.inviteCode &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, orgName.hashCode);
    _$hash = $jc(_$hash, createdOn.hashCode);
    _$hash = $jc(_$hash, orgMembers.hashCode);
    _$hash = $jc(_$hash, orgLogo.hashCode);
    _$hash = $jc(_$hash, orgDescription.hashCode);
    _$hash = $jc(_$hash, lastEdited.hashCode);
    _$hash = $jc(_$hash, orgAdmin.hashCode);
    _$hash = $jc(_$hash, inviteCode.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'OrganizationsRecord')
          ..add('orgName', orgName)
          ..add('createdOn', createdOn)
          ..add('orgMembers', orgMembers)
          ..add('orgLogo', orgLogo)
          ..add('orgDescription', orgDescription)
          ..add('lastEdited', lastEdited)
          ..add('orgAdmin', orgAdmin)
          ..add('inviteCode', inviteCode)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class OrganizationsRecordBuilder
    implements Builder<OrganizationsRecord, OrganizationsRecordBuilder> {
  _$OrganizationsRecord? _$v;

  String? _orgName;
  String? get orgName => _$this._orgName;
  set orgName(String? orgName) => _$this._orgName = orgName;

  DateTime? _createdOn;
  DateTime? get createdOn => _$this._createdOn;
  set createdOn(DateTime? createdOn) => _$this._createdOn = createdOn;

  ListBuilder<DocumentReference<Object?>>? _orgMembers;
  ListBuilder<DocumentReference<Object?>> get orgMembers =>
      _$this._orgMembers ??= new ListBuilder<DocumentReference<Object?>>();
  set orgMembers(ListBuilder<DocumentReference<Object?>>? orgMembers) =>
      _$this._orgMembers = orgMembers;

  String? _orgLogo;
  String? get orgLogo => _$this._orgLogo;
  set orgLogo(String? orgLogo) => _$this._orgLogo = orgLogo;

  String? _orgDescription;
  String? get orgDescription => _$this._orgDescription;
  set orgDescription(String? orgDescription) =>
      _$this._orgDescription = orgDescription;

  DateTime? _lastEdited;
  DateTime? get lastEdited => _$this._lastEdited;
  set lastEdited(DateTime? lastEdited) => _$this._lastEdited = lastEdited;

  DocumentReference<Object?>? _orgAdmin;
  DocumentReference<Object?>? get orgAdmin => _$this._orgAdmin;
  set orgAdmin(DocumentReference<Object?>? orgAdmin) =>
      _$this._orgAdmin = orgAdmin;

  String? _inviteCode;
  String? get inviteCode => _$this._inviteCode;
  set inviteCode(String? inviteCode) => _$this._inviteCode = inviteCode;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  OrganizationsRecordBuilder() {
    OrganizationsRecord._initializeBuilder(this);
  }

  OrganizationsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _orgName = $v.orgName;
      _createdOn = $v.createdOn;
      _orgMembers = $v.orgMembers?.toBuilder();
      _orgLogo = $v.orgLogo;
      _orgDescription = $v.orgDescription;
      _lastEdited = $v.lastEdited;
      _orgAdmin = $v.orgAdmin;
      _inviteCode = $v.inviteCode;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(OrganizationsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$OrganizationsRecord;
  }

  @override
  void update(void Function(OrganizationsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  OrganizationsRecord build() => _build();

  _$OrganizationsRecord _build() {
    _$OrganizationsRecord _$result;
    try {
      _$result = _$v ??
          new _$OrganizationsRecord._(
              orgName: orgName,
              createdOn: createdOn,
              orgMembers: _orgMembers?.build(),
              orgLogo: orgLogo,
              orgDescription: orgDescription,
              lastEdited: lastEdited,
              orgAdmin: orgAdmin,
              inviteCode: inviteCode,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'orgMembers';
        _orgMembers?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'OrganizationsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
