import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'dog_breed_record.g.dart';

abstract class DogBreedRecord
    implements Built<DogBreedRecord, DogBreedRecordBuilder> {
  static Serializer<DogBreedRecord> get serializer =>
      _$dogBreedRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'dog_breed')
  String get dogBreed;

  @nullable
  String get title;

  @nullable
  BuiltList<String> get items;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DogBreedRecordBuilder builder) => builder
    ..dogBreed = ''
    ..title = ''
    ..items = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('dog_breed');

  static Stream<DogBreedRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DogBreedRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  DogBreedRecord._();
  factory DogBreedRecord([void Function(DogBreedRecordBuilder) updates]) =
      _$DogBreedRecord;

  static DogBreedRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDogBreedRecordData({
  String dogBreed,
  String title,
}) =>
    serializers.toFirestore(
        DogBreedRecord.serializer,
        DogBreedRecord((d) => d
          ..dogBreed = dogBreed
          ..title = title
          ..items = null));
