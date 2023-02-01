import 'package:get/get.dart';
import 'package:rx_dart_getx_example/data/app_repository/company_repo.dart';
import 'package:rx_dart_getx_example/data/models/company/data_model.dart';
import 'package:rx_dart_getx_example/data/models/my_responce/response_model.dart';

class CompanyGetX extends GetxController {
  final CompanyRepo companyRepo;
  CompanyGetX({required this.companyRepo}) {
    fetchCompany();
  }

  RxBool isLoading = true.obs;
  RxString error = ''.obs;
  Rx<DataModel> companyData = DataModel(data: []).obs;

  fetchCompany() async {
    isLoading(true);
    MyResponse myResponse = await companyRepo.getCompany();
    if (myResponse.error.isEmpty) {
      companyData.value = myResponse.data;
    } else {
      error.value = myResponse.error;
    }
    isLoading(false);
  }
}
