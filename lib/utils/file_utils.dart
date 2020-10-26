import 'package:path_provider/path_provider.dart';
import 'dart:io';

class FileUtils {
  static Future<String> get localPath async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }

  static Future<File> localFile(String invoice) async {
    final String dir = (await getTemporaryDirectory()).path;
    print(dir);
    final String path = '$dir/${invoice}.pdf';
    return File(path);
  }
}
