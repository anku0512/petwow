import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PastChallengeWidget extends StatefulWidget {
  const PastChallengeWidget({Key key}) : super(key: key);

  @override
  _PastChallengeWidgetState createState() => _PastChallengeWidgetState();
}

class _PastChallengeWidgetState extends State<PastChallengeWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFFFC700),
        automaticallyImplyLeading: true,
        title: StreamBuilder<ChallengeRecord>(
          stream: ChallengeRecord.getDocument(FFAppState().challengeEntry),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    color: FlutterFlowTheme.of(context).primaryColor,
                  ),
                ),
              );
            }
            final textChallengeRecord = snapshot.data;
            return Text(
              textChallengeRecord.name,
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Poppins',
                    color: Colors.white,
                    fontSize: 22,
                  ),
            );
          },
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 32),
              child: StreamBuilder<List<PostsRecord>>(
                stream: queryPostsRecord(
                  queryBuilder: (postsRecord) => postsRecord
                      .where('challenge',
                          isEqualTo: FFAppState().challengeEntry)
                      .orderBy('created_at', descending: true),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.of(context).primaryColor,
                        ),
                      ),
                    );
                  }
                  List<PostsRecord> latestFeedPostsRecordList = snapshot.data;
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(latestFeedPostsRecordList.length,
                          (latestFeedIndex) {
                        final latestFeedPostsRecord =
                            latestFeedPostsRecordList[latestFeedIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
                          child: StreamBuilder<UsersRecord>(
                            stream: UsersRecord.getDocument(
                                latestFeedPostsRecord.user),
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
                              final userPostUsersRecord = snapshot.data;
                              return Container(
                                width: MediaQuery.of(context).size.width * 0.94,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 2, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: Color(0xFF4B39EF),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(1, 1, 1, 1),
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(12, 0, 0, 0),
                                                  child: Text(
                                                    userPostUsersRecord
                                                        .displayName,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Lexend Deca',
                                                          color:
                                                              Color(0xFF090F13),
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 0, 0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.96,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 6,
                                              color: Color(0x3A000000),
                                              offset: Offset(0, 2),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: InkWell(
                                          onDoubleTap: () async {
                                            if (latestFeedPostsRecord.likedUsers
                                                .toList()
                                                .contains(
                                                    currentUserReference)) {
                                              // Unlike post

                                              final postsUpdateData = {
                                                'liked_users':
                                                    FieldValue.arrayRemove(
                                                        [currentUserReference]),
                                              };
                                              await latestFeedPostsRecord
                                                  .reference
                                                  .update(postsUpdateData);
                                            } else {
                                              // Like post

                                              final postsUpdateData = {
                                                'liked_users':
                                                    FieldValue.arrayUnion(
                                                        [currentUserReference]),
                                              };
                                              await latestFeedPostsRecord
                                                  .reference
                                                  .update(postsUpdateData);
                                              return;
                                            }
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
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
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 4, 8, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 16, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    InkWell(
                                                      onTap: () async {
                                                        if (latestFeedPostsRecord
                                                            .likedUsers
                                                            .toList()
                                                            .contains(
                                                                currentUserReference)) {
                                                          // Unlike post

                                                          final postsUpdateData =
                                                              {
                                                            'liked_users':
                                                                FieldValue
                                                                    .arrayRemove([
                                                              currentUserReference
                                                            ]),
                                                          };
                                                          await latestFeedPostsRecord
                                                              .reference
                                                              .update(
                                                                  postsUpdateData);
                                                        } else {
                                                          // Like post

                                                          final postsUpdateData =
                                                              {
                                                            'liked_users':
                                                                FieldValue
                                                                    .arrayUnion([
                                                              currentUserReference
                                                            ]),
                                                          };
                                                          await latestFeedPostsRecord
                                                              .reference
                                                              .update(
                                                                  postsUpdateData);
                                                          return;
                                                        }
                                                      },
                                                      child: FaIcon(
                                                        FontAwesomeIcons.paw,
                                                        color:
                                                            Color(0xFF95A1AC),
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
                                                latestFeedPostsRecord.likedUsers
                                                    .toList()
                                                    .length
                                                    .toString(),
                                                '0',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFF95A1AC),
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2, 4, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              latestFeedPostsRecord.description,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: Color(0xFF090F13),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
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
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
