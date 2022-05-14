import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({Key key}) : super(key: key);

  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  DateTime datePicked;
  String uploadedFileUrl = '';
  TextEditingController yourNameController;
  String dropDownValue;
  String choiceChipsValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    yourNameController = TextEditingController(text: currentUserDisplayName);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
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
        final editProfileUsersRecord = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              flexibleSpace: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 50,
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                color: Color(0xFF090F13),
                                size: 30,
                              ),
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                      child: Text(
                        'Edit Profile',
                        style: FlutterFlowTheme.of(context).title2.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF090F13),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [],
              elevation: 0,
            ),
          ),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Color(0xFFDBE2E7),
                        shape: BoxShape.circle,
                      ),
                      child: Stack(
                        alignment: AlignmentDirectional(0, 0),
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                      ),
                                    );
                                  }
                                  final circleImageUsersRecord = snapshot.data;
                                  return Container(
                                    width: 90,
                                    height: 90,
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
                          if ((uploadedFileUrl != null) &&
                              (uploadedFileUrl != ''))
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                        ),
                                      ),
                                    );
                                  }
                                  final circleImageUsersRecord = snapshot.data;
                                  return Container(
                                    width: 90,
                                    height: 90,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      uploadedFileUrl,
                                      fit: BoxFit.cover,
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
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          final selectedMedia =
                              await selectMediaWithSourceBottomSheet(
                            context: context,
                            allowPhoto: true,
                          );
                          if (selectedMedia != null &&
                              selectedMedia.every((m) =>
                                  validateFileFormat(m.storagePath, context))) {
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
                        text: 'Change Photo',
                        options: FFButtonOptions(
                          width: 130,
                          height: 40,
                          color: Color(0xFFF1F4F8),
                          textStyle:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0xFF4B39EF),
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                          elevation: 1,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 8,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                  child: AuthUserStreamWidget(
                    child: TextFormField(
                      controller: yourNameController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: 'Pet\'s Name',
                        labelStyle:
                            FlutterFlowTheme.of(context).bodyText2.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF95A1AC),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                        hintText: 'Your pup\'s name',
                        hintStyle:
                            FlutterFlowTheme.of(context).bodyText2.override(
                                  fontFamily: 'Lexend Deca',
                                  color: Color(0xFF95A1AC),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFF1F4F8),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFF1F4F8),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(20, 24, 0, 24),
                      ),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF090F13),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 335,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                            )
                          ],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Color(0xFFF1F4F8),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AuthUserStreamWidget(
                                child: Text(
                                  dateTimeFormat(
                                      'yMMMd', currentUserDocument?.dob),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Colors.black,
                                      ),
                                ),
                              ),
                              FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 60,
                                icon: Icon(
                                  FFIcons.kcalendar,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                onPressed: () async {
                                  await DatePicker.showDatePicker(
                                    context,
                                    showTitleActions: true,
                                    onConfirm: (date) {
                                      setState(() => datePicked = date);
                                    },
                                    currentTime: getCurrentTimestamp,
                                    minTime: DateTime(0, 0, 0),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.75, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                    child: AuthUserStreamWidget(
                      child: StreamBuilder<List<DogBreedRecord>>(
                        stream: queryDogBreedRecord(
                          queryBuilder: (dogBreedRecord) => dogBreedRecord
                              .where('title', isEqualTo: 'dog breeds'),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          List<DogBreedRecord> dropDownDogBreedRecordList =
                              snapshot.data;
                          // Return an empty Container when the document does not exist.
                          if (snapshot.data.isEmpty) {
                            return Container();
                          }
                          final dropDownDogBreedRecord =
                              dropDownDogBreedRecordList.isNotEmpty
                                  ? dropDownDogBreedRecordList.first
                                  : null;
                          return FlutterFlowDropDown(
                            initialOption: dropDownValue ??=
                                currentUserDocument?.breed,
                            options:
                                dropDownDogBreedRecord.items.toList().toList(),
                            onChanged: (val) =>
                                setState(() => dropDownValue = val),
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Colors.black,
                                    ),
                            hintText: 'Your pup\'s breed',
                            fillColor: Colors.white,
                            elevation: 2,
                            borderColor: Color(0xFFF1F4F8),
                            borderWidth: 2,
                            borderRadius: 8,
                            margin:
                                EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                            hidesUnderline: true,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.9, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                    child: AuthUserStreamWidget(
                      child: FlutterFlowChoiceChips(
                        initiallySelected: choiceChipsValue != null
                            ? [choiceChipsValue]
                            : [currentUserDocument?.gender],
                        options: [ChipData('Male'), ChipData('Female')],
                        onChanged: (val) =>
                            setState(() => choiceChipsValue = val.first),
                        selectedChipStyle: ChipStyle(
                          backgroundColor: Color(0xFF323B45),
                          textStyle:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                          iconColor: Colors.white,
                          iconSize: 18,
                          elevation: 4,
                        ),
                        unselectedChipStyle: ChipStyle(
                          backgroundColor: Colors.white,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyText2.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF323B45),
                                  ),
                          iconColor: Color(0xFF323B45),
                          iconSize: 18,
                          elevation: 4,
                        ),
                        chipSpacing: 1,
                        multiselect: false,
                        initialized: choiceChipsValue != null,
                        alignment: WrapAlignment.start,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0.05),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                    child: StreamBuilder<UsersRecord>(
                      stream: UsersRecord.getDocument(currentUserReference),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          );
                        }
                        final buttonUsersRecord = snapshot.data;
                        return FFButtonWidget(
                          onPressed: () async {
                            final usersUpdateData = createUsersRecordData(
                              displayName: yourNameController.text,
                              breed: dropDownValue,
                              gender: choiceChipsValue,
                              photoUrl: uploadedFileUrl,
                              dob: datePicked,
                            );
                            await buttonUsersRecord.reference
                                .update(usersUpdateData);
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    NavBarPage(initialPage: 'profile'),
                              ),
                            );
                          },
                          text: 'Save Changes',
                          options: FFButtonOptions(
                            width: 340,
                            height: 60,
                            color: Color(0xFF4B39EF),
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                            elevation: 2,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 8,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
