import 'package:bookly/core/helper/log_helper.dart';
import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout With Server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout With Server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout With Server');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate With Server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request Cancelled With Server');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');
      case DioExceptionType.unknown:
        return ServerFailure(
            'Opps There Was An Error With Server, Please Try Again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    switch (statusCode) {
      case 400:
        logError(response);
        return ServerFailure('Your Request is invalid, please try again later');
      case 401:
        logError(response);
        return ServerFailure(
            'Unauthorized: Your session may have expired or you do not have permission to access this resource.');
      case 403:
        logError(response);
        return ServerFailure(
            'Forbidden: You do not have permission to access this resource.');
      case 404:
        logError(response);
        return ServerFailure(
            'Your Request was not found, please try again');
      case 500:
        logError(response);
        return ServerFailure(
            'There is a problem with the server, please try again later');
      default:
        logError(response);
        return ServerFailure('There was an error with the server, please try again');
    }
  }
}
