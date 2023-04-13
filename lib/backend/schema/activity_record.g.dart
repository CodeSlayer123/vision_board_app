// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ActivityRecord> _$activityRecordSerializer =
    new _$ActivityRecordSerializer();

class _$ActivityRecordSerializer
    implements StructuredSerializer<ActivityRecord> {
  @override
  final Iterable<Type> types = const [ActivityRecord, _$ActivityRecord];
  @override
  final String wireName = 'ActivityRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ActivityRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.activityName;
    if (value != null) {
      result
        ..add('activityName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.activityTime;
    if (value != null) {
      result
        ..add('activityTime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.activityDescription;
    if (value != null) {
      result
        ..add('activityDescription')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.activityType;
    if (value != null) {
      result
        ..add('activityType')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.projectRef;
    if (value != null) {
      result
        ..add('projectRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.otherUser;
    if (value != null) {
      result
        ..add('otherUser')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.readState;
    if (value != null) {
      result
        ..add('readState')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.activitySubText;
    if (value != null) {
      result
        ..add('activitySubText')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.taskRef;
    if (value != null) {
      result
        ..add('taskRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.targetUserRef;
    if (value != null) {
      result
        ..add('targetUserRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.unreadByUser;
    if (value != null) {
      result
        ..add('unreadByUser')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
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
  ActivityRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ActivityRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'activityName':
          result.activityName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'activityTime':
          result.activityTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'activityDescription':
          result.activityDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'activityType':
          result.activityType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'projectRef':
          result.projectRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'otherUser':
          result.otherUser = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'readState':
          result.readState = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'activitySubText':
          result.activitySubText = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'taskRef':
          result.taskRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'targetUserRef':
          result.targetUserRef.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'unreadByUser':
          result.unreadByUser.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
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

class _$ActivityRecord extends ActivityRecord {
  @override
  final String? activityName;
  @override
  final DateTime? activityTime;
  @override
  final String? activityDescription;
  @override
  final String? activityType;
  @override
  final DocumentReference<Object?>? projectRef;
  @override
  final DocumentReference<Object?>? otherUser;
  @override
  final bool? readState;
  @override
  final String? activitySubText;
  @override
  final DocumentReference<Object?>? taskRef;
  @override
  final BuiltList<DocumentReference<Object?>>? targetUserRef;
  @override
  final BuiltList<DocumentReference<Object?>>? unreadByUser;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ActivityRecord([void Function(ActivityRecordBuilder)? updates]) =>
      (new ActivityRecordBuilder()..update(updates))._build();

  _$ActivityRecord._(
      {this.activityName,
      this.activityTime,
      this.activityDescription,
      this.activityType,
      this.projectRef,
      this.otherUser,
      this.readState,
      this.activitySubText,
      this.taskRef,
      this.targetUserRef,
      this.unreadByUser,
      this.ffRef})
      : super._();

  @override
  ActivityRecord rebuild(void Function(ActivityRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ActivityRecordBuilder toBuilder() =>
      new ActivityRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ActivityRecord &&
        activityName == other.activityName &&
        activityTime == other.activityTime &&
        activityDescription == other.activityDescription &&
        activityType == other.activityType &&
        projectRef == other.projectRef &&
        otherUser == other.otherUser &&
        readState == other.readState &&
        activitySubText == other.activitySubText &&
        taskRef == other.taskRef &&
        targetUserRef == other.targetUserRef &&
        unreadByUser == other.unreadByUser &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, activityName.hashCode);
    _$hash = $jc(_$hash, activityTime.hashCode);
    _$hash = $jc(_$hash, activityDescription.hashCode);
    _$hash = $jc(_$hash, activityType.hashCode);
    _$hash = $jc(_$hash, projectRef.hashCode);
    _$hash = $jc(_$hash, otherUser.hashCode);
    _$hash = $jc(_$hash, readState.hashCode);
    _$hash = $jc(_$hash, activitySubText.hashCode);
    _$hash = $jc(_$hash, taskRef.hashCode);
    _$hash = $jc(_$hash, targetUserRef.hashCode);
    _$hash = $jc(_$hash, unreadByUser.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ActivityRecord')
          ..add('activityName', activityName)
          ..add('activityTime', activityTime)
          ..add('activityDescription', activityDescription)
          ..add('activityType', activityType)
          ..add('projectRef', projectRef)
          ..add('otherUser', otherUser)
          ..add('readState', readState)
          ..add('activitySubText', activitySubText)
          ..add('taskRef', taskRef)
          ..add('targetUserRef', targetUserRef)
          ..add('unreadByUser', unreadByUser)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ActivityRecordBuilder
    implements Builder<ActivityRecord, ActivityRecordBuilder> {
  _$ActivityRecord? _$v;

  String? _activityName;
  String? get activityName => _$this._activityName;
  set activityName(String? activityName) => _$this._activityName = activityName;

  DateTime? _activityTime;
  DateTime? get activityTime => _$this._activityTime;
  set activityTime(DateTime? activityTime) =>
      _$this._activityTime = activityTime;

  String? _activityDescription;
  String? get activityDescription => _$this._activityDescription;
  set activityDescription(String? activityDescription) =>
      _$this._activityDescription = activityDescription;

  String? _activityType;
  String? get activityType => _$this._activityType;
  set activityType(String? activityType) => _$this._activityType = activityType;

  DocumentReference<Object?>? _projectRef;
  DocumentReference<Object?>? get projectRef => _$this._projectRef;
  set projectRef(DocumentReference<Object?>? projectRef) =>
      _$this._projectRef = projectRef;

  DocumentReference<Object?>? _otherUser;
  DocumentReference<Object?>? get otherUser => _$this._otherUser;
  set otherUser(DocumentReference<Object?>? otherUser) =>
      _$this._otherUser = otherUser;

  bool? _readState;
  bool? get readState => _$this._readState;
  set readState(bool? readState) => _$this._readState = readState;

  String? _activitySubText;
  String? get activitySubText => _$this._activitySubText;
  set activitySubText(String? activitySubText) =>
      _$this._activitySubText = activitySubText;

  DocumentReference<Object?>? _taskRef;
  DocumentReference<Object?>? get taskRef => _$this._taskRef;
  set taskRef(DocumentReference<Object?>? taskRef) => _$this._taskRef = taskRef;

  ListBuilder<DocumentReference<Object?>>? _targetUserRef;
  ListBuilder<DocumentReference<Object?>> get targetUserRef =>
      _$this._targetUserRef ??= new ListBuilder<DocumentReference<Object?>>();
  set targetUserRef(ListBuilder<DocumentReference<Object?>>? targetUserRef) =>
      _$this._targetUserRef = targetUserRef;

  ListBuilder<DocumentReference<Object?>>? _unreadByUser;
  ListBuilder<DocumentReference<Object?>> get unreadByUser =>
      _$this._unreadByUser ??= new ListBuilder<DocumentReference<Object?>>();
  set unreadByUser(ListBuilder<DocumentReference<Object?>>? unreadByUser) =>
      _$this._unreadByUser = unreadByUser;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ActivityRecordBuilder() {
    ActivityRecord._initializeBuilder(this);
  }

  ActivityRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _activityName = $v.activityName;
      _activityTime = $v.activityTime;
      _activityDescription = $v.activityDescription;
      _activityType = $v.activityType;
      _projectRef = $v.projectRef;
      _otherUser = $v.otherUser;
      _readState = $v.readState;
      _activitySubText = $v.activitySubText;
      _taskRef = $v.taskRef;
      _targetUserRef = $v.targetUserRef?.toBuilder();
      _unreadByUser = $v.unreadByUser?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ActivityRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ActivityRecord;
  }

  @override
  void update(void Function(ActivityRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ActivityRecord build() => _build();

  _$ActivityRecord _build() {
    _$ActivityRecord _$result;
    try {
      _$result = _$v ??
          new _$ActivityRecord._(
              activityName: activityName,
              activityTime: activityTime,
              activityDescription: activityDescription,
              activityType: activityType,
              projectRef: projectRef,
              otherUser: otherUser,
              readState: readState,
              activitySubText: activitySubText,
              taskRef: taskRef,
              targetUserRef: _targetUserRef?.build(),
              unreadByUser: _unreadByUser?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'targetUserRef';
        _targetUserRef?.build();
        _$failedField = 'unreadByUser';
        _unreadByUser?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ActivityRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
