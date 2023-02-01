

import 'package:rx_dart_getx_example/data/api_service/api_service.dart';
import 'package:rx_dart_getx_example/data/models/my_responce/response_model.dart';

class CompanyRepo {
  CompanyRepo({required this.apiService});

  final ApiService apiService;

  Future<MyResponse> getCompany() => apiService.getAllCompany();


}