// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersRecord> _$usersRecordSerializer = new _$UsersRecordSerializer();

class _$UsersRecordSerializer implements StructuredSerializer<UsersRecord> {
  @override
  final Iterable<Type> types = const [UsersRecord, _$UsersRecord];
  @override
  final String wireName = 'UsersRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, UsersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userRole;
    if (value != null) {
      result
        ..add('userRole')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.userBio;
    if (value != null) {
      result
        ..add('userBio')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tasks;
    if (value != null) {
      result
        ..add('tasks')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.orgRef;
    if (value != null) {
      result
        ..add('OrgRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.isAdmin;
    if (value != null) {
      result
        ..add('isAdmin')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.shortTerms;
    if (value != null) {
      result
        ..add('shortTerms')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.longTerms;
    if (value != null) {
      result
        ..add('longTerms')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.communities;
    if (value != null) {
      result
        ..add('Communities')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.completedProjects;
    if (value != null) {
      result
        ..add('completedProjects')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  UsersRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'userRole':
          result.userRole = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'userBio':
          result.userBio = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'tasks':
          result.tasks.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'OrgRef':
          result.orgRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'isAdmin':
          result.isAdmin = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'shortTerms':
          result.shortTerms = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'longTerms':
          result.longTerms = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'Communities':
          result.communities.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'completedProjects':
          result.completedProjects = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$UsersRecord extends UsersRecord {
  @override
  final String? email;
  @override
  final String? displayName;
  @override
  final String? photoUrl;
  @override
  final String? uid;
  @override
  final DateTime? createdTime;
  @override
  final String? phoneNumber;
  @override
  final String? status;
  @override
  final String? userRole;
  @override
  final String? userBio;
  @override
  final BuiltList<DocumentReference<Object?>>? tasks;
  @override
  final DocumentReference<Object?>? orgRef;
  @override
  final bool? isAdmin;
  @override
  final int? shortTerms;
  @override
  final int? longTerms;
  @override
  final BuiltList<DocumentReference<Object?>>? communities;
  @override
  final int? completedProjects;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$UsersRecord([void Function(UsersRecordBuilder)? updates]) =>
      (new UsersRecordBuilder()..update(updates))._build();

  _$UsersRecord._(
      {this.email,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.phoneNumber,
      this.status,
      this.userRole,
      this.userBio,
      this.tasks,
      this.orgRef,
      this.isAdmin,
      this.shortTerms,
      this.longTerms,
      this.communities,
      this.completedProjects,
      this.ffRef})
      : super._();

  @override
  UsersRecord rebuild(void Function(UsersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersRecordBuilder toBuilder() => new UsersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersRecord &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        status == other.status &&
        userRole == other.userRole &&
        userBio == other.userBio &&
        tasks == other.tasks &&
        orgRef == other.orgRef &&
        isAdmin == other.isAdmin &&
        shortTerms == other.shortTerms &&
        longTerms == other.longTerms &&
        communities == other.communities &&
        completedProjects == other.completedProjects &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jc(_$hash, photoUrl.hashCode);
    _$hash = $jc(_$hash, uid.hashCode);
    _$hash = $jc(_$hash, createdTime.hashCode);
    _$hash = $jc(_$hash, phoneNumber.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, userRole.hashCode);
    _$hash = $jc(_$hash, userBio.hashCode);
    _$hash = $jc(_$hash, tasks.hashCode);
    _$hash = $jc(_$hash, orgRef.hashCode);
    _$hash = $jc(_$hash, isAdmin.hashCode);
    _$hash = $jc(_$hash, shortTerms.hashCode);
    _$hash = $jc(_$hash, longTerms.hashCode);
    _$hash = $jc(_$hash, communities.hashCode);
    _$hash = $jc(_$hash, completedProjects.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UsersRecord')
          ..add('email', email)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('status', status)
          ..add('userRole', userRole)
          ..add('userBio', userBio)
          ..add('tasks', tasks)
          ..add('orgRef', orgRef)
          ..add('isAdmin', isAdmin)
          ..add('shortTerms', shortTerms)
          ..add('longTerms', longTerms)
          ..add('communities', communities)
          ..add('completedProjects', completedProjects)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class UsersRecordBuilder implements Builder<UsersRecord, UsersRecordBuilder> {
  _$UsersRecord? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  String? _userRole;
  String? get userRole => _$this._userRole;
  set userRole(String? userRole) => _$this._userRole = userRole;

  String? _userBio;
  String? get userBio => _$this._userBio;
  set userBio(String? userBio) => _$this._userBio = userBio;

  ListBuilder<DocumentReference<Object?>>? _tasks;
  ListBuilder<DocumentReference<Object?>> get tasks =>
      _$this._tasks ??= new ListBuilder<DocumentReference<Object?>>();
  set tasks(ListBuilder<DocumentReference<Object?>>? tasks) =>
      _$this._tasks = tasks;

  DocumentReference<Object?>? _orgRef;
  DocumentReference<Object?>? get orgRef => _$this._orgRef;
  set orgRef(DocumentReference<Object?>? orgRef) => _$this._orgRef = orgRef;

  bool? _isAdmin;
  bool? get isAdmin => _$this._isAdmin;
  set isAdmin(bool? isAdmin) => _$this._isAdmin = isAdmin;

  int? _shortTerms;
  int? get shortTerms => _$this._shortTerms;
  set shortTerms(int? shortTerms) => _$this._shortTerms = shortTerms;

  int? _longTerms;
  int? get longTerms => _$this._longTerms;
  set longTerms(int? longTerms) => _$this._longTerms = longTerms;

  ListBuilder<DocumentReference<Object?>>? _communities;
  ListBuilder<DocumentReference<Object?>> get communities =>
      _$this._communities ??= new ListBuilder<DocumentReference<Object?>>();
  set communities(ListBuilder<DocumentReference<Object?>>? communities) =>
      _$this._communities = communities;

  int? _completedProjects;
  int? get completedProjects => _$this._completedProjects;
  set completedProjects(int? completedProjects) =>
      _$this._completedProjects = completedProjects;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  UsersRecordBuilder() {
    UsersRecord._initializeBuilder(this);
  }

  UsersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _status = $v.status;
      _userRole = $v.userRole;
      _userBio = $v.userBio;
      _tasks = $v.tasks?.toBuilder();
      _orgRef = $v.orgRef;
      _isAdmin = $v.isAdmin;
      _shortTerms = $v.shortTerms;
      _longTerms = $v.longTerms;
      _communities = $v.communities?.toBuilder();
      _completedProjects = $v.completedProjects;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersRecord;
  }

  @override
  void update(void Function(UsersRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UsersRecord build() => _build();

  _$UsersRecord _build() {
    _$UsersRecord _$result;
    try {
      _$result = _$v ??
          new _$UsersRecord._(
              email: email,
              displayName: displayName,
              photoUrl: photoUrl,
              uid: uid,
              createdTime: createdTime,
              phoneNumber: phoneNumber,
              status: status,
              userRole: userRole,
              userBio: userBio,
              tasks: _tasks?.build(),
              orgRef: orgRef,
              isAdmin: isAdmin,
              shortTerms: shortTerms,
              longTerms: longTerms,
              communities: _communities?.build(),
              completedProjects: completedProjects,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'tasks';
        _tasks?.build();

        _$failedField = 'communities';
        _communities?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UsersRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
