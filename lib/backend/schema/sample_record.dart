import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'sample_record.g.dart';

abstract class SampleRecord
    implements Built<SampleRecord, SampleRecordBuilder> {
  static Serializer<SampleRecord> get serializer => _$sampleRecordSerializer;

  @nullable
  String get breed;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(SampleRecordBuilder builder) =>
      builder..breed = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sample');

  static Stream<SampleRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<SampleRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  SampleRecord._();
  factory SampleRecord([void Function(SampleRecordBuilder) updates]) =
      _$SampleRecord;

  static SampleRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createSampleRecordData({
  String breed,
}) =>
    serializers.toFirestore(
        SampleRecord.serializer, SampleRecord((s) => s..breed = breed));
