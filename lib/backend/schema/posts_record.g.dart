// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PostsRecord> _$postsRecordSerializer = new _$PostsRecordSerializer();

class _$PostsRecordSerializer implements StructuredSerializer<PostsRecord> {
  @override
  final Iterable<Type> types = const [PostsRecord, _$PostsRecord];
  @override
  final String wireName = 'PostsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, PostsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.imageUrl;
    if (value != null) {
      result
        ..add('image_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.totalLikes;
    if (value != null) {
      result
        ..add('total_likes')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.likedUsers;
    if (value != null) {
      result
        ..add('liked_users')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
    }
    value = object.challenge;
    if (value != null) {
      result
        ..add('challenge')
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
  PostsRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'image_url':
          result.imageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'total_likes':
          result.totalLikes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'liked_users':
          result.likedUsers.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
          break;
        case 'challenge':
          result.challenge = serializers.deserialize(value,
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

class _$PostsRecord extends PostsRecord {
  @override
  final String imageUrl;
  @override
  final DocumentReference<Object> user;
  @override
  final DateTime createdAt;
  @override
  final String description;
  @override
  final int totalLikes;
  @override
  final BuiltList<DocumentReference<Object>> likedUsers;
  @override
  final DocumentReference<Object> challenge;
  @override
  final DocumentReference<Object> reference;

  factory _$PostsRecord([void Function(PostsRecordBuilder) updates]) =>
      (new PostsRecordBuilder()..update(updates))._build();

  _$PostsRecord._(
      {this.imageUrl,
      this.user,
      this.createdAt,
      this.description,
      this.totalLikes,
      this.likedUsers,
      this.challenge,
      this.reference})
      : super._();

  @override
  PostsRecord rebuild(void Function(PostsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostsRecordBuilder toBuilder() => new PostsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PostsRecord &&
        imageUrl == other.imageUrl &&
        user == other.user &&
        createdAt == other.createdAt &&
        description == other.description &&
        totalLikes == other.totalLikes &&
        likedUsers == other.likedUsers &&
        challenge == other.challenge &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, imageUrl.hashCode), user.hashCode),
                            createdAt.hashCode),
                        description.hashCode),
                    totalLikes.hashCode),
                likedUsers.hashCode),
            challenge.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PostsRecord')
          ..add('imageUrl', imageUrl)
          ..add('user', user)
          ..add('createdAt', createdAt)
          ..add('description', description)
          ..add('totalLikes', totalLikes)
          ..add('likedUsers', likedUsers)
          ..add('challenge', challenge)
          ..add('reference', reference))
        .toString();
  }
}

class PostsRecordBuilder implements Builder<PostsRecord, PostsRecordBuilder> {
  _$PostsRecord _$v;

  String _imageUrl;
  String get imageUrl => _$this._imageUrl;
  set imageUrl(String imageUrl) => _$this._imageUrl = imageUrl;

  DocumentReference<Object> _user;
  DocumentReference<Object> get user => _$this._user;
  set user(DocumentReference<Object> user) => _$this._user = user;

  DateTime _createdAt;
  DateTime get createdAt => _$this._createdAt;
  set createdAt(DateTime createdAt) => _$this._createdAt = createdAt;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  int _totalLikes;
  int get totalLikes => _$this._totalLikes;
  set totalLikes(int totalLikes) => _$this._totalLikes = totalLikes;

  ListBuilder<DocumentReference<Object>> _likedUsers;
  ListBuilder<DocumentReference<Object>> get likedUsers =>
      _$this._likedUsers ??= new ListBuilder<DocumentReference<Object>>();
  set likedUsers(ListBuilder<DocumentReference<Object>> likedUsers) =>
      _$this._likedUsers = likedUsers;

  DocumentReference<Object> _challenge;
  DocumentReference<Object> get challenge => _$this._challenge;
  set challenge(DocumentReference<Object> challenge) =>
      _$this._challenge = challenge;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  PostsRecordBuilder() {
    PostsRecord._initializeBuilder(this);
  }

  PostsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _imageUrl = $v.imageUrl;
      _user = $v.user;
      _createdAt = $v.createdAt;
      _description = $v.description;
      _totalLikes = $v.totalLikes;
      _likedUsers = $v.likedUsers?.toBuilder();
      _challenge = $v.challenge;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PostsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PostsRecord;
  }

  @override
  void update(void Function(PostsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  PostsRecord build() => _build();

  _$PostsRecord _build() {
    _$PostsRecord _$result;
    try {
      _$result = _$v ??
          new _$PostsRecord._(
              imageUrl: imageUrl,
              user: user,
              createdAt: createdAt,
              description: description,
              totalLikes: totalLikes,
              likedUsers: _likedUsers?.build(),
              challenge: challenge,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'likedUsers';
        _likedUsers?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'PostsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
