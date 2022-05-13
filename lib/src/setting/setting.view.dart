import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'package:pyeongdeun_draw/src/result/result.view.dart';
import 'package:pyeongdeun_draw/src/setting/setting.repository.dart';

class SettingView extends StatefulWidget {
  const SettingView({
    Key? key,
    required this.participateList,
  }) : super(key: key);

  final List<String> participateList;

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  final SettingRepository _settingRepository = SettingRepository();

  @override
  void initState() {
    super.initState();

    _settingRepository.initTicketMap(widget.participateList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: oNeonContainer(
          padding: const EdgeInsets.all(30),
          borderWidth: 2,
          borderRadius: BorderRadius.circular(15),
          spreadColor: Colors.cyan.withOpacity(0.6),
          containerColor: Colors.black,
          lightBlurRadius: 10,
          child: Center(
            child: Stack(
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: Navigator.of(context).pop,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(
                                Icons.keyboard_double_arrow_left_rounded,
                                size: 30,
                                color: Colors.white,
                              ),
                              SizedBox(width: 5),
                              Text(
                                '참가자 수정하기',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // 설정값
                    oNeonContainer(
                      // containerColor: Colors.black,
                      borderColor: Colors.deepPurple,
                      spreadColor: Colors.deepPurple.withOpacity(0.6),
                      borderWidth: 2,
                      borderRadius: BorderRadius.circular(15),
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            '설정',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        // color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: oNeonContainer(
                                    containerColor: Colors.white,
                                    spreadColor: Colors.white.withOpacity(0),
                                    borderRadius: BorderRadius.circular(50),
                                    lightSpreadRadius: 1,
                                    padding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                                    child: const Text(
                                      '추첨권 개수',
                                      style: TextStyle(fontSize: 23),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                counterWidget(
                                  _settingRepository.ticketCount,
                                  onRemove: () {
                                    if (_settingRepository.ticketCount > 0) {
                                      _settingRepository.ticketCount--;
                                      setState(() {});
                                    }
                                  },
                                  onAdd: () {
                                    _settingRepository.ticketCount++;
                                    setState(() {});
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: oNeonContainer(
                                    containerColor: Colors.white,
                                    spreadColor: Colors.white.withOpacity(0),
                                    borderRadius: BorderRadius.circular(50),
                                    padding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                                    lightSpreadRadius: 1,
                                    child: const Text(
                                      '중복 허용',
                                      style: TextStyle(fontSize: 23),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                counterWidget(
                                  _settingRepository.maxWinning,
                                  onRemove: () {
                                    if (_settingRepository.maxWinning > 0) {
                                      _settingRepository.maxWinning--;
                                      setState(() {});
                                    }
                                  },
                                  onAdd: () {
                                    _settingRepository.maxWinning++;
                                    setState(() {});
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // 유저 목록
                    oNeonContainer(
                      borderColor: Colors.green,
                      spreadColor: Colors.green.withOpacity(0.6),
                      borderWidth: 2,
                      borderRadius: BorderRadius.circular(15),
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            '참가자',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView(
                        children: [
                          ..._settingRepository.ticketList.map((e) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: oNeonContainer(
                                      containerColor: Colors.white,
                                      spreadColor: Colors.white.withOpacity(0),
                                      borderRadius: BorderRadius.circular(50),
                                      lightSpreadRadius: 1,
                                      padding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                                      child: Text(
                                        e.name,
                                        style: const TextStyle(fontSize: 23),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  counterWidget(
                                    e.count,
                                    onAdd: () {
                                      e.count++;
                                      setState(() {});
                                    },
                                    onRemove: () {
                                      if (e.count > 0) {
                                        e.count--;
                                        setState(() {});
                                      }
                                    },
                                  ),
                                ],
                              ),
                            );
                          }),
                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ],
                ),
                // 시작 버튼
                Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          titlePadding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                          actionsPadding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          title: const Text(
                            '시작할까요??',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: Navigator.of(context).pop,
                              child: const Text(
                                '아직이요!',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
                                // localStorage 저장
                                final LocalStorage storage = LocalStorage('pyd_history');
                                if (await storage.ready) {
                                  await storage.setItem('nameList', widget.participateList);
                                }

                                // 다음 페이지로
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ResultView(
                                      maxWinning: _settingRepository.maxWinning,
                                      participateList: _settingRepository.ticketList,
                                    ),
                                  ),
                                );
                              },
                              child: oFlickerNeonText(
                                text: '갑시다!!',
                                textSize: 25,
                                textColor: Colors.pink,
                                spreadColor: Colors.pink,
                                randomFlicker: false,
                                flickerTimeInMilliSeconds: 500,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    child: oNeonContainer(
                      height: 90,
                      padding: const EdgeInsets.all(20),
                      borderWidth: 2,
                      borderRadius: BorderRadius.circular(15),
                      containerColor: Colors.pinkAccent.withOpacity(0.8),
                      spreadColor: Colors.pinkAccent.withOpacity(0.5),
                      child: const Center(
                        child: Text(
                          '추첨 시작!!',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget counterWidget(int value, {Function()? onRemove, Function()? onAdd}) {
    return Row(
      children: [
        InkWell(
          onTap: onRemove,
          child: oNeonContainer(
            height: 40,
            width: 40,
            containerColor: Colors.white,
            spreadColor: Colors.white.withOpacity(0.5),
            lightSpreadRadius: 1,
            // lightBlurRadius: 10,
            borderRadius: BorderRadius.circular(50),
            child: const Icon(Icons.remove, color: Colors.black),
          ),
        ),
        const SizedBox(width: 10),
        oNeonContainer(
          height: 40,
          width: 60,
          containerColor: Colors.white,
          spreadColor: Colors.white.withOpacity(0.5),
          lightSpreadRadius: 1,
          // lightBlurRadius: 10,
          borderRadius: BorderRadius.circular(50),
          child: Center(
            child: Text(
              value.toString(),
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        InkWell(
          onTap: onAdd,
          child: oNeonContainer(
            height: 40,
            width: 40,
            containerColor: Colors.white,
            spreadColor: Colors.white.withOpacity(0.5),
            lightSpreadRadius: 1,
            // lightBlurRadius: 10,
            borderRadius: BorderRadius.circular(50),
            child: const Icon(Icons.add, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
