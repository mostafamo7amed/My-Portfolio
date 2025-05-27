import 'dart:io' show Platform;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart' show kIsWeb;


Future<void> launchUrlFunction(String link) async {
  Uri url;

  final isEmail = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(link);

  if (isEmail) {
    url = Uri(scheme: 'mailto', path: link);
  } else {
    url = Uri.parse(link);
  }

  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

void copyToClipboard(BuildContext context, String text) {
  Clipboard.setData(ClipboardData(text: text)).then((_) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${'Copied to clipboard:'.tr()}" $text"'),
      ),
    );
  });
}


class PlatformUtils {
  static bool get isMobile {
    if (kIsWeb) {
      return false;
    } else {
      return Platform.isIOS || Platform.isAndroid;
    }
  }
}


