import '../_pw_files/pw_constant.dart';
import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../basic/basic_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../post_page_down/post_page_down_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../_pw_files/pw_constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../down/down_widget.dart';



class DownWidget extends StatefulWidget {
  const DownWidget({Key key}) : super(key: key);

  @override
  _DownWidgetState createState() => _DownWidgetState();
}

class _DownWidgetState extends State<DownWidget> {
  String dropDownValue;
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
                builder: (context) => BasicWidget(),
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
          'DOWN',
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
                        'assets/images/down.png',
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      if ((currentUserDocument?.taskDown) == 'Mastered')
                        Align(
                          alignment: AlignmentDirectional(0.81, -0.07),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: AuthUserStreamWidget(
                              child: Icon(
                                FFIcons.kaward4,
                                color: Color(0xBCFFFFFF),
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
                height: 235,
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
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AuthUserStreamWidget(
                            child: FlutterFlowDropDown(
                              initialOption: dropDownValue ??=
                                  valueOrDefault(
                                      currentUserDocument?.taskDown, ''),
                              options: [
                                'Not in progress',
                                'In Progress',
                                'Mastered'
                              ],
                              onChanged: (val) =>
                                  setState(() => dropDownValue = val),
                              width: 180,
                              height: 40,
                              textStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                fontFamily: 'Poppins',
                                color: Colors.black,
                              ),
                              hintText: 'Please select...',
                              fillColor: Colors.white,
                              elevation: 2,
                              borderColor: Colors.transparent,
                              borderWidth: 0,
                              borderRadius: 8,
                              margin: EdgeInsetsDirectional.fromSTEB(
                                  12, 4, 12, 4),
                              hidesUnderline: true,
                            ),
                          ),
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: InkWell(
                              onTap: () async {
                                final usersUpdateData =
                                createUsersRecordData(
                                  taskDown: dropDownValue,
                                );
                                await currentUserReference
                                    .update(usersUpdateData);

                                },
                              child: Icon(
                                Icons.check_circle_outline,
                                color: Colors.black,
                                size: 32,
                              ),
                            ),
                          ),
                        ],
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
                                  taskDown: 'In Progress',
                                );
                                await currentUserReference
                                    .update(usersUpdateData);
                                await Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                    reverseDuration: Duration(milliseconds: 0),
                                    child: DownWidget(),
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
                                  taskDown: 'Mastered',
                                );
                                await currentUserReference
                                    .update(usersUpdateData);
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PostPageDownWidget(),
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
                        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                        child: Text(
                          "Teaching your dog to lie down on cue will help to re-focus " +
                              _herHis +
                              " attention. It\'s also helpful prep for dogs that need to be left alone for long periods of time.",
                          style: getParagraphTextStyle(),
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
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                          child: Icon(
                            FFIcons.knumber10,
                            color: Color(0xFFC4C4C4),
                            size: 26,
                          ),
                        ),
                        Text(
                          "Have " +
                              _currentUserDisplayName +
                              " stand in front of you.",
                          style: getParagraphTextStyle(),
                        ),
                      ],
                    ),
                  ),
                  Image.network(
                    'https://media.giphy.com/media/5mHThMLlyYHNheRGcQ/giphy.gif',
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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            "Lure " +
                                _herHis +
                                " head into " +
                                _herHis +
                                " chest. Reward for any bending of the front legs.",
                            style: getParagraphTextStyle(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.network(
                    'https://media.giphy.com/media/eQaegFkkDtIzQ5iSY1/giphy.gif',
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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            "Once " +
                                _herHis +
                                " hind legs also bend and " +
                                _sheHe +
                                " completely lies down. Reward " +
                                _herHim +
                                " with a treat again.",
                            style: getParagraphTextStyle(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.network(
                    'https://media.giphy.com/media/UnQGe3Mb7ZTT50c3ag/giphy-downsized-large.gif',
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
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            "Once " +
                                _currentUserDisplayName +
                                " is successfully lying down 9 out of 10 times with a lure, begin giving a verbal cue such as \"Down\" just before " +
                                _sheHe +
                                "\'s about to completely lie down. Reward the moment " +
                                _sheHe +
                                " completes the lie down motion.",
                            style: getParagraphTextStyle(),
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
                        height: 200,
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
                                      "If " +
                                          _currentUserDisplayName +
                                          " is having trouble lying down all the way, try having " +
                                          _herHim +
                                          " on an elevated surface.",
                                      style: getParagraphTextStyle(),
                                    ),
                                  ),
                                ],
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
                                      "Another option to help teach \"Down\" is to lure " +
                                          _currentUserDisplayName +
                                          " under your leg.",
                                      style: getParagraphTextStyle(),
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
