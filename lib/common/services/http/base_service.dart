import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../data_models/exceptions/connection_timeout_exception.dart';
import '../../data_models/exceptions/no_internet_exception.dart';
import '../../data_models/exceptions/revoke_token_exception.dart';
import '../../factories/error_factory.dart';


class BaseService {
  Future<Exception> parseDioError(DioError dioError) async {
    final isInternetConnectionAvailable =
        await _isInternetConnectionAvailable();

    if (!isInternetConnectionAvailable) {
      throw NoInternetException();
    }

    if (dioError is RevokeTokenException) {
      throw dioError;
    } else if (dioError.type == DioErrorType.connectTimeout) {
      throw ConnectionTimeoutException();
    }

    final response = dioError.response;
    return ErrorFactory.convertServerError(response);
  }

  Future<bool> _isInternetConnectionAvailable() async {
    final _connectivity = Connectivity();

    final connectivityStatus = await _connectivity.checkConnectivity();

    return connectivityStatus == ConnectivityResult.none ? false : true;
  }
}
