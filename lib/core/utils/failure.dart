import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;
  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection time out with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send time out with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive time out with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          statusCode: dioException.response!.statusCode!,
          response: dioException.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Request is canceled, Please try later!');
      case DioExceptionType.connectionError:
        return ServerFailure('Socket Exception, Please try later!');
      case DioExceptionType.unknown:
        return ServerFailure('Unexpected error, Please try again!');
    }
  }

  factory ServerFailure.fromResponse(
      {required int statusCode, required dynamic response}) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server Error, Please try later!');
    }
    return ServerFailure('Opps There was an Error, Please try later!');
  }
}
