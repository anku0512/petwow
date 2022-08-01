import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../onboarding/onboarding_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class CompleteProfileWidget extends StatefulWidget {
  const CompleteProfileWidget({Key key}) : super(key: key);

  @override
  _CompleteProfileWidgetState createState() => _CompleteProfileWidgetState();
}

class _CompleteProfileWidgetState extends State<CompleteProfileWidget> {
  TextEditingController textController1;
  TextEditingController textController2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFFFC700),
      body: SafeArea(
        child: Container(
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
                  child: Lottie.network(
                    'https://assets3.lottiefiles.com/packages/lf20_zta5vxlm.json',
                    width: 300,
                    height: 260,
                    fit: BoxFit.cover,
                    animate: true,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                  child: TextFormField(
                    controller: textController1,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Your Name',
                      labelStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                      hintText: 'Your Name...',
                      hintStyle:
                          FlutterFlowTheme.of(context).bodyText2.override(
                                fontFamily: 'Poppins',
                                color: Color(0xFF556169),
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFC3B9B9),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFC3B9B9),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color(0xFF5B676F),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                  child: TextFormField(
                    controller: textController2,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: 'Your Pup\'s Name',
                      labelStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                      hintText: 'Your Pup\'s Name...',
                      hintStyle:
                          FlutterFlowTheme.of(context).bodyText2.override(
                                fontFamily: 'Poppins',
                                color: Color(0xFF5B676F),
                              ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFC3B9B9),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFC3B9B9),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(
                        FFIcons.kpaw,
                        color: Color(0xFF5B676F),
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.7, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFF2F2),
                        borderRadius: BorderRadius.circular(60),
                      ),
                      child: InkWell(
                        onTap: () async {
                          final usersUpdateData = createUsersRecordData(
                            yourName: textController1.text,
                            displayName: textController2.text,
                          );
                          await currentUserReference.update(usersUpdateData);
                          if (textController1.text != null &&
                              textController1.text != '') {
                            if (textController2.text != null &&
                                textController2.text != '') {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OnboardingWidget(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Please fill all the required fields',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor: Colors.white,
                                ),
                              );
                              return;
                            }

                            return;
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Please fill all the required fields',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor: Colors.white,
                              ),
                            );
                            return;
                          }
                        },
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                          size: 74,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
