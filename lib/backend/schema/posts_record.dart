import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'posts_record.g.dart';

abstract class PostsRecord implements Built<PostsRecord, PostsRecordBuilder> {
  static Serializer<PostsRecord> get serializer => _$postsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'image_url')
  String get imageUrl;

  @nullable
  DocumentReference get user;

  @nullable
  @BuiltValueField(wireName: 'created_at')
  DateTime get createdAt;

  @nullable
  String get description;

  @nullable
  @BuiltValueField(wireName: 'total_likes')
  int get totalLikes;

  @nullable
  @BuiltValueField(wireName: 'liked_users')
  BuiltList<DocumentReference> get likedUsers;

  @nullable
  DocumentReference get challenge;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PostsRecordBuilder builder) => builder
    ..imageUrl = ''
    ..description = ''
    ..totalLikes = 0
    ..likedUsers = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PostsRecord._();
  factory PostsRecord([void Function(PostsRecordBuilder) updates]) =
      _$PostsRecord;

  static PostsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPostsRecordData({
  String imageUrl,
  DocumentReference user,
  DateTime createdAt,
  String description,
  int totalLikes,
  DocumentReference challenge,
}) =>
    serializers.toFirestore(
        PostsRecord.serializer,
        PostsRecord((p) => p
          ..imageUrl = imageUrl
          ..user = user
          ..createdAt = createdAt
          ..description = description
          ..totalLikes = totalLikes
          ..likedUsers = null
          ..challenge = challenge));
