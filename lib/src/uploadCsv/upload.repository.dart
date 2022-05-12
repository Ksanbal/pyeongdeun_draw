import 'dart:convert';

import 'package:file_picker/file_picker.dart';

class UploadRepository {
  Future<List<String>> getListFromUploadCsv() async {
    PlatformFile? selectFile;

    // file upload
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );
    if (result == null) return [];

    selectFile = result.files.first;

    // csv read
    if (selectFile.bytes == null) return [];

    String csvString = utf8.decode(selectFile.bytes!);
    List<String> csvList = csvString.trim().split('\n');

    return csvList;
  }
}
