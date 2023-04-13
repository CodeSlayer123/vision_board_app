// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_list_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProjectListRecord> _$projectListRecordSerializer =
    new _$ProjectListRecordSerializer();

class _$ProjectListRecordSerializer
    implements StructuredSerializer<ProjectListRecord> {
  @override
  final Iterable<Type> types = const [ProjectListRecord, _$ProjectListRecord];
  @override
  final String wireName = 'ProjectListRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProjectListRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.projects;
    if (value != null) {
      result
        ..add('projects')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.userRef;
    if (value != null) {
      result
        ..add('userRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  ProjectListRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProjectListRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'projects':
          result.projects.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(String)]))!
              as BuiltList<Object?>);
          break;
        case 'userRef':
          result.userRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$ProjectListRecord extends ProjectListRecord {
  @override
  final BuiltList<String>? projects;
  @override
  final DocumentReference<Object?>? userRef;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ProjectListRecord(
          [void Function(ProjectListRecordBuilder)? updates]) =>
      (new ProjectListRecordBuilder()..update(updates))._build();

  _$ProjectListRecord._({this.projects, this.userRef, this.ffRef}) : super._();

  @override
  ProjectListRecord rebuild(void Function(ProjectListRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProjectListRecordBuilder toBuilder() =>
      new ProjectListRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProjectListRecord &&
        projects == other.projects &&
        userRef == other.userRef &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, projects.hashCode);
    _$hash = $jc(_$hash, userRef.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProjectListRecord')
          ..add('projects', projects)
          ..add('userRef', userRef)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ProjectListRecordBuilder
    implements Builder<ProjectListRecord, ProjectListRecordBuilder> {
  _$ProjectListRecord? _$v;

  ListBuilder<String>? _projects;
  ListBuilder<String> get projects =>
      _$this._projects ??= new ListBuilder<String>();
  set projects(ListBuilder<String>? projects) => _$this._projects = projects;

  DocumentReference<Object?>? _userRef;
  DocumentReference<Object?>? get userRef => _$this._userRef;
  set userRef(DocumentReference<Object?>? userRef) => _$this._userRef = userRef;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ProjectListRecordBuilder() {
    ProjectListRecord._initializeBuilder(this);
  }

  ProjectListRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _projects = $v.projects?.toBuilder();
      _userRef = $v.userRef;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProjectListRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProjectListRecord;
  }

  @override
  void update(void Function(ProjectListRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProjectListRecord build() => _build();

  _$ProjectListRecord _build() {
    _$ProjectListRecord _$result;
    try {
      _$result = _$v ??
          new _$ProjectListRecord._(
              projects: _projects?.build(), userRef: userRef, ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'projects';
        _projects?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ProjectListRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
