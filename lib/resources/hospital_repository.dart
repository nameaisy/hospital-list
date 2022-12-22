
import 'package:hospitallist/resources/provider/api_provider.dart';

import '../models/hospital_list_model.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<List<HospitalListModel>> fetchHospitalList() {
    return _provider.fetchHospitalList();
  }
}
class NetworkError extends Error {}