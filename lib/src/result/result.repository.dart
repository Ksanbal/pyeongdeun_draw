import 'dart:math';

import 'package:pyeongdeun_draw/src/result/result.model.dart';
import 'package:pyeongdeun_draw/src/setting/setting.model.dart';

class ResultRepository {
  late ResultModel result;

  Map<String, int> winners = {};

  ResultRepository(int maxWinning, List<TicketModel> participateList) {
    List<String> temp = [];
    for (var element in participateList) {
      for (var i = 0; i < element.count; i++) {
        temp.add(element.name);
      }
    }
    result = ResultModel(maxWinning: maxWinning, participateList: temp);
  }

  String? drawOne() {
    if (result.participateList.isEmpty) {
      return '다 뽑았어요!';
    }

    int index = Random().nextInt(result.participateList.length);

    String winner = result.participateList[index];
    result.participateList.removeAt(index);

    if (winners.containsKey(winner)) {
      if (winners[winner]! >= result.maxWinning) {
        result.participateList.removeWhere((element) => element == winner);
        return drawOne();
      }
      winners[winner] = winners[winner]! + 1;
    } else {
      winners[winner] = 1;
    }
    result.participateList.removeAt(index);
    return winner + '님!';
  }
}
