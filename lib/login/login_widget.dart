import '../auth/auth_util.dart';
import '../complete_profile/complete_profile_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../resetpassowrd/resetpassowrd_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController emailAddressController;
  TextEditingController pwd1Controller;
  bool pwd1Visibility;
  TextEditingController emailAddressCreateController;
  TextEditingController pwd3Controller;
  bool pwd3Visibility;
  TextEditingController pwd2Controller;
  bool pwd2Visibility;

  @override
  void initState() {
    super.initState();
    emailAddressController = TextEditingController();
    pwd1Controller = TextEditingController();
    pwd1Visibility = false;
    emailAddressCreateController = TextEditingController();
    pwd3Controller = TextEditingController();
    pwd3Visibility = false;
    pwd2Controller = TextEditingController();
    pwd2Visibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFFFC700),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset(
                        'assets/images/true_health_(2).png',
                      ).image,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 60),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/petwow_logo.png',
                                width: MediaQuery.of(context).size.width * 0.6,
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: DefaultTabController(
                            length: 2,
                            initialIndex: 0,
                            child: Column(
                              children: [
                                TabBar(
                                  isScrollable: true,
                                  labelColor: Color(0xFF6268A7),
                                  labelPadding: EdgeInsetsDirectional.fromSTEB(
                                      24, 0, 24, 0),
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .subtitle1
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: Color(0xFF0F1113),
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                      ),
                                  indicatorColor: Colors.white,
                                  tabs: [
                                    Tab(
                                      text: 'Sign Up',
                                    ),
                                    Tab(
                                      text: 'Sign In',
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: TabBarView(
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24, 24, 24, 24),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(20, 20, 20, 0),
                                              child: TextFormField(
                                                controller:
                                                emailAddressCreateController,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'Email Address',
                                                  labelStyle: FlutterFlowTheme
                                                      .of(context)
                                                      .bodyText2
                                                      .override(
                                                    fontFamily: 'Outfit',
                                                    color:
                                                    Color(0xFF57636C),
                                                    fontSize: 14,
                                                    fontWeight:
                                                    FontWeight.normal,
                                                  ),
                                                  hintText:
                                                  'Enter your email...',
                                                  hintStyle: FlutterFlowTheme
                                                      .of(context)
                                                      .bodyText1
                                                      .override(
                                                    fontFamily:
                                                    'Lexend Deca',
                                                    color:
                                                    Color(0x98FFFFFF),
                                                    fontSize: 14,
                                                    fontWeight:
                                                    FontWeight.normal,
                                                  ),
                                                  enabledBorder:
                                                  OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.white,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8),
                                                  ),
                                                  focusedBorder:
                                                  OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.white,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      20, 16, 20, 16),
                                                ),
                                                style:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'Outfit',
                                                  color:
                                                  Color(0xFF0F1113),
                                                  fontSize: 14,
                                                  fontWeight:
                                                  FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(20, 12, 20, 0),
                                              child: TextFormField(
                                                controller: pwd3Controller,
                                                obscureText: !pwd3Visibility,
                                                decoration: InputDecoration(
                                                  labelText: 'Password',
                                                  labelStyle: FlutterFlowTheme
                                                      .of(context)
                                                      .bodyText2
                                                      .override(
                                                    fontFamily: 'Outfit',
                                                    color:
                                                    Color(0xFF57636C),
                                                    fontSize: 14,
                                                    fontWeight:
                                                    FontWeight.normal,
                                                  ),
                                                  hintText:
                                                  'Enter your password...',
                                                  hintStyle: FlutterFlowTheme
                                                      .of(context)
                                                      .bodyText1
                                                      .override(
                                                    fontFamily:
                                                    'Lexend Deca',
                                                    color:
                                                    Color(0x98FFFFFF),
                                                    fontSize: 14,
                                                    fontWeight:
                                                    FontWeight.normal,
                                                  ),
                                                  enabledBorder:
                                                  OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.white,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8),
                                                  ),
                                                  focusedBorder:
                                                  OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.white,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      20, 16, 20, 16),
                                                  suffixIcon: InkWell(
                                                    onTap: () => setState(
                                                          () => pwd3Visibility =
                                                      !pwd3Visibility,
                                                    ),
                                                    child: Icon(
                                                      pwd3Visibility
                                                          ? Icons
                                                          .visibility_outlined
                                                          : Icons
                                                          .visibility_off_outlined,
                                                      color: Color(0xFF57636C),
                                                      size: 20,
                                                    ),
                                                  ),
                                                ),
                                                style:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'Outfit',
                                                  color:
                                                  Color(0xFF0F1113),
                                                  fontSize: 14,
                                                  fontWeight:
                                                  FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(20, 12, 20, 0),
                                              child: TextFormField(
                                                controller: pwd2Controller,
                                                obscureText: !pwd2Visibility,
                                                decoration: InputDecoration(
                                                  labelText: 'Confirm Password',
                                                  labelStyle: FlutterFlowTheme
                                                      .of(context)
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Outfit',
                                                    color:
                                                    Color(0xFF0F1113),
                                                    fontWeight:
                                                    FontWeight.normal,
                                                  ),
                                                  hintStyle: FlutterFlowTheme
                                                      .of(context)
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Outfit',
                                                    color:
                                                    Color(0xFF0F1113),
                                                    fontWeight:
                                                    FontWeight.normal,
                                                  ),
                                                  enabledBorder:
                                                  OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.white,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8),
                                                  ),
                                                  focusedBorder:
                                                  OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.white,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        8),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  contentPadding:
                                                  EdgeInsetsDirectional
                                                      .fromSTEB(
                                                      20, 16, 20, 16),
                                                  suffixIcon: InkWell(
                                                    onTap: () => setState(
                                                          () => pwd2Visibility =
                                                      !pwd2Visibility,
                                                    ),
                                                    child: Icon(
                                                      pwd2Visibility
                                                          ? Icons
                                                          .visibility_outlined
                                                          : Icons
                                                          .visibility_off_outlined,
                                                      color: Color(0xFF57636C),
                                                      size: 20,
                                                    ),
                                                  ),
                                                ),
                                                style:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'Outfit',
                                                  color:
                                                  Color(0xFF0F1113),
                                                  fontWeight:
                                                  FontWeight.normal,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 24, 0, 0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  if (pwd3Controller.text !=
                                                      pwd2Controller.text) {
                                                    ScaffoldMessenger.of(
                                                        context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Passwords don\'t match!',
                                                        ),
                                                      ),
                                                    );
                                                    return;
                                                  }

                                                  final user =
                                                  await createAccountWithEmail(
                                                    context,
                                                    emailAddressCreateController
                                                        .text,
                                                    pwd3Controller.text,
                                                  );
                                                  if (user == null) {
                                                    return;
                                                  }

                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          CompleteProfileWidget(),
                                                    ),
                                                  );
                                                },
                                                text: 'Create Account',
                                                options: FFButtonOptions(
                                                  width: 230,
                                                  height: 50,
                                                  color: Colors.white,
                                                  textStyle: FlutterFlowTheme
                                                      .of(context)
                                                      .subtitle2
                                                      .override(
                                                    fontFamily: 'Outfit',
                                                    color:
                                                    Color(0xFF4B39EF),
                                                    fontSize: 16,
                                                    fontWeight:
                                                    FontWeight.normal,
                                                  ),
                                                  elevation: 3,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,

                                                  ),
                                                  borderRadius: 8,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 24, 0, 0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  final user =
                                                  await signInWithGoogle(
                                                      context);
                                                  if (user == null) {
                                                    return;
                                                  }
                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          CompleteProfileWidget(),
                                                    ),
                                                  );
                                                },
                                                text: 'Sign up with Google',
                                                icon: FaIcon(
                                                  FontAwesomeIcons.google,
                                                ),
                                                options: FFButtonOptions(
                                                  width: 230,
                                                  height: 40,
                                                  color: FlutterFlowTheme.of(
                                                      context)
                                                      .primaryColor,
                                                  textStyle: FlutterFlowTheme
                                                      .of(context)
                                                      .subtitle2
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    color: Colors.white,
                                                  ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                  borderRadius: 12,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                              child: Text(
                                                'Already a member? Sign In',
                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                  fontFamily: 'Poppins',
                                                  color: Colors.black,
                                                  decoration: TextDecoration.underline,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24, 24, 24, 24),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(20, 20, 20, 0),
                                              child: TextFormField(
                                                controller:
                                                    emailAddressController,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  labelText: 'Email Address',
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF57636C),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  hintText:
                                                      'Enter your email...',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            Color(0x98FFFFFF),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.white,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.white,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                              20, 16, 20, 16),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF0F1113),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(20, 12, 20, 0),
                                              child: TextFormField(
                                                controller: pwd1Controller,
                                                obscureText: !pwd1Visibility,
                                                decoration: InputDecoration(
                                                  labelText: 'Password',
                                                  labelStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF57636C),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  hintText:
                                                      'Enter your password...',
                                                  hintStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Lexend Deca',
                                                        color:
                                                            Color(0x98FFFFFF),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.white,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.white,
                                                      width: 1,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  contentPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(
                                                              20, 16, 20, 16),
                                                  suffixIcon: InkWell(
                                                    onTap: () => setState(
                                                      () => pwd1Visibility =
                                                          !pwd1Visibility,
                                                    ),
                                                    child: Icon(
                                                      pwd1Visibility
                                                          ? Icons
                                                              .visibility_outlined
                                                          : Icons
                                                              .visibility_off_outlined,
                                                      color: Color(0xFF57636C),
                                                      size: 20,
                                                    ),
                                                  ),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color:
                                                              Color(0xFF0F1113),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 24, 0, 0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  final user =
                                                      await signInWithEmail(
                                                    context,
                                                    emailAddressController.text,
                                                    pwd1Controller.text,
                                                  );
                                                  if (user == null) {
                                                    return;
                                                  }

                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          NavBarPage(
                                                              initialPage:
                                                                  'lessons'),
                                                    ),
                                                  );
                                                },
                                                text: 'Sign In',
                                                options: FFButtonOptions(
                                                  width: 230,
                                                  height: 50,
                                                  color: Colors.white,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF4B39EF),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  elevation: 3,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                  borderRadius: 8,
                                                ),
                                              ),
                                            ),
                                            FFButtonWidget(
                                              onPressed: () async {
                                                await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ResetpassowrdWidget(),
                                                  ),
                                                );
                                              },
                                              text: 'Forgot Password?',
                                              options: FFButtonOptions(
                                                width: 170,
                                                height: 40,
                                                color: Color(0x004B39EF),
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                elevation: 0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius: 8,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 15, 0, 0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  final user =
                                                      await signInWithGoogle(
                                                          context);
                                                  if (user == null) {
                                                    return;
                                                  }
                                                  await Navigator
                                                      .pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          NavBarPage(
                                                              initialPage:
                                                                  'lessons'),
                                                    ),
                                                    (r) => false,
                                                  );
                                                },
                                                text: 'Sign in with Google',
                                                icon: FaIcon(
                                                  FontAwesomeIcons.google,
                                                ),
                                                options: FFButtonOptions(
                                                  width: 230,
                                                  height: 40,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .subtitle2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color: Colors.white,
                                                      ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                  borderRadius: 12,
                                                ),
                                              ),
                                            ),
                                          ],
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
