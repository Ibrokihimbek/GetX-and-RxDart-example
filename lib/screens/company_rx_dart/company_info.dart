import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rx_dart_getx_example/data/api_service/api_service.dart';
import 'package:rx_dart_getx_example/data/app_repository/company_repo.dart';
import 'package:rx_dart_getx_example/rx_dart/company_rx.dart';
import 'package:rx_dart_getx_example/screens/company_get_x/company_getx.dart';

class CompanyInfoRxDartPage extends StatelessWidget {
  CompanyInfoRxDartPage({super.key});

  final CompanyRxDart companyRxDart =
      CompanyRxDart(companyRepo: CompanyRepo(apiService: ApiService()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rx Dart Example'),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(CompanyGetXPage());
            },
            icon: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: companyRxDart.companyData,
        builder: (context, snapshot) {
          return Center(
            child: snapshot.data == null
                ? CircularProgressIndicator()
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2.5 / 2.8,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                      ),
                      itemCount: snapshot.data!.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          padding: const EdgeInsets.only(top: 4),
                          margin: const EdgeInsets.only(
                              top: 6, left: 4, right: 4, bottom: 2),
                          width: 120,
                          height: 180,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.blue.withOpacity(0.4),
                                  blurRadius: 4,
                                  offset: const Offset(4, 4),
                                ),
                              ],
                              border: Border.all(width: 1, color: Colors.grey),
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 4,
                              ),
                              Container(
                                width: double.infinity,
                                height: 143,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12),
                                  ),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        snapshot.data!.data[index].logo,
                                      ),
                                      fit: BoxFit.fill,
                                      scale: 6),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                snapshot.data!.data[index].carModel,
                                style: const TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
          );
        },
      ),
    );
  }
}
