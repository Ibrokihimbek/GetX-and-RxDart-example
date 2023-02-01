import 'package:rx_dart_getx_example/data/app_repository/company_repo.dart';
import 'package:rx_dart_getx_example/data/models/company/data_model.dart';
import 'package:rx_dart_getx_example/data/models/my_responce/response_model.dart';
import 'package:rxdart/rxdart.dart';

class CompanyRxDart {
  final CompanyRepo companyRepo;
  CompanyRxDart({required this.companyRepo}) {
    fetchCompany();
  }

  final _companyInfo = BehaviorSubject<DataModel>();

  Stream<DataModel> get companyData => _companyInfo.stream;

  void fetchCompany() async {
    MyResponse myResponse = await companyRepo.getCompany();
    DataModel dataModel = myResponse.data;
    _companyInfo.sink.add(dataModel);
  }
}
