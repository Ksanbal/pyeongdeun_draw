class TicketModel {
  String name;
  int count;

  TicketModel({
    required this.name,
    this.count = 10,
  });
}

class SettingRepository {
  int ticketCount = 10;
  int maxWinning = 3;

  List<TicketModel> ticketList = [];

  initTicketMap(List<String> participateList) {
    for (var element in participateList) {
      ticketList.add(TicketModel(name: element));
    }
  }
}
