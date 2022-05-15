import 'package:share_plus/share_plus.dart';

/// Share file by url
void share(String message, String subject, String url) {
  Share.share(message + " " + url, subject: subject);
}
