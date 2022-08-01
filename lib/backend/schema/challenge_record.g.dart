// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ChallengeRecord> _$challengeRecordSerializer =
    new _$ChallengeRecordSerializer();

class _$ChallengeRecordSerializer
    implements StructuredSerializer<ChallengeRecord> {
  @override
  final Iterable<Type> types = const [ChallengeRecord, _$ChallengeRecord];
  @override
  final String wireName = 'ChallengeRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, ChallengeRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.duration;
    if (value != null) {
      result
        ..add('duration')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.statement;
    if (value != null) {
      result
        ..add('statement')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.challengePost;
    if (value != null) {
      result
        ..add('challengePost')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  ChallengeRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChallengeRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'duration':
          result.duration = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'statement':
          result.statement = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'challengePost':
          result.challengePost = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$ChallengeRecord extends ChallengeRecord {
  @override
  final String name;
  @override
  final String image;
  @override
  final DateTime duration;
  @override
  final String statement;
  @override
  final DateTime createdAt;
  @override
  final DocumentReference<Object> challengePost;
  @override
  final DocumentReference<Object> reference;

  factory _$ChallengeRecord([void Function(ChallengeRecordBuilder) updates]) =>
      (new ChallengeRecordBuilder()..update(updates))._build();

  _$ChallengeRecord._(
      {this.name,
      this.image,
      this.duration,
      this.statement,
      this.createdAt,
      this.challengePost,
      this.reference})
      : super._();

  @override
  ChallengeRecord rebuild(void Function(ChallengeRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChallengeRecordBuilder toBuilder() =>
      new ChallengeRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChallengeRecord &&
        name == other.name &&
        image == other.image &&
        duration == other.duration &&
        statement == other.statement &&
        createdAt == other.createdAt &&
        challengePost == other.challengePost &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, name.hashCode), image.hashCode),
                        duration.hashCode),
                    statement.hashCode),
                createdAt.hashCode),
            challengePost.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChallengeRecord')
          ..add('name', name)
          ..add('image', image)
          ..add('duration', duration)
          ..add('statement', statement)
          ..add('createdAt', createdAt)
          ..add('challengePost', challengePost)
          ..add('reference', reference))
        .toString();
  }
}

class ChallengeRecordBuilder
    implements Builder<ChallengeRecord, ChallengeRecordBuilder> {
  _$ChallengeRecord _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _image;
  String get image => _$this._image;
  set image(String image) => _$this._image = image;

  DateTime _duration;
  DateTime get duration => _$this._duration;
  set duration(DateTime duration) => _$this._duration = duration;

  String _statement;
  String get statement => _$this._statement;
  set statement(String statement) => _$this._statement = statement;

  DateTime _createdAt;
  DateTime get createdAt => _$this._createdAt;
  set createdAt(DateTime createdAt) => _$this._createdAt = createdAt;

  DocumentReference<Object> _challengePost;
  DocumentReference<Object> get challengePost => _$this._challengePost;
  set challengePost(DocumentReference<Object> challengePost) =>
      _$this._challengePost = challengePost;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  ChallengeRecordBuilder() {
    ChallengeRecord._initializeBuilder(this);
  }

  ChallengeRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _image = $v.image;
      _duration = $v.duration;
      _statement = $v.statement;
      _createdAt = $v.createdAt;
      _challengePost = $v.challengePost;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChallengeRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChallengeRecord;
  }

  @override
  void update(void Function(ChallengeRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  ChallengeRecord build() => _build();

  _$ChallengeRecord _build() {
    final _$result = _$v ??
        new _$ChallengeRecord._(
            name: name,
            image: image,
            duration: duration,
            statement: statement,
            createdAt: createdAt,
            challengePost: challengePost,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
