import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../charming/charming_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../post_page_cross_paws/post_page_cross_paws_widget.dart';

class CrossPawsWidget extends StatefulWidget {
  const CrossPawsWidget({Key key}) : super(key: key);

  @override
  _CrossPawsWidgetState createState() => _CrossPawsWidgetState();
}

class _CrossPawsWidgetState extends State<CrossPawsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final String _herHim = currentUserDocument?.gender == 'Female' ? 'her' : 'him';
  final String _sheHe = currentUserDocument?.gender == 'Female' ? 'she' : 'he';
  final String _herHis = currentUserDocument?.gender == 'Female' ? 'her' : 'his';
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
                builder: (context) => CharmingWidget(),
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
          'CROSS PAWS',
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
                      Image.asset(
                        'assets/images/crosspaws.png',
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      if ((currentUserDocument?.taskCrossPaws) == 'Mastered')
                        Align(
                          alignment: AlignmentDirectional(0.81, -0.07),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: AuthUserStreamWidget(
                              child: Icon(
                                FFIcons.kaward4,
                                color: Color(0xA9FFFFFF),
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
                height: 260,
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
                          style: FlutterFlowTheme.of(context).bodyText1.override(
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
                              color: Color(0x41000000),
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
                                  taskCrossPaws: 'In Progress',
                                );
                                await currentUserReference.update(usersUpdateData);
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                    reverseDuration: Duration(milliseconds: 0),
                                    child: CrossPawsWidget(),
                                  ),
                                );
                              },
                              text: 'In Progress',
                              options: FFButtonOptions(
                                width: 120,
                                height: 30,
                                color: Color(0xFFD0D0D0),
                                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
                                  taskCrossPaws: 'Mastered',
                                );
                                await currentUserReference.update(usersUpdateData);
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PostPageCrossPawsWidget(),
                                  ),
                                );
                              },
                              text: 'Mastered',
                              options: FFButtonOptions(
                                width: 120,
                                height: 30,
                                color: FlutterFlowTheme.of(context).primaryColor,
                                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
                        child: Text(
                          'This is a trick where your pup crosses one paw over the other. It’s a trick that’s entertaining and extremely easy to achieve.',
                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
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
                            style: FlutterFlowTheme.of(context).bodyText1.override(
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
                            'Have ' + _currentUserDisplayName + ' lie in front of you',
                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF020202),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ],
                    ),
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
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                          child: Icon(
                            FFIcons.knumber11,
                            color: Color(0xFFC4C4C4),
                            size: 26,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            'With your hand cover the paw that you don\'t want to move. With your other hand, lure ' +
                                _currentUserDisplayName +
                                '\'s head over ' +
                                _herHis +
                                ' covered paw. When ' +
                                _herHis +
                                ' uncovered paw crosses over the covered one, reward ' +
                                _herHim,
                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF020202),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.network(
                    'https://media.giphy.com/media/TORK237t3FmPDL1ItF/giphy.gif',
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                          child: Icon(
                            FFIcons.knumber12,
                            color: Color(0xFFC4C4C4),
                            size: 26,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            'Once ' +
                                _herHis +
                                ' is successfully crossing ' +
                                _herHis +
                                ' paw 9 out of 10 times with a lure, begin giving a verbal cue such as "cross" just before ' +
                                _sheHe +
                                ' is about to complete the trick. Reward the moment ' +
                                _sheHe +
                                ' touches your hand.',
                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF050505),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ],
                    ),
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
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                          child: Icon(
                            FFIcons.knumber13,
                            color: Color(0xFFC4C4C4),
                            size: 26,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            'Once ' +
                                _currentUserDisplayName +
                                ' is familiar with the verbal cue, you can phase out the need for covering ' +
                                _currentUserDisplayName +
                                '\'s paw by removing that step and continuing to use the lure with the verbal cue',
                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF020202),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.network(
                    'https://media.giphy.com/media/jMS4PASyKpGmVKw4Dk/giphy.gif',
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    fit: BoxFit.cover,
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
                        height: 240,
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
                              padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                              child: Text(
                                'TIPS',
                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    FFIcons.kcheckmark1,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                  Flexible(
                                    child: Text(
                                      'Some dogs don\'t like their paws being touched. If that is the case with ' +
                                          _currentUserDisplayName +
                                          ', work on desensitizing ' +
                                          _herHim +
                                          ' to having ' +
                                          _herHis +
                                          ' paws touched.',
                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                            fontFamily: 'Poppins',
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    FFIcons.kcheckmark1,
                                    color: Colors.black,
                                    size: 24,
                                  ),
                                  Flexible(
                                    child: Text(
                                      'Another common issue is ' +
                                          _currentUserDisplayName +
                                          ' might try to stand up if you lure ' +
                                          _herHis +
                                          ' head too quickly. Patience is key!',
                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                            fontFamily: 'Poppins',
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
