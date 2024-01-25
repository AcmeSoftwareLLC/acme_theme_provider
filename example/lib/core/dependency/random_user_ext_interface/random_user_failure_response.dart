import 'package:clean_framework/clean_framework.dart';

enum RandomUserFailureType {
  invalidToken,
  unknown,
}

class RandomUserFailureResponse
    extends TypedFailureResponse<RandomUserFailureType> {
  const RandomUserFailureResponse({
    required RandomUserFailureType type,
    super.errorData = const {},
    super.message = '',
  }) : super(type: type);

  @override
  String toString() {
    return 'RandomUserFailureResponse{type: $type, errorData: $errorData, message: $message}';
  }
}
