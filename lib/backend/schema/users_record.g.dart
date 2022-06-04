// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UsersRecord> _$usersRecordSerializer = new _$UsersRecordSerializer();

class _$UsersRecordSerializer implements StructuredSerializer<UsersRecord> {
  @override
  final Iterable<Type> types = const [UsersRecord, _$UsersRecord];
  @override
  final String wireName = 'UsersRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, UsersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.password;
    if (value != null) {
      result
        ..add('password')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.displayName;
    if (value != null) {
      result
        ..add('display_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.gender;
    if (value != null) {
      result
        ..add('gender')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.breed;
    if (value != null) {
      result
        ..add('breed')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.dob;
    if (value != null) {
      result
        ..add('dob')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.taskSit;
    if (value != null) {
      result
        ..add('task_sit')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.taskShakeHand;
    if (value != null) {
      result
        ..add('task_shake_hand')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.taskDown;
    if (value != null) {
      result
        ..add('task_down')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.taskStay;
    if (value != null) {
      result
        ..add('task_stay')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.taskCome;
    if (value != null) {
      result
        ..add('task_come')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.taskLeaveIt;
    if (value != null) {
      result
        ..add('task_leave_it')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.taskTouch;
    if (value != null) {
      result
        ..add('task_touch')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.taskRollOver;
    if (value != null) {
      result
        ..add('task_roll_over')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.taskSpin;
    if (value != null) {
      result
        ..add('task_spin')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.taskTellMeASecret;
    if (value != null) {
      result
        ..add('task_tell_me_a_secret')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.taskCrossPaws;
    if (value != null) {
      result
        ..add('task_cross_paws')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.taskChinRest;
    if (value != null) {
      result
        ..add('task_chin_rest')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.taskHug;
    if (value != null) {
      result
        ..add('task_hug')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.taskLegWeaves;
    if (value != null) {
      result
        ..add('task_leg_weaves')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.taskBarJump;
    if (value != null) {
      result
        ..add('task_bar_jump')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.likedPosts;
    if (value != null) {
      result
        ..add('liked_posts')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
    }
    value = object.taskDance;
    if (value != null) {
      result
        ..add('task_dance')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.taskShy;
    if (value != null) {
      result
        ..add('task_shy')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.taskHoopedArms;
    if (value != null) {
      result
        ..add('task_hooped_arms')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.taskScoot;
    if (value != null) {
      result
        ..add('task_scoot')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.taskJumpRope;
    if (value != null) {
      result
        ..add('task_jump_rope')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.taskFigure8;
    if (value != null) {
      result
        ..add('task_figure_8')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.taskFrisbee;
    if (value != null) {
      result
        ..add('task_frisbee')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.placeworkIntro;
    if (value != null) {
      result
        ..add('placework_intro')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.placeworkDuration;
    if (value != null) {
      result
        ..add('placework_duration')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.placeworkSendToPlace;
    if (value != null) {
      result
        ..add('placework_send_to_place')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.placeworkDoorbell;
    if (value != null) {
      result
        ..add('placework_doorbell')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.waitlist;
    if (value != null) {
      result
        ..add('waitlist')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.yourName;
    if (value != null) {
      result
        ..add('your_name')
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
  UsersRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'display_name':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'breed':
          result.breed = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'dob':
          result.dob = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'task_sit':
          result.taskSit = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'task_shake_hand':
          result.taskShakeHand = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'task_down':
          result.taskDown = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'task_stay':
          result.taskStay = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'task_come':
          result.taskCome = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'task_leave_it':
          result.taskLeaveIt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'task_touch':
          result.taskTouch = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'task_roll_over':
          result.taskRollOver = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'task_spin':
          result.taskSpin = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'task_tell_me_a_secret':
          result.taskTellMeASecret = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'task_cross_paws':
          result.taskCrossPaws = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'task_chin_rest':
          result.taskChinRest = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'task_hug':
          result.taskHug = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'task_leg_weaves':
          result.taskLegWeaves = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'task_bar_jump':
          result.taskBarJump = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'liked_posts':
          result.likedPosts.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
          break;
        case 'task_dance':
          result.taskDance = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'task_shy':
          result.taskShy = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'task_hooped_arms':
          result.taskHoopedArms = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'task_scoot':
          result.taskScoot = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'task_jump_rope':
          result.taskJumpRope = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'task_figure_8':
          result.taskFigure8 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'task_frisbee':
          result.taskFrisbee = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'placework_intro':
          result.placeworkIntro = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'placework_duration':
          result.placeworkDuration = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'placework_send_to_place':
          result.placeworkSendToPlace = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'placework_doorbell':
          result.placeworkDoorbell = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'waitlist':
          result.waitlist = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'your_name':
          result.yourName = serializers.deserialize(value,
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

class _$UsersRecord extends UsersRecord {
  @override
  final String email;
  @override
  final String password;
  @override
  final String displayName;
  @override
  final String photoUrl;
  @override
  final String uid;
  @override
  final DateTime createdTime;
  @override
  final String phoneNumber;
  @override
  final String gender;
  @override
  final String breed;
  @override
  final DateTime dob;
  @override
  final String taskSit;
  @override
  final String taskShakeHand;
  @override
  final String taskDown;
  @override
  final String taskStay;
  @override
  final String taskCome;
  @override
  final String taskLeaveIt;
  @override
  final String taskTouch;
  @override
  final String taskRollOver;
  @override
  final String taskSpin;
  @override
  final String taskTellMeASecret;
  @override
  final String taskCrossPaws;
  @override
  final String taskChinRest;
  @override
  final String taskHug;
  @override
  final String taskLegWeaves;
  @override
  final String taskBarJump;
  @override
  final BuiltList<DocumentReference<Object>> likedPosts;
  @override
  final String taskDance;
  @override
  final String taskShy;
  @override
  final String taskHoopedArms;
  @override
  final String taskScoot;
  @override
  final String taskJumpRope;
  @override
  final String taskFigure8;
  @override
  final String taskFrisbee;
  @override
  final String placeworkIntro;
  @override
  final String placeworkDuration;
  @override
  final String placeworkSendToPlace;
  @override
  final String placeworkDoorbell;
  @override
  final String waitlist;
  @override
  final String yourName;
  @override
  final DocumentReference<Object> reference;

  factory _$UsersRecord([void Function(UsersRecordBuilder) updates]) =>
      (new UsersRecordBuilder()..update(updates)).build();

  _$UsersRecord._(
      {this.email,
      this.password,
      this.displayName,
      this.photoUrl,
      this.uid,
      this.createdTime,
      this.phoneNumber,
      this.gender,
      this.breed,
      this.dob,
      this.taskSit,
      this.taskShakeHand,
      this.taskDown,
      this.taskStay,
      this.taskCome,
      this.taskLeaveIt,
      this.taskTouch,
      this.taskRollOver,
      this.taskSpin,
      this.taskTellMeASecret,
      this.taskCrossPaws,
      this.taskChinRest,
      this.taskHug,
      this.taskLegWeaves,
      this.taskBarJump,
      this.likedPosts,
      this.taskDance,
      this.taskShy,
      this.taskHoopedArms,
      this.taskScoot,
      this.taskJumpRope,
      this.taskFigure8,
      this.taskFrisbee,
      this.placeworkIntro,
      this.placeworkDuration,
      this.placeworkSendToPlace,
      this.placeworkDoorbell,
      this.waitlist,
      this.yourName,
      this.reference})
      : super._();

  @override
  UsersRecord rebuild(void Function(UsersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersRecordBuilder toBuilder() => new UsersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UsersRecord &&
        email == other.email &&
        password == other.password &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        gender == other.gender &&
        breed == other.breed &&
        dob == other.dob &&
        taskSit == other.taskSit &&
        taskShakeHand == other.taskShakeHand &&
        taskDown == other.taskDown &&
        taskStay == other.taskStay &&
        taskCome == other.taskCome &&
        taskLeaveIt == other.taskLeaveIt &&
        taskTouch == other.taskTouch &&
        taskRollOver == other.taskRollOver &&
        taskSpin == other.taskSpin &&
        taskTellMeASecret == other.taskTellMeASecret &&
        taskCrossPaws == other.taskCrossPaws &&
        taskChinRest == other.taskChinRest &&
        taskHug == other.taskHug &&
        taskLegWeaves == other.taskLegWeaves &&
        taskBarJump == other.taskBarJump &&
        likedPosts == other.likedPosts &&
        taskDance == other.taskDance &&
        taskShy == other.taskShy &&
        taskHoopedArms == other.taskHoopedArms &&
        taskScoot == other.taskScoot &&
        taskJumpRope == other.taskJumpRope &&
        taskFigure8 == other.taskFigure8 &&
        taskFrisbee == other.taskFrisbee &&
        placeworkIntro == other.placeworkIntro &&
        placeworkDuration == other.placeworkDuration &&
        placeworkSendToPlace == other.placeworkSendToPlace &&
        placeworkDoorbell == other.placeworkDoorbell &&
        waitlist == other.waitlist &&
        yourName == other.yourName &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc($jc(0, email.hashCode), password.hashCode), displayName.hashCode), photoUrl.hashCode), uid.hashCode), createdTime.hashCode), phoneNumber.hashCode), gender.hashCode), breed.hashCode), dob.hashCode), taskSit.hashCode), taskShakeHand.hashCode), taskDown.hashCode), taskStay.hashCode), taskCome.hashCode), taskLeaveIt.hashCode), taskTouch.hashCode), taskRollOver.hashCode), taskSpin.hashCode), taskTellMeASecret.hashCode), taskCrossPaws.hashCode),
                                                                                taskChinRest.hashCode),
                                                                            taskHug.hashCode),
                                                                        taskLegWeaves.hashCode),
                                                                    taskBarJump.hashCode),
                                                                likedPosts.hashCode),
                                                            taskDance.hashCode),
                                                        taskShy.hashCode),
                                                    taskHoopedArms.hashCode),
                                                taskScoot.hashCode),
                                            taskJumpRope.hashCode),
                                        taskFigure8.hashCode),
                                    taskFrisbee.hashCode),
                                placeworkIntro.hashCode),
                            placeworkDuration.hashCode),
                        placeworkSendToPlace.hashCode),
                    placeworkDoorbell.hashCode),
                waitlist.hashCode),
            yourName.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UsersRecord')
          ..add('email', email)
          ..add('password', password)
          ..add('displayName', displayName)
          ..add('photoUrl', photoUrl)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('gender', gender)
          ..add('breed', breed)
          ..add('dob', dob)
          ..add('taskSit', taskSit)
          ..add('taskShakeHand', taskShakeHand)
          ..add('taskDown', taskDown)
          ..add('taskStay', taskStay)
          ..add('taskCome', taskCome)
          ..add('taskLeaveIt', taskLeaveIt)
          ..add('taskTouch', taskTouch)
          ..add('taskRollOver', taskRollOver)
          ..add('taskSpin', taskSpin)
          ..add('taskTellMeASecret', taskTellMeASecret)
          ..add('taskCrossPaws', taskCrossPaws)
          ..add('taskChinRest', taskChinRest)
          ..add('taskHug', taskHug)
          ..add('taskLegWeaves', taskLegWeaves)
          ..add('taskBarJump', taskBarJump)
          ..add('likedPosts', likedPosts)
          ..add('taskDance', taskDance)
          ..add('taskShy', taskShy)
          ..add('taskHoopedArms', taskHoopedArms)
          ..add('taskScoot', taskScoot)
          ..add('taskJumpRope', taskJumpRope)
          ..add('taskFigure8', taskFigure8)
          ..add('taskFrisbee', taskFrisbee)
          ..add('placeworkIntro', placeworkIntro)
          ..add('placeworkDuration', placeworkDuration)
          ..add('placeworkSendToPlace', placeworkSendToPlace)
          ..add('placeworkDoorbell', placeworkDoorbell)
          ..add('waitlist', waitlist)
          ..add('yourName', yourName)
          ..add('reference', reference))
        .toString();
  }
}

class UsersRecordBuilder implements Builder<UsersRecord, UsersRecordBuilder> {
  _$UsersRecord _$v;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  String _displayName;
  String get displayName => _$this._displayName;
  set displayName(String displayName) => _$this._displayName = displayName;

  String _photoUrl;
  String get photoUrl => _$this._photoUrl;
  set photoUrl(String photoUrl) => _$this._photoUrl = photoUrl;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  DateTime _createdTime;
  DateTime get createdTime => _$this._createdTime;
  set createdTime(DateTime createdTime) => _$this._createdTime = createdTime;

  String _phoneNumber;
  String get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String phoneNumber) => _$this._phoneNumber = phoneNumber;

  String _gender;
  String get gender => _$this._gender;
  set gender(String gender) => _$this._gender = gender;

  String _breed;
  String get breed => _$this._breed;
  set breed(String breed) => _$this._breed = breed;

  DateTime _dob;
  DateTime get dob => _$this._dob;
  set dob(DateTime dob) => _$this._dob = dob;

  String _taskSit;
  String get taskSit => _$this._taskSit;
  set taskSit(String taskSit) => _$this._taskSit = taskSit;

  String _taskShakeHand;
  String get taskShakeHand => _$this._taskShakeHand;
  set taskShakeHand(String taskShakeHand) =>
      _$this._taskShakeHand = taskShakeHand;

  String _taskDown;
  String get taskDown => _$this._taskDown;
  set taskDown(String taskDown) => _$this._taskDown = taskDown;

  String _taskStay;
  String get taskStay => _$this._taskStay;
  set taskStay(String taskStay) => _$this._taskStay = taskStay;

  String _taskCome;
  String get taskCome => _$this._taskCome;
  set taskCome(String taskCome) => _$this._taskCome = taskCome;

  String _taskLeaveIt;
  String get taskLeaveIt => _$this._taskLeaveIt;
  set taskLeaveIt(String taskLeaveIt) => _$this._taskLeaveIt = taskLeaveIt;

  String _taskTouch;
  String get taskTouch => _$this._taskTouch;
  set taskTouch(String taskTouch) => _$this._taskTouch = taskTouch;

  String _taskRollOver;
  String get taskRollOver => _$this._taskRollOver;
  set taskRollOver(String taskRollOver) => _$this._taskRollOver = taskRollOver;

  String _taskSpin;
  String get taskSpin => _$this._taskSpin;
  set taskSpin(String taskSpin) => _$this._taskSpin = taskSpin;

  String _taskTellMeASecret;
  String get taskTellMeASecret => _$this._taskTellMeASecret;
  set taskTellMeASecret(String taskTellMeASecret) =>
      _$this._taskTellMeASecret = taskTellMeASecret;

  String _taskCrossPaws;
  String get taskCrossPaws => _$this._taskCrossPaws;
  set taskCrossPaws(String taskCrossPaws) =>
      _$this._taskCrossPaws = taskCrossPaws;

  String _taskChinRest;
  String get taskChinRest => _$this._taskChinRest;
  set taskChinRest(String taskChinRest) => _$this._taskChinRest = taskChinRest;

  String _taskHug;
  String get taskHug => _$this._taskHug;
  set taskHug(String taskHug) => _$this._taskHug = taskHug;

  String _taskLegWeaves;
  String get taskLegWeaves => _$this._taskLegWeaves;
  set taskLegWeaves(String taskLegWeaves) =>
      _$this._taskLegWeaves = taskLegWeaves;

  String _taskBarJump;
  String get taskBarJump => _$this._taskBarJump;
  set taskBarJump(String taskBarJump) => _$this._taskBarJump = taskBarJump;

  ListBuilder<DocumentReference<Object>> _likedPosts;
  ListBuilder<DocumentReference<Object>> get likedPosts =>
      _$this._likedPosts ??= new ListBuilder<DocumentReference<Object>>();
  set likedPosts(ListBuilder<DocumentReference<Object>> likedPosts) =>
      _$this._likedPosts = likedPosts;

  String _taskDance;
  String get taskDance => _$this._taskDance;
  set taskDance(String taskDance) => _$this._taskDance = taskDance;

  String _taskShy;
  String get taskShy => _$this._taskShy;
  set taskShy(String taskShy) => _$this._taskShy = taskShy;

  String _taskHoopedArms;
  String get taskHoopedArms => _$this._taskHoopedArms;
  set taskHoopedArms(String taskHoopedArms) =>
      _$this._taskHoopedArms = taskHoopedArms;

  String _taskScoot;
  String get taskScoot => _$this._taskScoot;
  set taskScoot(String taskScoot) => _$this._taskScoot = taskScoot;

  String _taskJumpRope;
  String get taskJumpRope => _$this._taskJumpRope;
  set taskJumpRope(String taskJumpRope) => _$this._taskJumpRope = taskJumpRope;

  String _taskFigure8;
  String get taskFigure8 => _$this._taskFigure8;
  set taskFigure8(String taskFigure8) => _$this._taskFigure8 = taskFigure8;

  String _taskFrisbee;
  String get taskFrisbee => _$this._taskFrisbee;
  set taskFrisbee(String taskFrisbee) => _$this._taskFrisbee = taskFrisbee;

  String _placeworkIntro;
  String get placeworkIntro => _$this._placeworkIntro;
  set placeworkIntro(String placeworkIntro) =>
      _$this._placeworkIntro = placeworkIntro;

  String _placeworkDuration;
  String get placeworkDuration => _$this._placeworkDuration;
  set placeworkDuration(String placeworkDuration) =>
      _$this._placeworkDuration = placeworkDuration;

  String _placeworkSendToPlace;
  String get placeworkSendToPlace => _$this._placeworkSendToPlace;
  set placeworkSendToPlace(String placeworkSendToPlace) =>
      _$this._placeworkSendToPlace = placeworkSendToPlace;

  String _placeworkDoorbell;
  String get placeworkDoorbell => _$this._placeworkDoorbell;
  set placeworkDoorbell(String placeworkDoorbell) =>
      _$this._placeworkDoorbell = placeworkDoorbell;

  String _waitlist;
  String get waitlist => _$this._waitlist;
  set waitlist(String waitlist) => _$this._waitlist = waitlist;

  String _yourName;
  String get yourName => _$this._yourName;
  set yourName(String yourName) => _$this._yourName = yourName;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  UsersRecordBuilder() {
    UsersRecord._initializeBuilder(this);
  }

  UsersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _password = $v.password;
      _displayName = $v.displayName;
      _photoUrl = $v.photoUrl;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _gender = $v.gender;
      _breed = $v.breed;
      _dob = $v.dob;
      _taskSit = $v.taskSit;
      _taskShakeHand = $v.taskShakeHand;
      _taskDown = $v.taskDown;
      _taskStay = $v.taskStay;
      _taskCome = $v.taskCome;
      _taskLeaveIt = $v.taskLeaveIt;
      _taskTouch = $v.taskTouch;
      _taskRollOver = $v.taskRollOver;
      _taskSpin = $v.taskSpin;
      _taskTellMeASecret = $v.taskTellMeASecret;
      _taskCrossPaws = $v.taskCrossPaws;
      _taskChinRest = $v.taskChinRest;
      _taskHug = $v.taskHug;
      _taskLegWeaves = $v.taskLegWeaves;
      _taskBarJump = $v.taskBarJump;
      _likedPosts = $v.likedPosts?.toBuilder();
      _taskDance = $v.taskDance;
      _taskShy = $v.taskShy;
      _taskHoopedArms = $v.taskHoopedArms;
      _taskScoot = $v.taskScoot;
      _taskJumpRope = $v.taskJumpRope;
      _taskFigure8 = $v.taskFigure8;
      _taskFrisbee = $v.taskFrisbee;
      _placeworkIntro = $v.placeworkIntro;
      _placeworkDuration = $v.placeworkDuration;
      _placeworkSendToPlace = $v.placeworkSendToPlace;
      _placeworkDoorbell = $v.placeworkDoorbell;
      _waitlist = $v.waitlist;
      _yourName = $v.yourName;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UsersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UsersRecord;
  }

  @override
  void update(void Function(UsersRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$UsersRecord build() {
    _$UsersRecord _$result;
    try {
      _$result = _$v ??
          new _$UsersRecord._(
              email: email,
              password: password,
              displayName: displayName,
              photoUrl: photoUrl,
              uid: uid,
              createdTime: createdTime,
              phoneNumber: phoneNumber,
              gender: gender,
              breed: breed,
              dob: dob,
              taskSit: taskSit,
              taskShakeHand: taskShakeHand,
              taskDown: taskDown,
              taskStay: taskStay,
              taskCome: taskCome,
              taskLeaveIt: taskLeaveIt,
              taskTouch: taskTouch,
              taskRollOver: taskRollOver,
              taskSpin: taskSpin,
              taskTellMeASecret: taskTellMeASecret,
              taskCrossPaws: taskCrossPaws,
              taskChinRest: taskChinRest,
              taskHug: taskHug,
              taskLegWeaves: taskLegWeaves,
              taskBarJump: taskBarJump,
              likedPosts: _likedPosts?.build(),
              taskDance: taskDance,
              taskShy: taskShy,
              taskHoopedArms: taskHoopedArms,
              taskScoot: taskScoot,
              taskJumpRope: taskJumpRope,
              taskFigure8: taskFigure8,
              taskFrisbee: taskFrisbee,
              placeworkIntro: placeworkIntro,
              placeworkDuration: placeworkDuration,
              placeworkSendToPlace: placeworkSendToPlace,
              placeworkDoorbell: placeworkDoorbell,
              waitlist: waitlist,
              yourName: yourName,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'likedPosts';
        _likedPosts?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'UsersRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
