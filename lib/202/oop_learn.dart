// ignore_for_file: avoid_print

import 'dart:io';

import 'package:flutter_full_learn_vb/202/custom_exception.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class IFileDownload {
  bool? downloadItem(FileItem? fileItem);

  Future<void> toShare(String path) async {
    !await launchUrl(Uri(path: path));
  }
}

class FileDownload implements IFileDownload {
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();

    print("a");
    return true;
  }

  @override
  Future<void> toShare(String path) {
    throw UnimplementedError();
  }
}

class FileItem {
  final String fileName;
  final File file;

  FileItem(this.fileName, this.file);
}
