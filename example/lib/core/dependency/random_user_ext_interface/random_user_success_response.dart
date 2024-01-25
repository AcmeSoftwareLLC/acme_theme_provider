import 'package:clean_framework/clean_framework.dart';

class RandomUserSuccessResponse extends SuccessResponse {
  const RandomUserSuccessResponse({required this.data});

  final Map<String, dynamic> data;
}
