import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/upload_media.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboarding3Widget extends StatefulWidget {
  const Onboarding3Widget({Key key}) : super(key: key);

  @override
  _Onboarding3WidgetState createState() => _Onboarding3WidgetState();
}

class _Onboarding3WidgetState extends State<Onboarding3Widget> {
  String uploadedFileUrl = '';
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
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 80, 0, 0),
                    child: InkWell(
                      onTap: () async {
                        final selectedMedia =
                            await selectMediaWithSourceBottomSheet(
                          context: context,
                          allowPhoto: true,
                          backgroundColor: Color(0xFFFFE1E1),
                          textColor: Color(0xFF030303),
                        );
                        if (selectedMedia != null &&
                            selectedMedia.every((m) =>
                                validateFileFormat(m.storagePath, context))) {
                          showUploadMessage(
                            context,
                            'Uploading file...',
                            showLoading: true,
                          );
                          final downloadUrls = (await Future.wait(selectedMedia
                                  .map((m) async => await uploadData(
                                      m.storagePath, m.bytes))))
                              .where((u) => u != null)
                              .toList();
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
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
                        width: 260,
                        height: 260,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          valueOrDefault<String>(
                            uploadedFileUrl,
                            'https://i.pinimg.com/originals/8d/7a/ac/8d7aac5e9618fb38e2102fef774c7ba9.gif',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Upload a photo of ',
                        style: FlutterFlowTheme.of(context).title2.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFF58646D),
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      AuthUserStreamWidget(
                        child: Text(
                          currentUserDisplayName,
                          style: FlutterFlowTheme.of(context).title2.override(
                                fontFamily: 'Poppins',
                                color: Color(0xFF58646D),
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
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
                            photoUrl: uploadedFileUrl,
                          );
                          await currentUserReference.update(usersUpdateData);
                          if (uploadedFileUrl != null &&
                              uploadedFileUrl != '') {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    NavBarPage(initialPage: 'lessons'),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Upload picture of your pup to continue',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                duration: Duration(milliseconds: 4000),
                                backgroundColor: Colors.white,
                              ),
                            );
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
                InkWell(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NavBarPage(initialPage: 'lessons'),
                      ),
                    );
                  },
                  child: Text(
                    'Later',
                    style: FlutterFlowTheme.of(context).title1.override(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
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
