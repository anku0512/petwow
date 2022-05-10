// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dog_breed_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DogBreedRecord> _$dogBreedRecordSerializer =
    new _$DogBreedRecordSerializer();

class _$DogBreedRecordSerializer
    implements StructuredSerializer<DogBreedRecord> {
  @override
  final Iterable<Type> types = const [DogBreedRecord, _$DogBreedRecord];
  @override
  final String wireName = 'DogBreedRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, DogBreedRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.dogBreed;
    if (value != null) {
      result
        ..add('dog_breed')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.items;
    if (value != null) {
      result
        ..add('items')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
  DogBreedRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DogBreedRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'dog_breed':
          result.dogBreed = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'items':
          result.items.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
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

class _$DogBreedRecord extends DogBreedRecord {
  @override
  final String dogBreed;
  @override
  final String title;
  @override
  final BuiltList<String> items;
  @override
  final DocumentReference<Object> reference;

  factory _$DogBreedRecord([void Function(DogBreedRecordBuilder) updates]) =>
      (new DogBreedRecordBuilder()..update(updates)).build();

  _$DogBreedRecord._({this.dogBreed, this.title, this.items, this.reference})
      : super._();

  @override
  DogBreedRecord rebuild(void Function(DogBreedRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DogBreedRecordBuilder toBuilder() =>
      new DogBreedRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DogBreedRecord &&
        dogBreed == other.dogBreed &&
        title == other.title &&
        items == other.items &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, dogBreed.hashCode), title.hashCode), items.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DogBreedRecord')
          ..add('dogBreed', dogBreed)
          ..add('title', title)
          ..add('items', items)
          ..add('reference', reference))
        .toString();
  }
}

class DogBreedRecordBuilder
    implements Builder<DogBreedRecord, DogBreedRecordBuilder> {
  _$DogBreedRecord _$v;

  String _dogBreed;
  String get dogBreed => _$this._dogBreed;
  set dogBreed(String dogBreed) => _$this._dogBreed = dogBreed;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  ListBuilder<String> _items;
  ListBuilder<String> get items => _$this._items ??= new ListBuilder<String>();
  set items(ListBuilder<String> items) => _$this._items = items;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  DogBreedRecordBuilder() {
    DogBreedRecord._initializeBuilder(this);
  }

  DogBreedRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _dogBreed = $v.dogBreed;
      _title = $v.title;
      _items = $v.items?.toBuilder();
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DogBreedRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DogBreedRecord;
  }

  @override
  void update(void Function(DogBreedRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DogBreedRecord build() {
    _$DogBreedRecord _$result;
    try {
      _$result = _$v ??
          new _$DogBreedRecord._(
              dogBreed: dogBreed,
              title: title,
              items: _items?.build(),
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'items';
        _items?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DogBreedRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
