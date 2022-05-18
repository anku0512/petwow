import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';

import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../edit_profile/edit_profile_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../login/login_widget.dart';
import '../post_page_bar_jump_badge/post_page_bar_jump_badge_widget.dart';
import '../post_page_come_badge/post_page_come_badge_widget.dart';
import '../post_page_dance_badge/post_page_dance_badge_widget.dart';
import '../post_page_dow_badge/post_page_dow_badge_widget.dart';
import '../post_page_frisbee_badge/post_page_frisbee_badge_widget.dart';
import '../post_page_leave_badge/post_page_leave_badge_widget.dart';
import '../post_page_leg_weaves_badge/post_page_leg_weaves_badge_widget.dart';
import '../post_page_roll_over_badge/post_page_roll_over_badge_widget.dart';
import '../post_page_shake_hand_badge/post_page_shake_hand_badge_widget.dart';
import '../post_page_shy_badge/post_page_shy_badge_widget.dart';
import '../post_page_sit_badge/post_page_sit_badge_widget.dart';
import '../post_page_stay_badge/post_page_stay_badge_widget.dart';
import '../post_page_tell_secret_badge/post_page_tell_secret_badge_widget.dart';
import '../post_page_touch_badge/post_page_touch_badge_widget.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> with TickerProviderStateMixin {
  final animationsMap = {
    'iconOnActionTriggerAnimation': AnimationInfo(
      curve: Curves.bounceOut,
      trigger: AnimationTrigger.onActionTrigger,
      duration: 900,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 3,
        opacity: 0,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    setupTriggerAnimations(
      animationsMap.values.where((anim) => anim.trigger == AnimationTrigger.onActionTrigger),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        final profileUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 160,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFC700),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        'assets/images/true_health_(2).png',
                      ).image,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 40, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                profileUsersRecord.photoUrl,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(1, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      var confirmDialogResponse = await showDialog<bool>(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text('Log out'),
                                                content: Text('Are you sure you want to log out?'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                    child: Text('Cancel'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                    child: Text('Yes'),
                                                  ),
                                                ],
                                              );
                                            },
                                          ) ??
                                          false;
                                      if (confirmDialogResponse) {
                                        await signOut();
                                      } else {
                                        return;
                                      }

                                      await Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginWidget(),
                                        ),
                                        (r) => false,
                                      );
                                    },
                                    child: Icon(
                                      Icons.login,
                                      color: Color(0xFF6268A7),
                                      size: 28,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(-1, 1),
                                    child: AuthUserStreamWidget(
                                      child: Text(
                                        currentUserDisplayName,
                                        style: FlutterFlowTheme.of(context).title3.override(
                                              fontFamily: 'Lexend Deca',
                                              color: Color(0xFF6268A7),
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(-1, -0.15),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                      child: AuthUserStreamWidget(
                                        child: Text(
                                          currentUserDocument?.breed,
                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                fontFamily: 'Lexend Deca',
                                                color: Color(0xFF6268A7),
                                                fontSize: 14,
                                                fontWeight: FontWeight.normal,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(0.85, 0.85),
                                    child: InkWell(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => EditProfileWidget(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Edit Profile',
                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF6268A7),
                                              fontSize: 16,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: DefaultTabController(
                    length: 2,
                    initialIndex: 0,
                    child: Column(
                      children: [
                        TabBar(
                          labelColor: Color(0xFF6268A7),
                          unselectedLabelColor: Color(0x686268A7),
                          labelPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          labelStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Roboto',
                                fontSize: 18,
                              ),
                          indicatorColor: FlutterFlowTheme.of(context).secondaryColor,
                          tabs: [
                            Tab(
                              text: 'Badges',
                              icon: Icon(
                                FFIcons.kmedal1,
                                color: Color(0xFF6268A7),
                                size: 30,
                              ),
                              iconMargin: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            ),
                            Tab(
                              text: 'My Entries',
                              icon: FaIcon(
                                FontAwesomeIcons.paw,
                                color: Color(0xFF6268A7),
                                size: 30,
                              ),
                              iconMargin: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            ),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                child: ListView(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
                                                  return AlertDialog(
                                                    title: Text('Congratulations'),
                                                    content: Text('Hello Friend!!\nSigned up for an account'),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () => Navigator.pop(alertDialogContext),
                                                        child: Text('Ok'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                            },
                                            child: Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Color(0x00EEEEEE),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.asset(
                                                    'assets/images/login_badge.png',
                                                  ).image,
                                                ),
                                              ),
                                              child: Visibility(
                                                visible: currentUserEmailVerified ?? true,
                                                child: AuthUserStreamWidget(
                                                  child: Container(
                                                    width: 100,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x99FFFFFF),
                                                      border: Border.all(
                                                        color: Colors.transparent,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              var confirmDialogResponse = await showDialog<bool>(
                                                    context: context,
                                                    builder: (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text('Smart Doggo'),
                                                        content: Text(
                                                            'Congratulations!!!!\nYou have earned this badge for mastering the sit trick with your doggo. \nDon\'t forget to show off your dogs talent to the world and stand out '),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () => Navigator.pop(alertDialogContext, false),
                                                            child: Text('ok'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () => Navigator.pop(alertDialogContext, true),
                                                            child: Text('Post'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ) ??
                                                  false;
                                              if (confirmDialogResponse) {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => PostPageSitBadgeWidget(),
                                                  ),
                                                );
                                              } else {
                                                return;
                                              }
                                            },
                                            child: Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Color(0x00EEEEEE),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.asset(
                                                    'assets/images/sit.png',
                                                  ).image,
                                                ),
                                              ),
                                              child: Visibility(
                                                visible: (currentUserDocument?.taskSit) != 'Mastered',
                                                child: AuthUserStreamWidget(
                                                  child: InkWell(
                                                    onTap: () async {
                                                      await showDialog(
                                                        context: context,
                                                        builder: (alertDialogContext) {
                                                          return AlertDialog(
                                                            title: Text('Smart Doggo'),
                                                            content: Text('Master the sit trick to earn this badge'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                child: Text('Ok'),
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                    child: Container(
                                                      width: 100,
                                                      height: 100,
                                                      decoration: BoxDecoration(
                                                        color: Color(0x9AFFFFFF),
                                                        border: Border.all(
                                                          color: Colors.transparent,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              var confirmDialogResponse = await showDialog<bool>(
                                                    context: context,
                                                    builder: (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text('Social Doggo'),
                                                        content: Text(
                                                            'Congratulations!!!!\nYou have earned this badge for mastering the shake hand trick with your doggo. \nDon\'t forget to show off your dogs talent to the world and stand out '),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () => Navigator.pop(alertDialogContext, false),
                                                            child: Text('Ok'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () => Navigator.pop(alertDialogContext, true),
                                                            child: Text('Post'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ) ??
                                                  false;
                                              if (confirmDialogResponse) {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => PostPageShakeHandBadgeWidget(),
                                                  ),
                                                );
                                              } else {
                                                return;
                                              }
                                            },
                                            child: Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Color(0x00EEEEEE),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.network(
                                                    'https://i.pinimg.com/originals/07/62/f4/0762f44bc432ea8c5615b9a9cbfb319c.png',
                                                  ).image,
                                                ),
                                              ),
                                              child: Visibility(
                                                visible: (profileUsersRecord.taskShakeHand) != 'Mastered',
                                                child: InkWell(
                                                  onTap: () async {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text('Social Doggo'),
                                                          content: Text('To earn badge: Master shake hand trick'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 100,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x99FFFFFF),
                                                      border: Border.all(
                                                        color: Colors.transparent,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              var confirmDialogResponse = await showDialog<bool>(
                                                    context: context,
                                                    builder: (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text('Obedient Dog'),
                                                        content: Text(
                                                            'Congratulations!!!!\nYou have earned this badge for mastering the down trick with your doggo. \nDon\'t forget to show off your dogs talent to the world and stand out '),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () => Navigator.pop(alertDialogContext, false),
                                                            child: Text('ok'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () => Navigator.pop(alertDialogContext, true),
                                                            child: Text('Post'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ) ??
                                                  false;
                                              if (confirmDialogResponse) {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => PostPageDowBadgeWidget(),
                                                  ),
                                                );
                                              } else {
                                                return;
                                              }
                                            },
                                            child: Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Color(0x00EEEEEE),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.network(
                                                    'https://i.pinimg.com/originals/b3/6f/94/b36f94847c4d7ffa3d8a6ba6f6ef344f.png',
                                                  ).image,
                                                ),
                                              ),
                                              child: Visibility(
                                                visible: (profileUsersRecord.taskDown) != 'Mastered',
                                                child: InkWell(
                                                  onTap: () async {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text('Obedient Dog'),
                                                          content: Text('To earn badge: Master the down trick'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 100,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x99FFFFFF),
                                                      border: Border.all(
                                                        color: Colors.transparent,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              var confirmDialogResponse = await showDialog<bool>(
                                                    context: context,
                                                    builder: (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text('Good Doggo'),
                                                        content: Text(
                                                            'Congratulations!!!!\nYou have earned this badge for mastering the stay trick with your doggo. \nDon\'t forget to show off your dogs talent to the world and stand out '),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () => Navigator.pop(alertDialogContext, false),
                                                            child: Text('Ok'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () => Navigator.pop(alertDialogContext, true),
                                                            child: Text('Post'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ) ??
                                                  false;
                                              if (confirmDialogResponse) {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => PostPageStayBadgeWidget(),
                                                  ),
                                                );
                                              } else {
                                                return;
                                              }
                                            },
                                            child: Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Color(0x00EEEEEE),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.network(
                                                    'https://i.pinimg.com/originals/e6/85/e7/e685e76f0a4937c6903379bc8f4a33b6.png',
                                                  ).image,
                                                ),
                                              ),
                                              child: Visibility(
                                                visible: (profileUsersRecord.taskStay) != 'Mastered',
                                                child: InkWell(
                                                  onTap: () async {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text('Good Doggo'),
                                                          content: Text('To earn badge: Master the stay trick'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 100,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x9AFFFFFF),
                                                      border: Border.all(
                                                        color: Colors.transparent,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              var confirmDialogResponse = await showDialog<bool>(
                                                    context: context,
                                                    builder: (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text('Cute Dog'),
                                                        content: Text(
                                                            'Congratulations!!!!\nYou have earned this badge for mastering the come trick with your doggo. \nDon\'t forget to show off your dogs talent to the world and stand out '),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () => Navigator.pop(alertDialogContext, false),
                                                            child: Text('Ok'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () => Navigator.pop(alertDialogContext, true),
                                                            child: Text('Post'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ) ??
                                                  false;
                                              if (confirmDialogResponse) {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => PostPageComeBadgeWidget(),
                                                  ),
                                                );
                                              } else {
                                                return;
                                              }
                                            },
                                            child: Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Color(0x00EEEEEE),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.network(
                                                    'https://i.pinimg.com/originals/77/40/10/774010c78b1d85b192ca733bfdadc095.png',
                                                  ).image,
                                                ),
                                              ),
                                              child: Visibility(
                                                visible: (profileUsersRecord.taskCome) != 'Mastered',
                                                child: InkWell(
                                                  onTap: () async {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text('Cute Dog'),
                                                          content: Text('To earn badge: Master the come trick'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 100,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x99FFFFFF),
                                                      border: Border.all(
                                                        color: Colors.transparent,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              var confirmDialogResponse = await showDialog<bool>(
                                                    context: context,
                                                    builder: (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text('Intelligent Dog'),
                                                        content: Text(
                                                            'Congratulations!!!!\nYou have earned this badge for mastering the leave it  trick with your doggo. \nDon\'t forget to show off your dogs talent to the world and stand out '),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () => Navigator.pop(alertDialogContext, false),
                                                            child: Text('ok'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () => Navigator.pop(alertDialogContext, true),
                                                            child: Text('Post'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ) ??
                                                  false;
                                              if (confirmDialogResponse) {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => PostPageLeaveBadgeWidget(),
                                                  ),
                                                );
                                              } else {
                                                return;
                                              }
                                            },
                                            child: Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Color(0x00EEEEEE),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.network(
                                                    'https://i.pinimg.com/originals/6f/22/f1/6f22f1915e55460d1f1450e0ee951859.png',
                                                  ).image,
                                                ),
                                              ),
                                              child: Visibility(
                                                visible: (profileUsersRecord.taskLeaveIt) != 'Mastered',
                                                child: InkWell(
                                                  onTap: () async {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text('Intelligent Dog'),
                                                          content: Text('To earn badge: Master the leave it  trick'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 100,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x99FFFFFF),
                                                      border: Border.all(
                                                        color: Colors.transparent,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              var confirmDialogResponse = await showDialog<bool>(
                                                    context: context,
                                                    builder: (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text('Wow Doggo'),
                                                        content: Text(
                                                            'Congratulations!!!!\nYou have earned this badge for mastering the touch trick with your doggo. \nDon\'t forget to show off your dogs talent to the world and stand out '),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () => Navigator.pop(alertDialogContext, false),
                                                            child: Text('Ok'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () => Navigator.pop(alertDialogContext, true),
                                                            child: Text('Post'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ) ??
                                                  false;
                                              if (confirmDialogResponse) {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => PostPageTouchBadgeWidget(),
                                                  ),
                                                );
                                              } else {
                                                return;
                                              }
                                            },
                                            child: Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Color(0x00EEEEEE),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.network(
                                                    'https://i.pinimg.com/originals/e7/c5/80/e7c5800bb1ade254ebc4bc7cc7195007.png',
                                                  ).image,
                                                ),
                                              ),
                                              child: Visibility(
                                                visible: (profileUsersRecord.taskTouch) != 'Mastered',
                                                child: InkWell(
                                                  onTap: () async {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text('Wow Doggo'),
                                                          content: Text('To earn badge: Master the touch trick'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 100,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x9AFFFFFF),
                                                      border: Border.all(
                                                        color: Colors.transparent,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              var confirmDialogResponse = await showDialog<bool>(
                                                    context: context,
                                                    builder: (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text('Great Dog'),
                                                        content: Text(
                                                            'Congratulations!!!!\nYou have earned this badge for mastering the roll over trick with your doggo. \nDon\'t forget to show off your dogs talent to the world and stand out '),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () => Navigator.pop(alertDialogContext, false),
                                                            child: Text('Ok'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () => Navigator.pop(alertDialogContext, true),
                                                            child: Text('Post'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ) ??
                                                  false;
                                              if (confirmDialogResponse) {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => PostPageRollOverBadgeWidget(),
                                                  ),
                                                );
                                              } else {
                                                return;
                                              }
                                            },
                                            child: Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Color(0x00EEEEEE),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.network(
                                                    'https://i.pinimg.com/originals/6e/c5/7b/6ec57bee31a51f3b037aab0d9f99293b.png',
                                                  ).image,
                                                ),
                                              ),
                                              child: Visibility(
                                                visible: (profileUsersRecord.taskRollOver) != 'Mastered',
                                                child: InkWell(
                                                  onTap: () async {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text('Great Dog '),
                                                          content: Text('To earn badge: Master the roll over  trick'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 100,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x99FFFFFF),
                                                      border: Border.all(
                                                        color: Colors.transparent,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              var confirmDialogResponse = await showDialog<bool>(
                                                    context: context,
                                                    builder: (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text('Talking Dog'),
                                                        content: Text(
                                                            'Congratulations!!!!\nYou have earned this badge for mastering tell me  a secret  trick with your doggo. \nDon\'t forget to show off your dogs talent to the world and stand out '),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () => Navigator.pop(alertDialogContext, false),
                                                            child: Text('ok'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () => Navigator.pop(alertDialogContext, true),
                                                            child: Text('Post'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ) ??
                                                  false;
                                              if (confirmDialogResponse) {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => PostPageTellSecretBadgeWidget(),
                                                  ),
                                                );
                                              } else {
                                                return;
                                              }
                                            },
                                            child: Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Color(0x00EEEEEE),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.network(
                                                    'https://i.pinimg.com/originals/fa/3a/f0/fa3af0e5c5d09f87a4a93acf0fe8711f.png',
                                                  ).image,
                                                ),
                                              ),
                                              child: Visibility(
                                                visible: (profileUsersRecord.taskTellMeASecret) != 'Mastered',
                                                child: InkWell(
                                                  onTap: () async {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text('Talking Dog'),
                                                          content: Text('To earn badge: Master tell me a secret trick'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 100,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x99FFFFFF),
                                                      border: Border.all(
                                                        color: Colors.transparent,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              var confirmDialogResponse = await showDialog<bool>(
                                                    context: context,
                                                    builder: (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text('Furfect'),
                                                        content: Text(
                                                            'Congratulations!!!!\nYou have earned this badge for mastering the leg weaves  trick with your doggo. \nDon\'t forget to show off your dogs talent to the world and stand out '),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () => Navigator.pop(alertDialogContext, false),
                                                            child: Text('Ok'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () => Navigator.pop(alertDialogContext, true),
                                                            child: Text('Post'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ) ??
                                                  false;
                                              if (confirmDialogResponse) {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => PostPageLegWeavesBadgeWidget(),
                                                  ),
                                                );
                                              } else {
                                                return;
                                              }
                                            },
                                            child: Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Color(0x00EEEEEE),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.network(
                                                    'https://i.pinimg.com/originals/fc/24/3f/fc243f49bbab49c894adea883160ec78.png',
                                                  ).image,
                                                ),
                                              ),
                                              child: Visibility(
                                                visible: (profileUsersRecord.taskLegWeaves) != 'Mastered',
                                                child: InkWell(
                                                  onTap: () async {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text('Furfect'),
                                                          content: Text('To earn badge: Master the leg weaves trick'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 100,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x9AFFFFFF),
                                                      border: Border.all(
                                                        color: Colors.transparent,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              var confirmDialogResponse = await showDialog<bool>(
                                                    context: context,
                                                    builder: (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text('Active Dog'),
                                                        content: Text(
                                                            'Congratulations!!!!\nYou have earned this badge for mastering the bar jump trick with your doggo. \nDon\'t forget to show off your dogs talent to the world and stand out '),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () => Navigator.pop(alertDialogContext, false),
                                                            child: Text('Ok'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () => Navigator.pop(alertDialogContext, true),
                                                            child: Text('Post'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ) ??
                                                  false;
                                              if (confirmDialogResponse) {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => PostPageBarJumpBadgeWidget(),
                                                  ),
                                                );
                                              } else {
                                                return;
                                              }
                                            },
                                            child: Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Color(0x00EEEEEE),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.network(
                                                    'https://i.pinimg.com/originals/60/de/eb/60deeb6e270de233f44438d965a0af04.png',
                                                  ).image,
                                                ),
                                              ),
                                              child: Visibility(
                                                visible: (profileUsersRecord.taskBarJump) != 'Mastered',
                                                child: InkWell(
                                                  onTap: () async {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text('Active Dog'),
                                                          content: Text('To earn badge: Master the bar jump  trick'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 100,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x99FFFFFF),
                                                      border: Border.all(
                                                        color: Colors.transparent,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                            onTap: () async {
                                              var confirmDialogResponse = await showDialog<bool>(
                                                    context: context,
                                                    builder: (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text('Dancing Dog'),
                                                        content: Text(
                                                            'Congratulations!!!!\nYou have earned this badge for mastering the dance  trick with your doggo. \nDon\'t forget to show off your dogs talent to the world and stand out '),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () => Navigator.pop(alertDialogContext, false),
                                                            child: Text('ok'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () => Navigator.pop(alertDialogContext, true),
                                                            child: Text('Post'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ) ??
                                                  false;
                                              if (confirmDialogResponse) {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => PostPageDanceBadgeWidget(),
                                                  ),
                                                );
                                              } else {
                                                return;
                                              }
                                            },
                                            child: Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Color(0x00EEEEEE),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.network(
                                                    'https://i.pinimg.com/originals/1c/00/77/1c00774e23ef067c67877622d517d67b.png',
                                                  ).image,
                                                ),
                                              ),
                                              child: Visibility(
                                                visible: (profileUsersRecord.taskDance) != 'Mastered',
                                                child: InkWell(
                                                  onTap: () async {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text('Dancing Dog'),
                                                          content: Text(
                                                              'To earn badge: Master the dance  trick with your dog'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 100,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x99FFFFFF),
                                                      border: Border.all(
                                                        color: Colors.transparent,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              var confirmDialogResponse = await showDialog<bool>(
                                                    context: context,
                                                    builder: (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text('Furfect'),
                                                        content: Text(
                                                            'Congratulations!!!!\nYou have earned this badge for mastering the shy  trick with your doggo. \nDon\'t forget to show off your dogs talent to the world and stand out '),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () => Navigator.pop(alertDialogContext, false),
                                                            child: Text('Ok'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () => Navigator.pop(alertDialogContext, true),
                                                            child: Text('Post'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ) ??
                                                  false;
                                              if (confirmDialogResponse) {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => PostPageShyBadgeWidget(),
                                                  ),
                                                );
                                              } else {
                                                return;
                                              }
                                            },
                                            child: Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Color(0x00EEEEEE),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.network(
                                                    'https://i.pinimg.com/originals/4e/e5/3d/4ee53d517d5b8fc70085b6bfa53fd698.png',
                                                  ).image,
                                                ),
                                              ),
                                              child: Visibility(
                                                visible: (profileUsersRecord.taskShy) != 'Mastered',
                                                child: InkWell(
                                                  onTap: () async {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text('Charming Doggo'),
                                                          content: Text('To earn badge: Master the shy trick'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 100,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x9AFFFFFF),
                                                      border: Border.all(
                                                        color: Colors.transparent,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              var confirmDialogResponse = await showDialog<bool>(
                                                    context: context,
                                                    builder: (alertDialogContext) {
                                                      return AlertDialog(
                                                        title: Text('Active Dog'),
                                                        content: Text(
                                                            'Congratulations!!!!\nYou have earned this badge for mastering the disc trick with your doggo. \nDon\'t forget to show off your dogs talent to the world and stand out '),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () => Navigator.pop(alertDialogContext, false),
                                                            child: Text('Ok'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () => Navigator.pop(alertDialogContext, true),
                                                            child: Text('Post'),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ) ??
                                                  false;
                                              if (confirmDialogResponse) {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => PostPageFrisbeeBadgeWidget(),
                                                  ),
                                                );
                                              } else {
                                                return;
                                              }
                                            },
                                            child: Container(
                                              width: 100,
                                              height: 100,
                                              decoration: BoxDecoration(
                                                color: Color(0x00EEEEEE),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: Image.network(
                                                    'https://i.pinimg.com/originals/bd/c1/aa/bdc1aa85243b97c030b460e4de6e8afd.png',
                                                  ).image,
                                                ),
                                              ),
                                              child: Visibility(
                                                visible: (profileUsersRecord.taskFrisbee) != 'Mastered',
                                                child: InkWell(
                                                  onTap: () async {
                                                    await showDialog(
                                                      context: context,
                                                      builder: (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text('Active Dog'),
                                                          content: Text('To earn badge: Master the disc  trick'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                              child: Text('Ok'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Container(
                                                    width: 100,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x99FFFFFF),
                                                      border: Border.all(
                                                        color: Colors.transparent,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                child: StreamBuilder<List<PostsRecord>>(
                                  stream: queryPostsRecord(
                                    queryBuilder: (postsRecord) => postsRecord
                                        .where('user', isEqualTo: currentUserReference)
                                        .orderBy('created_at', descending: true),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context).primaryColor,
                                          ),
                                        ),
                                      );
                                    }
                                    List<PostsRecord> gridViewPostsRecordList = snapshot.data;
                                    return GridView.builder(
                                      padding: EdgeInsets.zero,
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 1,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        childAspectRatio: 0.8,
                                      ),
                                      scrollDirection: Axis.vertical,
                                      itemCount: gridViewPostsRecordList.length,
                                      itemBuilder: (context, gridViewIndex) {
                                        final gridViewPostsRecord = gridViewPostsRecordList[gridViewIndex];
                                        return Container(
                                          width: MediaQuery.of(context).size.width,
                                          height: 200,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 2, 0),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Card(
                                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                                      color: Color(0xFF4B39EF),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(20),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(1, 1, 1, 1),
                                                        child: Container(
                                                          width: 40,
                                                          height: 40,
                                                          clipBehavior: Clip.antiAlias,
                                                          decoration: BoxDecoration(
                                                            shape: BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            profileUsersRecord.photoUrl,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.max,
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                                            child: Text(
                                                              profileUsersRecord.displayName,
                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                    fontFamily: 'Lexend Deca',
                                                                    color: Color(0xFF090F13),
                                                                    fontSize: 14,
                                                                    fontWeight: FontWeight.normal,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                                            child: FlutterFlowIconButton(
                                                              borderColor: Colors.transparent,
                                                              borderRadius: 30,
                                                              buttonSize: 46,
                                                              icon: Icon(
                                                                Icons.delete,
                                                                color: Color(0xFF262D34),
                                                                size: 20,
                                                              ),
                                                              onPressed: () async {
                                                                var confirmDialogResponse = await showDialog<bool>(
                                                                      context: context,
                                                                      builder: (alertDialogContext) {
                                                                        return AlertDialog(
                                                                          title: Text('Delete Post'),
                                                                          content: Text(
                                                                              'You will no longer be able to see this post '),
                                                                          actions: [
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(
                                                                                  alertDialogContext, false),
                                                                              child: Text('Cancel'),
                                                                            ),
                                                                            TextButton(
                                                                              onPressed: () => Navigator.pop(
                                                                                  alertDialogContext, true),
                                                                              child: Text('Confirm'),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    ) ??
                                                                    false;
                                                                if (confirmDialogResponse) {
                                                                  await gridViewPostsRecord.reference.delete();
                                                                } else {
                                                                  return;
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                child: Container(
                                                  width: MediaQuery.of(context).size.width * 0.96,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 6,
                                                        color: Color(0x3A000000),
                                                        offset: Offset(0, 2),
                                                      )
                                                    ],
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  child: InkWell(
                                                    onDoubleTap: () async {
                                                      final postsUpdateData = {
                                                        'total_likes': FieldValue.increment(1),
                                                      };
                                                      await gridViewPostsRecord.reference.update(postsUpdateData);
                                                      await (animationsMap['iconOnActionTriggerAnimation']
                                                              .curvedAnimation
                                                              .parent as AnimationController)
                                                          .forward(from: 0.0);
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(8),
                                                      child: Image.network(
                                                        gridViewPostsRecord.imageUrl,
                                                        width: double.infinity,
                                                        height: 300,
                                                        fit: BoxFit.fitHeight,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 8, 0),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                      child: Row(
                                                        mainAxisSize: MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                                            child: Row(
                                                              mainAxisSize: MainAxisSize.max,
                                                              children: [
                                                                InkWell(
                                                                  onTap: () async {
                                                                    final postsUpdateData = {
                                                                      'total_likes': FieldValue.increment(1),
                                                                    };
                                                                    await gridViewPostsRecord.reference
                                                                        .update(postsUpdateData);
                                                                    await (animationsMap['iconOnActionTriggerAnimation']
                                                                            .curvedAnimation
                                                                            .parent as AnimationController)
                                                                        .forward(from: 0.0);
                                                                  },
                                                                  child: FaIcon(
                                                                    FontAwesomeIcons.paw,
                                                                    color: Color(0xFF95A1AC),
                                                                    size: 24,
                                                                  ),
                                                                ).animated(
                                                                    [animationsMap['iconOnActionTriggerAnimation']]),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        gridViewPostsRecord.totalLikes.toString(),
                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                              fontFamily: 'Poppins',
                                                              color: Color(0xFF95A1AC),
                                                            ),
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize: MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              await Share.share('');
                                                            },
                                                            child: Icon(
                                                              Icons.ios_share,
                                                              color: Color(0xFF95A1AC),
                                                              size: 24,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional.fromSTEB(2, 4, 0, 0),
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                                                        child: Text(
                                                          gridViewPostsRecord.description,
                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                fontFamily: 'Lexend Deca',
                                                                color: Color(0xFF090F13),
                                                                fontSize: 14,
                                                                fontWeight: FontWeight.normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
