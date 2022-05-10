import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../charming/charming_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../post_page_shy/post_page_shy_widget.dart';

class ShyWidget extends StatefulWidget {
  const ShyWidget({Key key}) : super(key: key);

  @override
  _ShyWidgetState createState() => _ShyWidgetState();
}

class _ShyWidgetState extends State<ShyWidget> {
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
          'SHY',
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
                        'https://media.giphy.com/media/4rPWdbIQK2Pr6GgQMA/giphy.gif',
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      if ((currentUserDocument?.taskShy) == 'Mastered')
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
                height: 210,
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
                                  taskShy: 'In Progress',
                                );
                                await currentUserReference.update(usersUpdateData);
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                    reverseDuration: Duration(milliseconds: 0),
                                    child: ShyWidget(),
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
                                  taskShy: 'Mastered',
                                );
                                await currentUserReference.update(usersUpdateData);
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PostPageShyWidget(),
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
                          'A super charming trick where your dog ',
                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if ((currentUserDocument?.gender) == 'Male')
                              AuthUserStreamWidget(
                                child: Text(
                                  'his',
                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            if ((currentUserDocument?.gender) == 'Female')
                              AuthUserStreamWidget(
                                child: Text(
                                  'her',
                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            Text(
                              ' eyes using one paw. Guaranteed to ',
                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                        child: Text(
                          'get a lot of smiles from people!',
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
                            "Have " + _currentUserDisplayName + " sit in front of you",
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
                            'Place a sticker or tape on ' +
                                _herHis +
                                ' muzzle. Reward whenever ' +
                                _currentUserDisplayName +
                                ' tries to take the object off ' +
                                _herHis +
                                ' face',
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
                    'https://media.giphy.com/media/g5Myp4t1XZgHCAwuju/giphy-downsized-large.gif',
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
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
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
                            'After several repetitions of the previous steps, begin to tap ' +
                                _currentUserDisplayName +
                                '\'s nose after placing the object on ' +
                                _herHis +
                                ' muzzle. This cue will help to phase out the need for placing an object on ' +
                                _currentUserDisplayName +
                                '\s muzzle.',
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
                    'https://media.giphy.com/media/r6DXNjc6EYYiuV5zhZ/giphy.gif',
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
                            'After several repetitions of the previous step, begin trigger the action using only the nose tap',
                            style: getDefaultTextStyle(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.network(
                    'https://media.giphy.com/media/j6gr8KxJgAhxQaSruX/giphy.gif',
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
                    padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                          child: Icon(
                            FFIcons.knumber14,
                            color: Color(0xFFC4C4C4),
                            size: 26,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            'Once ' +
                                _currentUserDisplayName +
                                ' is successfully putting ' +
                                _herHis +
                                ' paw on ' +
                                _herHis +
                                ' nose 9 out of 10 times, begin giving a verbal cue such as "Shy" just before ' +
                                _sheHe +
                                ' about to put ' +
                                _herHis +
                                ' paw on ' +
                                _herHis +
                                ' nose. Reward the moment on success.',
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
                                      'This trick takes a lot of time and experimentation. You will need to keep the object on ' +
                                          _currentUserDisplayName +
                                          '\'s muzzle for several sessions before taking it off and seeing if ' +
                                          _sheHe +
                                          ' offer it on ' +
                                          _herHis +
                                          ' own',
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
