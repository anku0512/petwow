import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../onboarding3/onboarding3_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class Onboarding2Widget extends StatefulWidget {
  const Onboarding2Widget({Key key}) : super(key: key);

  @override
  _Onboarding2WidgetState createState() => _Onboarding2WidgetState();
}

class _Onboarding2WidgetState extends State<Onboarding2Widget> {
  PagingController<DocumentSnapshot, SampleRecord> _pagingController;
  Query _pagingQuery;
  List<StreamSubscription> _streamSubscriptions = [];

  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xE7FFC700),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Select ',
              style: FlutterFlowTheme.of(context).title1.override(
                    fontFamily: 'Poppins',
                    color: Color(0xFF161819),
                  ),
            ),
            AuthUserStreamWidget(
              child: Text(
                currentUserDisplayName,
                style: FlutterFlowTheme.of(context).title1.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFF161819),
                    ),
              ),
            ),
            Text(
              '\'s breed',
              style: FlutterFlowTheme.of(context).title1.override(
                    fontFamily: 'Poppins',
                    color: Color(0xFF161819),
                  ),
            ),
          ],
        ),
        actions: [],
        centerTitle: true,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                  child: TextFormField(
                    controller: textController,
                    onChanged: (_) => EasyDebounce.debounce(
                      'textController',
                      Duration(milliseconds: 2000),
                      () => setState(() {}),
                    ),
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: FlutterFlowTheme.of(context).bodyText2,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF101010),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFF101010),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      suffixIcon: Icon(
                        Icons.search,
                        color: Color(0xFF757575),
                        size: 22,
                      ),
                    ),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          color: Colors.black,
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(5, 68, 5, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        PagedListView<DocumentSnapshot<Object>, SampleRecord>(
                          pagingController: () {
                            final Query<Object> Function(Query<Object>)
                                queryBuilder = (sampleRecord) => sampleRecord;
                            if (_pagingController != null) {
                              final query =
                                  queryBuilder(SampleRecord.collection);
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
                                queryBuilder(SampleRecord.collection);
                            _pagingController
                                .addPageRequestListener((nextPageMarker) {
                              querySampleRecordPage(
                                queryBuilder: (sampleRecord) => sampleRecord,
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
                                  final itemIndexes = _pagingController.itemList
                                      .asMap()
                                      .map((k, v) =>
                                          MapEntry(v.reference.id, k));
                                  data.forEach((item) {
                                    final index =
                                        itemIndexes[item.reference.id];
                                    final items = _pagingController.itemList;
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
                                _streamSubscriptions.add(streamSubscription);
                              });
                            });
                            return _pagingController;
                          }(),
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          builderDelegate:
                              PagedChildBuilderDelegate<SampleRecord>(
                            // Customize what your widget looks like when it's loading the first page.
                            firstPageProgressIndicatorBuilder: (_) => Center(
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: CircularProgressIndicator(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            ),

                            itemBuilder: (context, _, listViewIndex) {
                              final listViewSampleRecord =
                                  _pagingController.itemList[listViewIndex];
                              return Visibility(
                                visible: functions.showSearch(
                                    textController.text,
                                    listViewSampleRecord.breed),
                                child: InkWell(
                                  onTap: () async {
                                    final usersUpdateData =
                                        createUsersRecordData(
                                      breed: listViewSampleRecord.breed,
                                    );
                                    await currentUserReference
                                        .update(usersUpdateData);
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            Onboarding3Widget(),
                                      ),
                                    );
                                  },
                                  child: ListTile(
                                    title: Text(
                                      listViewSampleRecord.breed,
                                      style: FlutterFlowTheme.of(context)
                                          .title3
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF101112),
                                          ),
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Color(0xFF303030),
                                      size: 20,
                                    ),
                                    tileColor: Colors.white,
                                    dense: false,
                                  ),
                                ),
                              );
                            },
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
      ),
    );
  }
}
