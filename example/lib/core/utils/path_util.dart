import 'package:path_provider/path_provider.dart';

class PathUtil {
  Future<String> get applicationDocumentDir async {
    final documentDirectory = await getApplicationDocumentsDirectory();
    return documentDirectory.path;
  }
}
