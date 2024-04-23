import 'package:clean_framework/clean_framework.dart';

abstract class RandomUserRequest extends Request {
  Map<String, dynamic> get queryParams => {};
}

abstract class GetRandomUserRequest extends RandomUserRequest {
  String get resource;
}
