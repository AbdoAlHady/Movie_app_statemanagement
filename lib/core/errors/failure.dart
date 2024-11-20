import 'package:movie_app/core/network/error_model.dart';

abstract class Failure {
  final ErrorModel errorModel;

  Failure({required this.errorModel});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorModel});
}
