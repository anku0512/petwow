import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../onboarding2/onboarding2_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget({Key key}) : super(key: key);

  @override
  _OnboardingWidgetState createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
                  padding: EdgeInsetsDirectional.fromSTEB(5, 20, 5, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'What is ',
                        style: FlutterFlowTheme.of(context).title1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFF121415),
                            ),
                      ),
                      AuthUserStreamWidget(
                        child: Text(
                          currentUserDisplayName,
                          style: FlutterFlowTheme.of(context).title1.override(
                                fontFamily: 'Poppins',
                                color: Color(0xFF121415),
                              ),
                        ),
                      ),
                      Text(
                        '\'s gender?',
                        style: FlutterFlowTheme.of(context).title1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFF121415),
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                  child: InkWell(
                    onTap: () async {
                      final usersUpdateData = createUsersRecordData(
                        gender: 'Male',
                      );
                      await currentUserReference.update(usersUpdateData);
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Onboarding2Widget(),
                        ),
                      );
                    },
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFF2F2),
                        borderRadius: BorderRadius.circular(120),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: FaIcon(
                          FontAwesomeIcons.male,
                          color: Colors.black,
                          size: 150,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'Male',
                  style: FlutterFlowTheme.of(context).title1.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFF101213),
                        fontWeight: FontWeight.w800,
                      ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                  child: InkWell(
                    onTap: () async {
                      final usersUpdateData = createUsersRecordData(
                        gender: 'Female',
                      );
                      await currentUserReference.update(usersUpdateData);
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Onboarding2Widget(),
                        ),
                      );
                    },
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFF2F2),
                        borderRadius: BorderRadius.circular(120),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: FaIcon(
                          FontAwesomeIcons.female,
                          color: Colors.black,
                          size: 150,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'Female',
                  style: FlutterFlowTheme.of(context).title1.override(
                        fontFamily: 'Poppins',
                        color: Color(0xFF101313),
                        fontWeight: FontWeight.w800,
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
