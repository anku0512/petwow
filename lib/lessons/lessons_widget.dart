import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../basic/basic_widget.dart';
import '../charming/charming_widget.dart';
import '../edit_profile/edit_profile_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../login/login_widget.dart';
import '../main.dart';
import '../new_dog/new_dog_widget.dart';
import '../playful/playful_widget.dart';
import '../skillfull/skillfull_widget.dart';
import '../store/store_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class LessonsWidget extends StatefulWidget {
  const LessonsWidget({Key key}) : super(key: key);

  @override
  _LessonsWidgetState createState() => _LessonsWidgetState();
}

class _LessonsWidgetState extends State<LessonsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF1F4F8),
      endDrawer: Container(
        width: 260,
        child: Drawer(
          elevation: 40,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Color(0xFFFFC700),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/true_health_(2).png',
                ).image,
              ),
            ),
            child: ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 100, 0, 0),
                  child: InkWell(
                    onTap: () async {
                      if (scaffoldKey.currentState.isDrawerOpen ||
                          scaffoldKey.currentState.isEndDrawerOpen) {
                        Navigator.pop(context);
                      }
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 8, 0),
                          child: AuthUserStreamWidget(
                            child: StreamBuilder<UsersRecord>(
                              stream:
                                  UsersRecord.getDocument(currentUserReference),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                    ),
                                  );
                                }
                                final circleImageUsersRecord = snapshot.data;
                                return InkWell(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            NavBarPage(initialPage: 'profile'),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: 130,
                                    height: 130,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      currentUserPhoto,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 50, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.dog,
                        color: Color(0xFF57636C),
                        size: 30,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
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
                            style: FlutterFlowTheme.of(context).title2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.chat,
                        color: Color(0xFF57636C),
                        size: 30,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: InkWell(
                          onTap: () async {
                            await launchURL(
                                'https://api.whatsapp.com/send/?phone=919776386164&text&app_absent=0');
                          },
                          child: Text(
                            'Chat with Expert',
                            style: FlutterFlowTheme.of(context).title2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.auto_stories,
                        color: Color(0xFF57636C),
                        size: 30,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: Text(
                          'Blog Post',
                          style: FlutterFlowTheme.of(context).title2,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.store,
                        color: Color(0xFF57636C),
                        size: 30,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StoreWidget(),
                              ),
                            );
                          },
                          child: Text(
                            'Store',
                            style: FlutterFlowTheme.of(context).title2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        onTap: () async {
                          var confirmDialogResponse = await showDialog<bool>(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    content: Text(
                                        'Are you sure you want to log out?'),
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
                          color: Color(0xFF57636C),
                          size: 30,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: InkWell(
                          onTap: () async {
                            var confirmDialogResponse = await showDialog<bool>(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      content: Text(
                                          'Are you sure you want to log out?'),
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
                          child: Text(
                            'Log out',
                            style: FlutterFlowTheme.of(context).title2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFC700),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset(
                          'assets/images/true_health_(2).png',
                        ).image,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 44, 0, 15),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0, 0.45),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 0, 10, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 8, 0),
                                    child: AuthUserStreamWidget(
                                      child: StreamBuilder<UsersRecord>(
                                        stream: UsersRecord.getDocument(
                                            currentUserReference),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            );
                                          }
                                          final circleImageUsersRecord =
                                              snapshot.data;
                                          return Container(
                                            width: 48,
                                            height: 48,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              currentUserPhoto,
                                              fit: BoxFit.cover,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 0, 0),
                                    child: AuthUserStreamWidget(
                                      child: Text(
                                        currentUserDisplayName,
                                        style: FlutterFlowTheme.of(context)
                                            .title2
                                            .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 26,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.4, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          50, 0, 0, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          scaffoldKey.currentState
                                              .openEndDrawer();
                                        },
                                        child: Icon(
                                          Icons.dehaze,
                                          color: Color(0xFF6268A7),
                                          size: 28,
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
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewDogWidget(),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 184,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: Image.network(
                              'https://images.unsplash.com/photo-1546238232-20216dec9f72?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1768&q=80',
                            ).image,
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              color: Color(0x33000000),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0x5B39D2C0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.network(
                                '',
                              ).image,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            shape: BoxShape.rectangle,
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 18, 10, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'NEW DOG ESSENTIALS',
                                  style: FlutterFlowTheme.of(context)
                                      .title2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BasicWidget(),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 184,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: Image.network(
                              'https://images.unsplash.com/photo-1581888227599-779811939961?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80',
                            ).image,
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              color: Color(0x33000000),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0x5B39D2C0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.network(
                                '',
                              ).image,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            shape: BoxShape.rectangle,
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 18, 10, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'BASIC',
                                  style: FlutterFlowTheme.of(context)
                                      .title2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SkillfullWidget(),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 184,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: Image.network(
                              'https://images.unsplash.com/photo-1624609602652-b8ca6234bace?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                            ).image,
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              color: Color(0x33000000),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0x5B39D2C0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.network(
                                '',
                              ).image,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            shape: BoxShape.rectangle,
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 18, 10, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'SKILLFULL',
                                  style: FlutterFlowTheme.of(context)
                                      .title2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CharmingWidget(),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 184,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: Image.network(
                              'https://images.unsplash.com/photo-1582456780653-aabf23f711b9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                            ).image,
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              color: Color(0x33000000),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0x5B39D2C0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.network(
                                '',
                              ).image,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            shape: BoxShape.rectangle,
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 18, 10, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'CHARMING',
                                  style: FlutterFlowTheme.of(context)
                                      .title2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                    child: InkWell(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlayfulWidget(),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 184,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: Image.network(
                              'https://images.unsplash.com/photo-1514373941175-0a141072bbc8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80',
                            ).image,
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              color: Color(0x33000000),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0x5B39D2C0),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.network(
                                '',
                              ).image,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            shape: BoxShape.rectangle,
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 18, 10, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'PLAYFULL',
                                  style: FlutterFlowTheme.of(context)
                                      .title2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.white,
                                      ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 24,
                                ),
                              ],
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
    );
  }
}
