import 'package:check_in_out/models/model.dart';
import 'package:check_in_out/resources/api.dart';

class Repository {
  final apiProvider = CheckInOutAPI();
  Future<List<CheckInOutModel>> fetchAll() => apiProvider.getList();
}
