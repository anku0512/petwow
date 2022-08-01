import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../challenge_post/challenge_post_widget.dart';
import '../edit_profile/edit_profile_widget.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../login/login_widget.dart';
import '../main.dart';
import '../past_challenge/past_challenge_widget.dart';
import '../store/store_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PhotoChallengeWidget extends StatefulWidget {
  const PhotoChallengeWidget({Key key}) : super(key: key);

  @override
  _PhotoChallengeWidgetState createState() => _PhotoChallengeWidgetState();
}

class _PhotoChallengeWidgetState extends State<PhotoChallengeWidget> {
  PageController pageViewController;
  String uploadedFileUrl = '';
  String choiceChipsValue;
  PagingController<DocumentSnapshot, ChallengeRecord> _pagingController;
  Query _pagingQuery;
  List<StreamSubscription> _streamSubscriptions = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      endDrawer: Drawer(
        elevation: 16,
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
                                  content:
                                      Text('Are you sure you want to log out?'),
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
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
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
                          padding: EdgeInsetsDirectional.fromSTEB(16, 0, 10, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
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
                                            child: CircularProgressIndicator(
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                child: Text(
                                  'Photo Challenge',
                                  style: FlutterFlowTheme.of(context)
                                      .title2
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 26,
                                      ),
                                ),
                              ),
                              Align(
                                alignment: AlignmentDirectional(0, 0),
                                child: InkWell(
                                  onTap: () async {
                                    scaffoldKey.currentState.openEndDrawer();
                                  },
                                  child: Icon(
                                    Icons.dehaze,
                                    color: Color(0xFF6268A7),
                                    size: 28,
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
                        labelColor: Color(0xFF1F1E23),
                        labelStyle:
                            FlutterFlowTheme.of(context).title2.override(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                ),
                        indicatorColor:
                            FlutterFlowTheme.of(context).secondaryColor,
                        tabs: [
                          Tab(
                            text: 'Current Challenge',
                          ),
                          Tab(
                            text: 'Past Challenge',
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: StreamBuilder<List<ChallengeRecord>>(
                                stream: queryChallengeRecord(),
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
                                  List<ChallengeRecord>
                                      pageViewChallengeRecordList =
                                      snapshot.data;
                                  return Container(
                                    width: double.infinity,
                                    height: 500,
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 50),
                                          child: PageView.builder(
                                            controller: pageViewController ??=
                                                PageController(
                                                    initialPage: min(
                                                        0,
                                                        pageViewChallengeRecordList
                                                                .length -
                                                            1)),
                                            scrollDirection: Axis.horizontal,
                                            itemCount:
                                                pageViewChallengeRecordList
                                                    .length,
                                            itemBuilder:
                                                (context, pageViewIndex) {
                                              final pageViewChallengeRecord =
                                                  pageViewChallengeRecordList[
                                                      pageViewIndex];
                                              return Container(
                                                width: 375,
                                                height: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                ),
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(12,
                                                                    12, 0, 12),
                                                        child: Container(
                                                          width: 300,
                                                          height: 380,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 4,
                                                                color: Colors
                                                                    .black,
                                                                offset: Offset(
                                                                    2, 2),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        4,
                                                                        4,
                                                                        4,
                                                                        4),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Card(
                                                                  clipBehavior:
                                                                      Clip.antiAliasWithSaveLayer,
                                                                  color: Color(
                                                                      0x1EFFFFFF),
                                                                  elevation: 4,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  child: Stack(
                                                                    children: [
                                                                      Image
                                                                          .network(
                                                                        pageViewChallengeRecord
                                                                            .image,
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            200,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              40,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0x56FBE5E5),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0, 0),
                                                                            child:
                                                                                Text(
                                                                              pageViewChallengeRecord.name,
                                                                              style: FlutterFlowTheme.of(context).title1.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: Color(0xFF121415),
                                                                                    fontSize: 30,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Text(
                                                                  pageViewChallengeRecord
                                                                      .statement,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .title3
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: Color(
                                                                            0xFF131516),
                                                                      ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0,
                                                                          -0.05),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            10,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          'Show off your good ',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: Color(0xFF16181A),
                                                                                fontSize: 12,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      if (valueOrDefault(
                                                                              currentUserDocument?.gender,
                                                                              '') ==
                                                                          'Male')
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              10,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              AuthUserStreamWidget(
                                                                            child:
                                                                                Text(
                                                                              'boy ',
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: Color(0xFF16181A),
                                                                                    fontSize: 12,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      if (valueOrDefault(
                                                                              currentUserDocument?.gender,
                                                                              '') ==
                                                                          'Female')
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              10,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              AuthUserStreamWidget(
                                                                            child:
                                                                                Text(
                                                                              'girl ',
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Poppins',
                                                                                    color: Color(0xFF16181A),
                                                                                    fontSize: 12,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            10,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          'with the community',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Poppins',
                                                                                color: Color(0xFF16181A),
                                                                                fontSize: 12,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          10,
                                                                          0,
                                                                          0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                        'Ends on ',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText2
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: Color(0xFF58636C),
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        dateTimeFormat(
                                                                            'MMMMEEEEd',
                                                                            pageViewChallengeRecord.duration),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText2
                                                                            .override(
                                                                              fontFamily: 'Poppins',
                                                                              color: Color(0xFF58636C),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0, 0),
                                                                  child:
                                                                      FFButtonWidget(
                                                                    onPressed:
                                                                        () async {
                                                                      final selectedMedia =
                                                                          await selectMediaWithSourceBottomSheet(
                                                                        context:
                                                                            context,
                                                                        allowPhoto:
                                                                            true,
                                                                      );
                                                                      if (selectedMedia !=
                                                                              null &&
                                                                          selectedMedia.every((m) => validateFileFormat(
                                                                              m.storagePath,
                                                                              context))) {
                                                                        showUploadMessage(
                                                                          context,
                                                                          'Uploading file...',
                                                                          showLoading:
                                                                              true,
                                                                        );
                                                                        final downloadUrls = (await Future.wait(selectedMedia.map((m) async => await uploadData(m.storagePath, m.bytes))))
                                                                            .where((u) =>
                                                                                u !=
                                                                                null)
                                                                            .toList();
                                                                        ScaffoldMessenger.of(context)
                                                                            .hideCurrentSnackBar();
                                                                        if (downloadUrls !=
                                                                                null &&
                                                                            downloadUrls.length ==
                                                                                selectedMedia.length) {
                                                                          setState(() =>
                                                                              uploadedFileUrl = downloadUrls.first);
                                                                          showUploadMessage(
                                                                            context,
                                                                            'Success!',
                                                                          );
                                                                        } else {
                                                                          showUploadMessage(
                                                                            context,
                                                                            'Failed to upload media',
                                                                          );
                                                                          return;
                                                                        }
                                                                      }

                                                                      setState(() =>
                                                                          FFAppState().imagepost =
                                                                              uploadedFileUrl);
                                                                      setState(() => FFAppState()
                                                                              .challengeEntry =
                                                                          pageViewChallengeRecord
                                                                              .reference);
                                                                      if (uploadedFileUrl !=
                                                                              null &&
                                                                          uploadedFileUrl !=
                                                                              '') {
                                                                        await Navigator
                                                                            .push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                ChallengePostWidget(),
                                                                          ),
                                                                        );
                                                                      } else {
                                                                        return;
                                                                      }
                                                                    },
                                                                    text:
                                                                        'Participate now',
                                                                    options:
                                                                        FFButtonOptions(
                                                                      width:
                                                                          160,
                                                                      height:
                                                                          40,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      textStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .subtitle2
                                                                          .override(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                      elevation:
                                                                          4,
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .transparent,
                                                                        width:
                                                                            1,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5, 5, 5, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              'Sort by:',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2,
                                                            ),
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child:
                                                                    FlutterFlowChoiceChips(
                                                                  initiallySelected:
                                                                      choiceChipsValue !=
                                                                              null
                                                                          ? [
                                                                              choiceChipsValue
                                                                            ]
                                                                          : [
                                                                              'Latest'
                                                                            ],
                                                                  options: [
                                                                    ChipData(
                                                                        'Latest'),
                                                                    ChipData(
                                                                        'Popular'),
                                                                    ChipData(
                                                                        'My Entry')
                                                                  ],
                                                                  onChanged: (val) =>
                                                                      setState(() =>
                                                                          choiceChipsValue =
                                                                              val.first),
                                                                  selectedChipStyle:
                                                                      ChipStyle(
                                                                    backgroundColor:
                                                                        Color(
                                                                            0xFF323B45),
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                    iconColor:
                                                                        Colors
                                                                            .white,
                                                                    iconSize:
                                                                        18,
                                                                    elevation:
                                                                        4,
                                                                  ),
                                                                  unselectedChipStyle:
                                                                      ChipStyle(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .white,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2
                                                                        .override(
                                                                          fontFamily:
                                                                              'Poppins',
                                                                          color:
                                                                              Color(0xFF323B45),
                                                                        ),
                                                                    iconColor:
                                                                        Color(
                                                                            0xFF323B45),
                                                                    iconSize:
                                                                        18,
                                                                    elevation:
                                                                        4,
                                                                  ),
                                                                  chipSpacing:
                                                                      10,
                                                                  multiselect:
                                                                      false,
                                                                  initialized:
                                                                      choiceChipsValue !=
                                                                          null,
                                                                  alignment:
                                                                      WrapAlignment
                                                                          .start,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      if (choiceChipsValue ==
                                                          'Latest')
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 32),
                                                          child: StreamBuilder<
                                                              List<
                                                                  PostsRecord>>(
                                                            stream:
                                                                queryPostsRecord(
                                                              queryBuilder: (postsRecord) => postsRecord
                                                                  .where(
                                                                      'challenge',
                                                                      isEqualTo:
                                                                          pageViewChallengeRecord
                                                                              .reference)
                                                                  .orderBy(
                                                                      'created_at',
                                                                      descending:
                                                                          true),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
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
                                                              List<PostsRecord>
                                                                  latestFeedPostsRecordList =
                                                                  snapshot.data;
                                                              return Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: List.generate(
                                                                    latestFeedPostsRecordList
                                                                        .length,
                                                                    (latestFeedIndex) {
                                                                  final latestFeedPostsRecord =
                                                                      latestFeedPostsRecordList[
                                                                          latestFeedIndex];
                                                                  return Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            8,
                                                                            0,
                                                                            12),
                                                                    child: StreamBuilder<
                                                                        UsersRecord>(
                                                                      stream: UsersRecord.getDocument(
                                                                          latestFeedPostsRecord
                                                                              .user),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 50,
                                                                              height: 50,
                                                                              child: CircularProgressIndicator(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        final userPostUsersRecord =
                                                                            snapshot.data;
                                                                        return Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.94,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
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
                                                                                            userPostUsersRecord.photoUrl,
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
                                                                                              userPostUsersRecord.displayName,
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: 'Lexend Deca',
                                                                                                    color: Color(0xFF090F13),
                                                                                                    fontSize: 14,
                                                                                                    fontWeight: FontWeight.normal,
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
                                                                                      if (latestFeedPostsRecord.likedUsers.toList().contains(currentUserReference)) {
                                                                                        // Unlike post

                                                                                        final postsUpdateData = {
                                                                                          'liked_users': FieldValue.arrayRemove([
                                                                                            currentUserReference
                                                                                          ]),
                                                                                        };
                                                                                        await latestFeedPostsRecord.reference.update(postsUpdateData);
                                                                                      } else {
                                                                                        // Like post

                                                                                        final postsUpdateData = {
                                                                                          'liked_users': FieldValue.arrayUnion([
                                                                                            currentUserReference
                                                                                          ]),
                                                                                        };
                                                                                        await latestFeedPostsRecord.reference.update(postsUpdateData);
                                                                                        return;
                                                                                      }
                                                                                    },
                                                                                    child: ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(8),
                                                                                      child: Image.network(
                                                                                        latestFeedPostsRecord.imageUrl,
                                                                                        width: double.infinity,
                                                                                        height: 350,
                                                                                        fit: BoxFit.cover,
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
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              InkWell(
                                                                                                onTap: () async {
                                                                                                  if (latestFeedPostsRecord.likedUsers.toList().contains(currentUserReference)) {
                                                                                                    // Unlike post

                                                                                                    final postsUpdateData = {
                                                                                                      'liked_users': FieldValue.arrayRemove([currentUserReference]),
                                                                                                    };
                                                                                                    await latestFeedPostsRecord.reference.update(postsUpdateData);
                                                                                                  } else {
                                                                                                    // Like post

                                                                                                    final postsUpdateData = {
                                                                                                      'liked_users': FieldValue.arrayUnion([currentUserReference]),
                                                                                                    };
                                                                                                    await latestFeedPostsRecord.reference.update(postsUpdateData);
                                                                                                    return;
                                                                                                  }
                                                                                                },
                                                                                                child: FaIcon(
                                                                                                  FontAwesomeIcons.paw,
                                                                                                  color: Color(0xFF95A1AC),
                                                                                                  size: 24,
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          latestFeedPostsRecord.likedUsers.toList().length.toString(),
                                                                                          '0',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              color: Color(0xFF95A1AC),
                                                                                            ),
                                                                                      ),
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
                                                                                      child: Text(
                                                                                        latestFeedPostsRecord.description,
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'Lexend Deca',
                                                                                              color: Color(0xFF090F13),
                                                                                              fontSize: 14,
                                                                                              fontWeight: FontWeight.normal,
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
                                                                    ),
                                                                  );
                                                                }),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      if (choiceChipsValue ==
                                                          'Popular')
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 32),
                                                          child: StreamBuilder<
                                                              List<
                                                                  PostsRecord>>(
                                                            stream:
                                                                queryPostsRecord(
                                                              queryBuilder: (postsRecord) => postsRecord
                                                                  .where(
                                                                      'challenge',
                                                                      isEqualTo:
                                                                          pageViewChallengeRecord
                                                                              .reference)
                                                                  .orderBy(
                                                                      'total_likes',
                                                                      descending:
                                                                          true),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
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
                                                              List<PostsRecord>
                                                                  popularFeedPostsRecordList =
                                                                  snapshot.data;
                                                              return Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: List.generate(
                                                                    popularFeedPostsRecordList
                                                                        .length,
                                                                    (popularFeedIndex) {
                                                                  final popularFeedPostsRecord =
                                                                      popularFeedPostsRecordList[
                                                                          popularFeedIndex];
                                                                  return Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            8,
                                                                            0,
                                                                            12),
                                                                    child: StreamBuilder<
                                                                        UsersRecord>(
                                                                      stream: UsersRecord.getDocument(
                                                                          popularFeedPostsRecord
                                                                              .user),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 50,
                                                                              height: 50,
                                                                              child: CircularProgressIndicator(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        final userPostUsersRecord =
                                                                            snapshot.data;
                                                                        return Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.94,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
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
                                                                                            userPostUsersRecord.photoUrl,
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
                                                                                              userPostUsersRecord.displayName,
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: 'Lexend Deca',
                                                                                                    color: Color(0xFF090F13),
                                                                                                    fontSize: 14,
                                                                                                    fontWeight: FontWeight.normal,
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
                                                                                      if (popularFeedPostsRecord.likedUsers.toList().contains(currentUserReference)) {
                                                                                        // Unlike post

                                                                                        final postsUpdateData = {
                                                                                          'liked_users': FieldValue.arrayRemove([
                                                                                            currentUserReference
                                                                                          ]),
                                                                                        };
                                                                                        await popularFeedPostsRecord.reference.update(postsUpdateData);
                                                                                      } else {
                                                                                        // Like post

                                                                                        final postsUpdateData = {
                                                                                          'liked_users': FieldValue.arrayUnion([
                                                                                            currentUserReference
                                                                                          ]),
                                                                                        };
                                                                                        await popularFeedPostsRecord.reference.update(postsUpdateData);
                                                                                        return;
                                                                                      }
                                                                                    },
                                                                                    child: ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(8),
                                                                                      child: Image.network(
                                                                                        popularFeedPostsRecord.imageUrl,
                                                                                        width: double.infinity,
                                                                                        height: 350,
                                                                                        fit: BoxFit.cover,
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
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              InkWell(
                                                                                                onTap: () async {
                                                                                                  if (popularFeedPostsRecord.likedUsers.toList().contains(currentUserReference)) {
                                                                                                    // Unlike post

                                                                                                    final postsUpdateData = {
                                                                                                      'liked_users': FieldValue.arrayRemove([currentUserReference]),
                                                                                                    };
                                                                                                    await popularFeedPostsRecord.reference.update(postsUpdateData);
                                                                                                  } else {
                                                                                                    // Like post

                                                                                                    final postsUpdateData = {
                                                                                                      'liked_users': FieldValue.arrayUnion([currentUserReference]),
                                                                                                    };
                                                                                                    await popularFeedPostsRecord.reference.update(postsUpdateData);
                                                                                                    return;
                                                                                                  }
                                                                                                },
                                                                                                child: FaIcon(
                                                                                                  FontAwesomeIcons.paw,
                                                                                                  color: Color(0xFF95A1AC),
                                                                                                  size: 24,
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          popularFeedPostsRecord.likedUsers.toList().length.toString(),
                                                                                          '0',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              color: Color(0xFF95A1AC),
                                                                                            ),
                                                                                      ),
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
                                                                                      child: Text(
                                                                                        popularFeedPostsRecord.description,
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'Lexend Deca',
                                                                                              color: Color(0xFF090F13),
                                                                                              fontSize: 14,
                                                                                              fontWeight: FontWeight.normal,
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
                                                                    ),
                                                                  );
                                                                }),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      if (choiceChipsValue ==
                                                          'My Entry')
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 0, 32),
                                                          child: StreamBuilder<
                                                              List<
                                                                  PostsRecord>>(
                                                            stream:
                                                                queryPostsRecord(
                                                              queryBuilder: (postsRecord) => postsRecord
                                                                  .where(
                                                                      'challenge',
                                                                      isEqualTo:
                                                                          pageViewChallengeRecord
                                                                              .reference)
                                                                  .where('user',
                                                                      isEqualTo:
                                                                          currentUserReference)
                                                                  .orderBy(
                                                                      'created_at',
                                                                      descending:
                                                                          true),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
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
                                                              List<PostsRecord>
                                                                  myEntryFeedPostsRecordList =
                                                                  snapshot.data;
                                                              return Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: List.generate(
                                                                    myEntryFeedPostsRecordList
                                                                        .length,
                                                                    (myEntryFeedIndex) {
                                                                  final myEntryFeedPostsRecord =
                                                                      myEntryFeedPostsRecordList[
                                                                          myEntryFeedIndex];
                                                                  return Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            8,
                                                                            0,
                                                                            12),
                                                                    child: StreamBuilder<
                                                                        UsersRecord>(
                                                                      stream: UsersRecord.getDocument(
                                                                          myEntryFeedPostsRecord
                                                                              .user),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 50,
                                                                              height: 50,
                                                                              child: CircularProgressIndicator(
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        final userPostUsersRecord =
                                                                            snapshot.data;
                                                                        return Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.94,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
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
                                                                                            userPostUsersRecord.photoUrl,
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
                                                                                              userPostUsersRecord.displayName,
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: 'Lexend Deca',
                                                                                                    color: Color(0xFF090F13),
                                                                                                    fontSize: 14,
                                                                                                    fontWeight: FontWeight.normal,
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
                                                                                      if (myEntryFeedPostsRecord.likedUsers.toList().contains(currentUserReference)) {
                                                                                        // Unlike post

                                                                                        final postsUpdateData = {
                                                                                          'liked_users': FieldValue.arrayRemove([
                                                                                            currentUserReference
                                                                                          ]),
                                                                                        };
                                                                                        await myEntryFeedPostsRecord.reference.update(postsUpdateData);
                                                                                      } else {
                                                                                        // Like post

                                                                                        final postsUpdateData = {
                                                                                          'liked_users': FieldValue.arrayUnion([
                                                                                            currentUserReference
                                                                                          ]),
                                                                                        };
                                                                                        await myEntryFeedPostsRecord.reference.update(postsUpdateData);
                                                                                        return;
                                                                                      }
                                                                                    },
                                                                                    child: ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(8),
                                                                                      child: Image.network(
                                                                                        myEntryFeedPostsRecord.imageUrl,
                                                                                        width: double.infinity,
                                                                                        height: 350,
                                                                                        fit: BoxFit.cover,
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
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              InkWell(
                                                                                                onTap: () async {
                                                                                                  if (myEntryFeedPostsRecord.likedUsers.toList().contains(currentUserReference)) {
                                                                                                    // Unlike post

                                                                                                    final postsUpdateData = {
                                                                                                      'liked_users': FieldValue.arrayRemove([currentUserReference]),
                                                                                                    };
                                                                                                    await myEntryFeedPostsRecord.reference.update(postsUpdateData);
                                                                                                  } else {
                                                                                                    // Like post

                                                                                                    final postsUpdateData = {
                                                                                                      'liked_users': FieldValue.arrayUnion([currentUserReference]),
                                                                                                    };
                                                                                                    await myEntryFeedPostsRecord.reference.update(postsUpdateData);
                                                                                                    return;
                                                                                                  }
                                                                                                },
                                                                                                child: FaIcon(
                                                                                                  FontAwesomeIcons.paw,
                                                                                                  color: Color(0xFF95A1AC),
                                                                                                  size: 24,
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          myEntryFeedPostsRecord.likedUsers.toList().length.toString(),
                                                                                          '0',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'Poppins',
                                                                                              color: Color(0xFF95A1AC),
                                                                                            ),
                                                                                      ),
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
                                                                                      child: Text(
                                                                                        myEntryFeedPostsRecord.description,
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'Lexend Deca',
                                                                                              color: Color(0xFF090F13),
                                                                                              fontSize: 14,
                                                                                              fontWeight: FontWeight.normal,
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
                                                                    ),
                                                                  );
                                                                }),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Align(
                                          alignment: AlignmentDirectional(0, 1),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 10),
                                            child: SmoothPageIndicator(
                                              controller: pageViewController ??=
                                                  PageController(
                                                      initialPage: min(
                                                          0,
                                                          pageViewChallengeRecordList
                                                                  .length -
                                                              1)),
                                              count: pageViewChallengeRecordList
                                                  .length,
                                              axisDirection: Axis.horizontal,
                                              onDotClicked: (i) {
                                                pageViewController
                                                    .animateToPage(
                                                  i,
                                                  duration: Duration(
                                                      milliseconds: 500),
                                                  curve: Curves.ease,
                                                );
                                              },
                                              effect: ExpandingDotsEffect(
                                                expansionFactor: 2,
                                                spacing: 8,
                                                radius: 16,
                                                dotWidth: 8,
                                                dotHeight: 8,
                                                dotColor: Color(0xFF9E9E9E),
                                                activeDotColor:
                                                    Color(0xFF3F51B5),
                                                paintStyle: PaintingStyle.fill,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            PagedListView<DocumentSnapshot<Object>,
                                ChallengeRecord>(
                              pagingController: () {
                                final Query<Object> Function(Query<Object>)
                                    queryBuilder = (challengeRecord) =>
                                        challengeRecord.orderBy('created_at');
                                if (_pagingController != null) {
                                  final query =
                                      queryBuilder(ChallengeRecord.collection);
                                  if (query != _pagingQuery) {
                                    // The query has changed
                                    _pagingQuery = query;
                                    _streamSubscriptions
                                        .forEach((s) => s?.cancel());
                                    _streamSubscriptions.clear();
                                    _pagingController.refresh();
                                  }
                                  return _pagingController;
                                }

                                _pagingController =
                                    PagingController(firstPageKey: null);
                                _pagingQuery =
                                    queryBuilder(ChallengeRecord.collection);
                                _pagingController
                                    .addPageRequestListener((nextPageMarker) {
                                  queryChallengeRecordPage(
                                    queryBuilder: (challengeRecord) =>
                                        challengeRecord.orderBy('created_at'),
                                    nextPageMarker: nextPageMarker,
                                    pageSize: 25,
                                    isStream: true,
                                  ).then((page) {
                                    _pagingController.appendPage(
                                      page.data,
                                      page.nextPageMarker,
                                    );
                                    final streamSubscription =
                                        page.dataStream?.listen((data) {
                                      final itemIndexes = _pagingController
                                          .itemList
                                          .asMap()
                                          .map((k, v) =>
                                              MapEntry(v.reference.id, k));
                                      data.forEach((item) {
                                        final index =
                                            itemIndexes[item.reference.id];
                                        final items =
                                            _pagingController.itemList;
                                        if (index != null) {
                                          items.replaceRange(
                                              index, index + 1, [item]);
                                          _pagingController.itemList = {
                                            for (var item in items)
                                              item.reference: item
                                          }.values.toList();
                                        }
                                      });
                                      setState(() {});
                                    });
                                    _streamSubscriptions
                                        .add(streamSubscription);
                                  });
                                });
                                return _pagingController;
                              }(),
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              builderDelegate:
                                  PagedChildBuilderDelegate<ChallengeRecord>(
                                // Customize what your widget looks like when it's loading the first page.
                                firstPageProgressIndicatorBuilder: (_) =>
                                    Center(
                                  child: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                                  ),
                                ),

                                itemBuilder: (context, _, listViewIndex) {
                                  final listViewChallengeRecord =
                                      _pagingController.itemList[listViewIndex];
                                  return Visibility(
                                    visible: listViewChallengeRecord.duration <=
                                        getCurrentTimestamp,
                                    child: InkWell(
                                      onTap: () async {
                                        setState(() => FFAppState()
                                                .challengeEntry =
                                            listViewChallengeRecord.reference);
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                PastChallengeWidget(),
                                          ),
                                        );
                                      },
                                      child: Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        color: Color(0xFFF5F5F5),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 10, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Image.network(
                                                listViewChallengeRecord.image,
                                                width: 120,
                                                height: 100,
                                                fit: BoxFit.cover,
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    listViewChallengeRecord
                                                        .name,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: Colors.black,
                                                        ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        'Ended ',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyText1
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                      ),
                                                      Text(
                                                        dateTimeFormat(
                                                            'relative',
                                                            listViewChallengeRecord
                                                                .duration),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyText1
                                                            .override(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Icon(
                                                Icons
                                                    .arrow_forward_ios_outlined,
                                                color: Colors.black,
                                                size: 30,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
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
      ),
    );
  }
}
