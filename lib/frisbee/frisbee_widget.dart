import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../playful/playful_widget.dart';
import '../post_page_frisbee/post_page_frisbee_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FrisbeeWidget extends StatefulWidget {
  const FrisbeeWidget({Key key}) : super(key: key);

  @override
  _FrisbeeWidgetState createState() => _FrisbeeWidgetState();
}

class _FrisbeeWidgetState extends State<FrisbeeWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final String _herHim =
      currentUserDocument?.gender == 'Female' ? 'her' : 'him';
  final String _sheHe = currentUserDocument?.gender == 'Female' ? 'she' : 'he';
  final String _herHis =
      currentUserDocument?.gender == 'Female' ? 'her' : 'his';
  final String _currentUserDisplayName = currentUserDisplayName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFFFC700),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PlayfulWidget(),
              ),
            );
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 24,
          ),
        ),
        title: Text(
          'FRISBEE',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              Stack(
                children: [
                  Stack(
                    children: [
                      Image.network(
                        'https://images.unsplash.com/photo-1601525449158-4910e736c19c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      if ((currentUserDocument?.taskFrisbee) == 'Mastered')
                        Align(
                          alignment: AlignmentDirectional(0.81, -0.07),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: AuthUserStreamWidget(
                              child: Icon(
                                FFIcons.kaward4,
                                color: Color(0xFF1E1717),
                                size: 80,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 245,
                decoration: BoxDecoration(
                  color: Color(0xFFFFC700),
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: Text(
                          'DIFFICULTY',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 18,
                                  ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                            child: FaIcon(
                              FontAwesomeIcons.paw,
                              color: Colors.black,
                              size: 24,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                            child: FaIcon(
                              FontAwesomeIcons.paw,
                              color: Colors.black,
                              size: 24,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                            child: FaIcon(
                              FontAwesomeIcons.paw,
                              color: Color(0x40000000),
                              size: 24,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                            child: FaIcon(
                              FontAwesomeIcons.paw,
                              color: Color(0x40000000),
                              size: 24,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                            child: FaIcon(
                              FontAwesomeIcons.paw,
                              color: Color(0x40000000),
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'STATUS',
                        style: FlutterFlowTheme.of(context).bodyText1,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 5, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                final usersUpdateData = createUsersRecordData(
                                  taskFrisbee: 'In Progress',
                                );
                                await currentUserReference
                                    .update(usersUpdateData);
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                    reverseDuration: Duration(milliseconds: 0),
                                    child: FrisbeeWidget(),
                                  ),
                                );
                              },
                              text: 'In Progress',
                              options: FFButtonOptions(
                                width: 120,
                                height: 30,
                                color: Color(0xFFD0D0D0),
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: 12,
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                final usersUpdateData = createUsersRecordData(
                                  taskFrisbee: 'Mastered',
                                );
                                await currentUserReference
                                    .update(usersUpdateData);
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PostPageFrisbeeWidget(),
                                  ),
                                );
                              },
                              text: 'Mastered',
                              options: FFButtonOptions(
                                width: 120,
                                height: 30,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                textStyle: FlutterFlowTheme.of(context)
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
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 20, 10, 0),
                        child: Flexible(
                          child: Text(
                            'These basics will help prepare you and your dog to being able to play frisbee catch.',
                            style: getDefaultTextStyle(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Text(
                            'STEPS',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                          child: Icon(
                            FFIcons.knumber10,
                            color: Color(0xFFC4C4C4),
                            size: 26,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            "Get " +
                                _currentUserDisplayName +
                                " interested in the frisbee. You can do this by placing food or treats on the frisbee or dragging the frisbee across the floor to get " +
                                _herHim +
                                " to follow it.",
                            style: getDefaultTextStyle(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.network(
                    'https://media.giphy.com/media/Hzn7IeAJQ65OrDlJRz/giphy.gif',
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                              child: Icon(
                                FFIcons.knumber11,
                                color: Color(0xFFC4C4C4),
                                size: 26,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                "Once " +
                                    _currentUserDisplayName +
                                    " starts going after the frisbee, try and get " +
                                    _herHim +
                                    " to tug it.",
                                style: getDefaultTextStyle(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.network(
                        'https://media.giphy.com/media/Y0zux7pVk6Jk63vIfr/giphy.gif',
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                              child: Icon(
                                FFIcons.knumber12,
                                color: Color(0xFFC4C4C4),
                                size: 26,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                "Once " +
                                    _currentUserDisplayName +
                                    " has an interest in playing with the frisbee, try doing some \"takes\". With frisbee in your hand, raise the frisbee and have " +
                                    _currentUserDisplayName +
                                    " take the frisbee out of your hand. Switch hands and repeat back and forth several times. If you have multiple frisbees, you can hold a frisbee in each hand and alternative.",
                                style: getDefaultTextStyle(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.network(
                        'https://media.giphy.com/media/nIPTULcx5yhFBvAkUV/giphy.gif',
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                              child: Icon(
                                FFIcons.knumber13,
                                color: Color(0xFFC4C4C4),
                                size: 26,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                "Repeat step 3 until " +
                                    _currentUserDisplayName +
                                    " is successfully taking the frisbee from your hands.",
                                style: getDefaultTextStyle(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                              child: Icon(
                                FFIcons.knumber14,
                                color: Color(0xFFC4C4C4),
                                size: 26,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                "Before you get " +
                                    _currentUserDisplayName +
                                    " ready for " +
                                    _herHis +
                                    " first catch, you need to teach " +
                                    _herHim +
                                    " to run around you first. This sets " +
                                    _herHim +
                                    " up so that " +
                                    _sheHe +
                                    "\'s facing the same direction the frisbee will be thrown, and it also directs " +
                                    _herHis +
                                    " focus to the frisbee. To do this place " +
                                    _currentUserDisplayName +
                                    " in front of you and lure " +
                                    _herHim +
                                    " back around your legs. Be sure to reward once " +
                                    _sheHe +
                                    " completes the turn. Do this several times until you can just point and ask for an \"around\".",
                                style: getDefaultTextStyle(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.network(
                        'https://media.giphy.com/media/skE4JsmaUfAoc0c4NO/giphy.gif',
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                              child: Icon(
                                FFIcons.knumber15,
                                color: Color(0xFFC4C4C4),
                                size: 26,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                "Once " +
                                    _currentUserDisplayName +
                                    " is familiar with the \"around\" cue, begin to roll the frisbee out in front of you to get " +
                                    _currentUserDisplayName +
                                    " familiar with chasing after the frisbee. Praise and reward once " +
                                    _currentUserDisplayName +
                                    " chases down the frisbee.",
                                style: getDefaultTextStyle(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.network(
                        'https://media.giphy.com/media/DNSgoOezCSiE6sH2Ey/giphy.gif',
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                              child: Icon(
                                FFIcons.knumber16,
                                color: Color(0xFFC4C4C4),
                                size: 26,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                "Now " +
                                    _currentUserDisplayName +
                                    " is ready for " +
                                    _herHis +
                                    " first catch! Cue \'around\' and throw the frisbee a few feet in front of you. " +
                                    _currentUserDisplayName +
                                    " should go out and try to catch it! Reward for any catches.",
                                style: getDefaultTextStyle(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.network(
                        'https://media.giphy.com/media/6rDwwRmo6pe8NX3J3B/giphy.gif',
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                              child: Icon(
                                FFIcons.knumber17,
                                color: Color(0xFFC4C4C4),
                                size: 26,
                              ),
                            ),
                            Flexible(
                              child: Text(
                                "Repeat step 7 several times until " +
                                    _currentUserDisplayName +
                                    " can make consecutive catches.",
                                style: getDefaultTextStyle(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 40,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0),
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 180,
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
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                          border: Border.all(
                            width: 2,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                              child: Text(
                                'TIPS',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    FFIcons.kcheckmark1,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                  Flexible(
                                    child: Text(
                                      "Many make the mistake of just tossing the frisbee out. Take your time for " +
                                          _currentUserDisplayName +
                                          " to develop interest in the frisbee and then make it your goal to get a catch.",
                                      style: getDefaultTextStyle(),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
