import 'package:pyeongdeun_draw/src/setting/setting.model.dart';

class SettingRepository {
  int _ticketCount = 10;
  int get ticketCount => _ticketCount;
  set ticketCount(value) {
    for (var element in ticketList) {
      element.count = value;
    }
    _ticketCount = value;
  }

  int maxWinning = 3;

  List<TicketModel> ticketList = [];

  initTicketMap(List<String> participateList) {
    for (var element in participateList) {
      ticketList.add(TicketModel(name: element));
    }
  }
}
