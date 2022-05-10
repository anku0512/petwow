import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'users_record.g.dart';

abstract class UsersRecord implements Built<UsersRecord, UsersRecordBuilder> {
  static Serializer<UsersRecord> get serializer => _$usersRecordSerializer;

  @nullable
  String get email;

  @nullable
  String get password;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  String get gender;

  @nullable
  String get breed;

  @nullable
  DateTime get dob;

  @nullable
  @BuiltValueField(wireName: 'task_sit')
  String get taskSit;

  @nullable
  @BuiltValueField(wireName: 'task_shake_hand')
  String get taskShakeHand;

  @nullable
  @BuiltValueField(wireName: 'task_down')
  String get taskDown;

  @nullable
  @BuiltValueField(wireName: 'task_stay')
  String get taskStay;

  @nullable
  @BuiltValueField(wireName: 'task_come')
  String get taskCome;

  @nullable
  @BuiltValueField(wireName: 'task_leave_it')
  String get taskLeaveIt;

  @nullable
  @BuiltValueField(wireName: 'task_touch')
  String get taskTouch;

  @nullable
  @BuiltValueField(wireName: 'task_roll_over')
  String get taskRollOver;

  @nullable
  @BuiltValueField(wireName: 'task_spin')
  String get taskSpin;

  @nullable
  @BuiltValueField(wireName: 'task_tell_me_a_secret')
  String get taskTellMeASecret;

  @nullable
  @BuiltValueField(wireName: 'task_cross_paws')
  String get taskCrossPaws;

  @nullable
  @BuiltValueField(wireName: 'task_chin_rest')
  String get taskChinRest;

  @nullable
  @BuiltValueField(wireName: 'task_hug')
  String get taskHug;

  @nullable
  @BuiltValueField(wireName: 'task_leg_weaves')
  String get taskLegWeaves;

  @nullable
  @BuiltValueField(wireName: 'task_bar_jump')
  String get taskBarJump;

  @nullable
  @BuiltValueField(wireName: 'liked_posts')
  BuiltList<DocumentReference> get likedPosts;

  @nullable
  @BuiltValueField(wireName: 'task_dance')
  String get taskDance;

  @nullable
  @BuiltValueField(wireName: 'task_shy')
  String get taskShy;

  @nullable
  @BuiltValueField(wireName: 'task_hooped_arms')
  String get taskHoopedArms;

  @nullable
  @BuiltValueField(wireName: 'task_scoot')
  String get taskScoot;

  @nullable
  @BuiltValueField(wireName: 'task_jump_rope')
  String get taskJumpRope;

  @nullable
  @BuiltValueField(wireName: 'task_figure_8')
  String get taskFigure8;

  @nullable
  @BuiltValueField(wireName: 'task_frisbee')
  String get taskFrisbee;

  @nullable
  @BuiltValueField(wireName: 'placework_intro')
  String get placeworkIntro;

  @nullable
  @BuiltValueField(wireName: 'placework_duration')
  String get placeworkDuration;

  @nullable
  @BuiltValueField(wireName: 'placework_send_to_place')
  String get placeworkSendToPlace;

  @nullable
  @BuiltValueField(wireName: 'placework_doorbell')
  String get placeworkDoorbell;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UsersRecordBuilder builder) => builder
    ..email = ''
    ..password = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..gender = ''
    ..breed = ''
    ..taskSit = ''
    ..taskShakeHand = ''
    ..taskDown = ''
    ..taskStay = ''
    ..taskCome = ''
    ..taskLeaveIt = ''
    ..taskTouch = ''
    ..taskRollOver = ''
    ..taskSpin = ''
    ..taskTellMeASecret = ''
    ..taskCrossPaws = ''
    ..taskChinRest = ''
    ..taskHug = ''
    ..taskLegWeaves = ''
    ..taskBarJump = ''
    ..likedPosts = ListBuilder()
    ..taskDance = ''
    ..taskShy = ''
    ..taskHoopedArms = ''
    ..taskScoot = ''
    ..taskJumpRope = ''
    ..taskFigure8 = ''
    ..taskFrisbee = ''
    ..placeworkIntro = ''
    ..placeworkDuration = ''
    ..placeworkSendToPlace = ''
    ..placeworkDoorbell = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UsersRecord._();
  factory UsersRecord([void Function(UsersRecordBuilder) updates]) =
      _$UsersRecord;

  static UsersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUsersRecordData({
  String email,
  String password,
  String displayName,
  String photoUrl,
  String uid,
  DateTime createdTime,
  String phoneNumber,
  String gender,
  String breed,
  DateTime dob,
  String taskSit,
  String taskShakeHand,
  String taskDown,
  String taskStay,
  String taskCome,
  String taskLeaveIt,
  String taskTouch,
  String taskRollOver,
  String taskSpin,
  String taskTellMeASecret,
  String taskCrossPaws,
  String taskChinRest,
  String taskHug,
  String taskLegWeaves,
  String taskBarJump,
  String taskDance,
  String taskShy,
  String taskHoopedArms,
  String taskScoot,
  String taskJumpRope,
  String taskFigure8,
  String taskFrisbee,
  String placeworkIntro,
  String placeworkDuration,
  String placeworkSendToPlace,
  String placeworkDoorbell,
}) =>
    serializers.toFirestore(
        UsersRecord.serializer,
        UsersRecord((u) => u
          ..email = email
          ..password = password
          ..displayName = displayName
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime
          ..phoneNumber = phoneNumber
          ..gender = gender
          ..breed = breed
          ..dob = dob
          ..taskSit = taskSit
          ..taskShakeHand = taskShakeHand
          ..taskDown = taskDown
          ..taskStay = taskStay
          ..taskCome = taskCome
          ..taskLeaveIt = taskLeaveIt
          ..taskTouch = taskTouch
          ..taskRollOver = taskRollOver
          ..taskSpin = taskSpin
          ..taskTellMeASecret = taskTellMeASecret
          ..taskCrossPaws = taskCrossPaws
          ..taskChinRest = taskChinRest
          ..taskHug = taskHug
          ..taskLegWeaves = taskLegWeaves
          ..taskBarJump = taskBarJump
          ..likedPosts = null
          ..taskDance = taskDance
          ..taskShy = taskShy
          ..taskHoopedArms = taskHoopedArms
          ..taskScoot = taskScoot
          ..taskJumpRope = taskJumpRope
          ..taskFigure8 = taskFigure8
          ..taskFrisbee = taskFrisbee
          ..placeworkIntro = placeworkIntro
          ..placeworkDuration = placeworkDuration
          ..placeworkSendToPlace = placeworkSendToPlace
          ..placeworkDoorbell = placeworkDoorbell));
