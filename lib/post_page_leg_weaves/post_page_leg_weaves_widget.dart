import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../leg_weaves/leg_weaves_widget.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostPageLegWeavesWidget extends StatefulWidget {
  const PostPageLegWeavesWidget({Key key}) : super(key: key);

  @override
  _PostPageLegWeavesWidgetState createState() =>
      _PostPageLegWeavesWidgetState();
}

class _PostPageLegWeavesWidgetState extends State<PostPageLegWeavesWidget> {
  String uploadedFileUrl = '';
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(
        text: 'Hey! look I just trained my dog with this amazing trick.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
              child: InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LegWeavesWidget(),
                    ),
                  );
                },
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            ),
            Text(
              'Show off ',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontSize: 18,
                  ),
            ),
            AuthUserStreamWidget(
              child: Text(
                currentUserDisplayName,
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontSize: 18,
                    ),
              ),
            ),
            Text(
              '\'s Skills',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontSize: 18,
                  ),
            ),
          ],
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.94,
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child: InkWell(
                          onTap: () async {
                            final selectedMedia =
                                await selectMediaWithSourceBottomSheet(
                              context: context,
                              allowPhoto: true,
                              allowVideo: true,
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              showUploadMessage(
                                context,
                                'Uploading file...',
                                showLoading: true,
                              );
                              final downloadUrls = (await Future.wait(
                                      selectedMedia.map((m) async =>
                                          await uploadData(
                                              m.storagePath, m.bytes))))
                                  .where((u) => u != null)
                                  .toList();
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              if (downloadUrls != null &&
                                  downloadUrls.length == selectedMedia.length) {
                                setState(
                                    () => uploadedFileUrl = downloadUrls.first);
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
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.96,
                            height: 350,
                            decoration: BoxDecoration(
                              color: Color(0xFFF1F4F8),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.network(
                                  valueOrDefault<String>(
                                    uploadedFileUrl,
                                    'https://i.pinimg.com/originals/55/06/b9/5506b934bb77ada998935b235cf4e59a.png',
                                  ),
                                ).image,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 6,
                                  color: Color(0x3A000000),
                                  offset: Offset(0, 2),
                                )
                              ],
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: textController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: true,
                                  hintText: 'Comment....',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .bodyText2
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Color(0xFF95A1AC),
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFB6B6B6),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xFFB6B6B6),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          20, 32, 20, 12),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF090F13),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                textAlign: TextAlign.start,
                                maxLines: 4,
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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 5, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Show off how ',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 18,
                      ),
                ),
                AuthUserStreamWidget(
                  child: Text(
                    currentUserDisplayName,
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontSize: 18,
                        ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 0, 5, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'performs this amazing trick.',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontSize: 18,
                      ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
            child: FFButtonWidget(
              onPressed: () async {
                final postsCreateData = createPostsRecordData(
                  imageUrl: uploadedFileUrl,
                  user: currentUserReference,
                  createdAt: getCurrentTimestamp,
                  description: textController.text,
                );
                await PostsRecord.collection.doc().set(postsCreateData);
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NavBarPage(initialPage: 'home'),
                  ),
                );
              },
              text: 'Post',
              options: FFButtonOptions(
                width: 270,
                height: 50,
                color: Color(0xFF4B39EF),
                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                      fontFamily: 'Lexend Deca',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
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
        ],
      ),
    );
  }
}
