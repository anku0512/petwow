//import 'package:share_plus/share_plus.dart';
import 'package:flutter/material.dart';

/// Share file by url
/// this was not used any where so commenting it for now
void share(String message, String subject, String url) {
  //Share.share(message + " " + url, subject: subject);
}

void showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(content: Text(message));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
