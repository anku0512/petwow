import '../auth/auth_util.dart';
import '../doorbell/doorbell_widget.dart';
import '../duration/duration_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../intro/intro_widget.dart';
import '../new_dog/new_dog_widget.dart';
import '../send_to_place/send_to_place_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaceworkWidget extends StatefulWidget {
  const PlaceworkWidget({Key key}) : super(key: key);

  @override
  _PlaceworkWidgetState createState() => _PlaceworkWidgetState();
}

class _PlaceworkWidgetState extends State<PlaceworkWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewDogWidget(),
              ),
            );
          },
          child: Icon(
            Icons.arrow_back_sharp,
            color: Colors.black,
            size: 28,
          ),
        ),
        title: Text(
          'Placework',
          style: FlutterFlowTheme.of(context).title1.override(
                fontFamily: 'Lexend Deca',
                color: Color(0xFF090F13),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Color(0xFFF1F4F8),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => IntroWidget(),
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
                            'https://images.unsplash.com/photo-1608500567505-269fa4192c58?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1232&q=80',
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
                        child: Stack(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 16, 16, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'INTRO',
                                            style: FlutterFlowTheme.of(context)
                                                .title1
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Colors.white,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.chevron_right_rounded,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 4, 16, 16),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    if ((currentUserDocument
                                                            ?.placeworkIntro) ==
                                                        'Mastered')
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(15, 0,
                                                                    0, 0),
                                                        child:
                                                            AuthUserStreamWidget(
                                                          child: Icon(
                                                            FFIcons.kclipboard,
                                                            color: Colors.white,
                                                            size: 46,
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                Icon(
                                                  Icons.settings_outlined,
                                                  color: Colors.black,
                                                  size: 4,
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1, 0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 4),
                                                    child: Text(
                                                      'Diffculty',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .title3
                                                          .override(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            color: Colors.white,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -0.05, 0.15),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 5, 0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons.paw,
                                                          color: Colors.black,
                                                          size: 24,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 5, 0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons.paw,
                                                          color:
                                                              Color(0x41000000),
                                                          size: 24,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 5, 0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons.paw,
                                                          color:
                                                              Color(0x41000000),
                                                          size: 24,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 5, 0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons.paw,
                                                          color:
                                                              Color(0x41000000),
                                                          size: 24,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 5, 0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons.paw,
                                                          color:
                                                              Color(0x40000000),
                                                          size: 24,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(150,
                                                                    0, 0, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            if ((currentUserDocument
                                                                    ?.placeworkIntro) ==
                                                                'In Progress')
                                                              AuthUserStreamWidget(
                                                                child: Icon(
                                                                  FFIcons
                                                                      .khourGlass,
                                                                  color: Colors
                                                                      .black,
                                                                  size: 24,
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
                                        ],
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
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DurationWidget(),
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
                            'https://images.unsplash.com/photo-1516222338250-863216ce01ea?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80',
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
                        child: Stack(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 16, 16, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'DURATION',
                                            style: FlutterFlowTheme.of(context)
                                                .title1
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Colors.white,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.chevron_right_rounded,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 4, 16, 16),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    if ((currentUserDocument
                                                            ?.placeworkDuration) ==
                                                        'Mastered')
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(15, 0,
                                                                    0, 0),
                                                        child:
                                                            AuthUserStreamWidget(
                                                          child: Icon(
                                                            FFIcons.kclipboard,
                                                            color: Colors.white,
                                                            size: 46,
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                Icon(
                                                  Icons.settings_outlined,
                                                  color: Colors.black,
                                                  size: 4,
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1, 0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 4),
                                                    child: Text(
                                                      'Diffculty',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .title3
                                                          .override(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            color: Colors.white,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -0.05, 0.15),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 5, 0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons.paw,
                                                          color: Colors.black,
                                                          size: 24,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 5, 0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons.paw,
                                                          color: Colors.black,
                                                          size: 24,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 5, 0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons.paw,
                                                          color: Colors.black,
                                                          size: 24,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 5, 0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons.paw,
                                                          color:
                                                              Color(0x41000000),
                                                          size: 24,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 5, 0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons.paw,
                                                          color:
                                                              Color(0x40000000),
                                                          size: 24,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(150,
                                                                    0, 0, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            if ((currentUserDocument
                                                                    ?.placeworkDuration) ==
                                                                'In Progress')
                                                              AuthUserStreamWidget(
                                                                child: Icon(
                                                                  FFIcons
                                                                      .khourGlass,
                                                                  color: Colors
                                                                      .black,
                                                                  size: 24,
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
                                        ],
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
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SendToPlaceWidget(),
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
                            'https://images.unsplash.com/photo-1543164888-462c8603cbd9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
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
                        child: Stack(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 16, 16, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'SEND TO PLACE',
                                            style: FlutterFlowTheme.of(context)
                                                .title1
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Colors.white,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.chevron_right_rounded,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 4, 16, 16),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    if ((currentUserDocument
                                                            ?.placeworkSendToPlace) ==
                                                        'Mastered')
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(15, 0,
                                                                    0, 0),
                                                        child:
                                                            AuthUserStreamWidget(
                                                          child: Icon(
                                                            FFIcons.kclipboard,
                                                            color: Colors.white,
                                                            size: 46,
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                Icon(
                                                  Icons.settings_outlined,
                                                  color: Colors.black,
                                                  size: 4,
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1, 0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 4),
                                                    child: Text(
                                                      'Diffculty',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .title3
                                                          .override(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            color: Colors.white,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -0.05, 0.15),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 5, 0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons.paw,
                                                          color: Colors.black,
                                                          size: 24,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 5, 0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons.paw,
                                                          color: Colors.black,
                                                          size: 24,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 5, 0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons.paw,
                                                          color:
                                                              Color(0x41000000),
                                                          size: 24,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 5, 0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons.paw,
                                                          color:
                                                              Color(0x41000000),
                                                          size: 24,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 5, 0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons.paw,
                                                          color:
                                                              Color(0x40000000),
                                                          size: 24,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(150,
                                                                    0, 0, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            if ((currentUserDocument
                                                                    ?.placeworkSendToPlace) ==
                                                                'In Progress')
                                                              AuthUserStreamWidget(
                                                                child: Icon(
                                                                  FFIcons
                                                                      .khourGlass,
                                                                  color: Colors
                                                                      .black,
                                                                  size: 24,
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
                                        ],
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
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DoorbellWidget(),
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
                            'https://images.unsplash.com/photo-1626633284088-a8d0415d7f14?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1191&q=80',
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
                        child: Stack(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 16, 16, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            'DOORBELL',
                                            style: FlutterFlowTheme.of(context)
                                                .title1
                                                .override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Colors.white,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.chevron_right_rounded,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16, 4, 16, 16),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    if ((currentUserDocument
                                                            ?.placeworkDoorbell) ==
                                                        'Mastered')
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(15, 0,
                                                                    0, 0),
                                                        child:
                                                            AuthUserStreamWidget(
                                                          child: Icon(
                                                            FFIcons.kclipboard,
                                                            color: Colors.white,
                                                            size: 46,
                                                          ),
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                                Icon(
                                                  Icons.settings_outlined,
                                                  color: Colors.black,
                                                  size: 4,
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1, 0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 4),
                                                    child: Text(
                                                      'Diffculty',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .title3
                                                          .override(
                                                            fontFamily:
                                                                'Lexend Deca',
                                                            color: Colors.white,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -0.05, 0.15),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 5, 0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons.paw,
                                                          color: Colors.black,
                                                          size: 24,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 5, 0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons.paw,
                                                          color: Colors.black,
                                                          size: 24,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 5, 0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons.paw,
                                                          color:
                                                              Color(0x41000000),
                                                          size: 24,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 5, 0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons.paw,
                                                          color:
                                                              Color(0x41000000),
                                                          size: 24,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 5, 0),
                                                        child: FaIcon(
                                                          FontAwesomeIcons.paw,
                                                          color:
                                                              Color(0x40000000),
                                                          size: 24,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(150,
                                                                    0, 0, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            if ((currentUserDocument
                                                                    ?.placeworkDoorbell) ==
                                                                'In Progress')
                                                              AuthUserStreamWidget(
                                                                child: Icon(
                                                                  FFIcons
                                                                      .khourGlass,
                                                                  color: Colors
                                                                      .black,
                                                                  size: 24,
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
                                        ],
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
