import 'package:check_in_out/models/model.dart';
import 'package:check_in_out/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class CheckInOutBloc {
  final _repository = Repository();
  final _checkInOutFetcher = PublishSubject<List<CheckInOutModel>>();

  Stream<List<CheckInOutModel>> get allCheckInOut => _checkInOutFetcher.stream;

  fetchAllCheckInOut() async {
    List<CheckInOutModel> listCheckInOut = await _repository.fetchAll();
    _checkInOutFetcher.sink.add(listCheckInOut);
  }

  dispose() {
    _checkInOutFetcher.close();
  }
}

final bloc = CheckInOutBloc();


