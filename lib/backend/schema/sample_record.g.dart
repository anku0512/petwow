// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SampleRecord> _$sampleRecordSerializer =
    new _$SampleRecordSerializer();

class _$SampleRecordSerializer implements StructuredSerializer<SampleRecord> {
  @override
  final Iterable<Type> types = const [SampleRecord, _$SampleRecord];
  @override
  final String wireName = 'SampleRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, SampleRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.breed;
    if (value != null) {
      result
        ..add('breed')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  SampleRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SampleRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'breed':
          result.breed = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$SampleRecord extends SampleRecord {
  @override
  final String breed;
  @override
  final DocumentReference<Object> reference;

  factory _$SampleRecord([void Function(SampleRecordBuilder) updates]) =>
      (new SampleRecordBuilder()..update(updates))._build();

  _$SampleRecord._({this.breed, this.reference}) : super._();

  @override
  SampleRecord rebuild(void Function(SampleRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SampleRecordBuilder toBuilder() => new SampleRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SampleRecord &&
        breed == other.breed &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, breed.hashCode), reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SampleRecord')
          ..add('breed', breed)
          ..add('reference', reference))
        .toString();
  }
}

class SampleRecordBuilder
    implements Builder<SampleRecord, SampleRecordBuilder> {
  _$SampleRecord _$v;

  String _breed;
  String get breed => _$this._breed;
  set breed(String breed) => _$this._breed = breed;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  SampleRecordBuilder() {
    SampleRecord._initializeBuilder(this);
  }

  SampleRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _breed = $v.breed;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SampleRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SampleRecord;
  }

  @override
  void update(void Function(SampleRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  SampleRecord build() => _build();

  _$SampleRecord _build() {
    final _$result =
        _$v ?? new _$SampleRecord._(breed: breed, reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
