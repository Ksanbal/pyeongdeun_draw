import 'package:flutter/material.dart';
import 'package:neon_widgets/neon_widgets.dart';
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
        padding: const EdgeInsets.all(30),
        child: oNeonContainer(
          padding: const EdgeInsets.all(30),
          borderWidth: 2,
          borderRadius: BorderRadius.circular(15),
          spreadColor: Colors.cyan.withOpacity(0.6),
          containerColor: Colors.black,
          lightBlurRadius: 10,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Stack(
                children: [
                  Column(
                    children: [
                      // 설정값
                      oNeonContainer(
                        // containerColor: Colors.black,
                        borderColor: Colors.deepPurple,
                        spreadColor: Colors.deepPurple.withOpacity(0.6),
                        borderWidth: 2,
                        borderRadius: BorderRadius.circular(20),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: oNeonContainer(
                                    containerColor: Colors.white,
                                    spreadColor: Colors.white.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(50),
                                    lightSpreadRadius: 1,
                                    padding: const EdgeInsets.only(left: 20),
                                    child: const Text(
                                      '추첨권 개수',
                                      style: TextStyle(fontSize: 23),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                CounterWidget(
                                  _settingRepository.ticketCount,
                                  onRemove: () {
                                    _settingRepository.ticketCount--;
                                    setState(() {});
                                  },
                                  onAdd: () {
                                    _settingRepository.ticketCount++;
                                    setState(() {});
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: oNeonContainer(
                                    containerColor: Colors.white,
                                    spreadColor: Colors.white.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(50),
                                    padding: const EdgeInsets.only(left: 20),
                                    lightSpreadRadius: 1,
                                    child: const Text(
                                      '중복 허용',
                                      style: TextStyle(fontSize: 23),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                CounterWidget(
                                  _settingRepository.maxWinning,
                                  onRemove: () {
                                    _settingRepository.maxWinning--;
                                    setState(() {});
                                  },
                                  onAdd: () {
                                    _settingRepository.maxWinning++;
                                    setState(() {});
                                  },
                                ),
                              ],
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
                        borderRadius: BorderRadius.circular(20),
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
                        child: Container(
                          color: Colors.black,
                          child: ListView(
                            children: [
                              ..._settingRepository.ticketList.map((e) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: oNeonContainer(
                                          containerColor: Colors.white,
                                          spreadColor: Colors.white.withOpacity(0.5),
                                          borderRadius: BorderRadius.circular(50),
                                          lightSpreadRadius: 1,
                                          padding: const EdgeInsets.only(left: 20),
                                          child: Text(
                                            e.name,
                                            style: const TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      CounterWidget(
                                        e.count,
                                        onAdd: () {
                                          e.count++;
                                          setState(() {});
                                        },
                                        onRemove: () {
                                          e.count--;
                                          setState(() {});
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
                      ),
                    ],
                  ),
                  // 시작 버튼
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      onTap: () {},
                      child: oNeonContainer(
                        height: 90,
                        padding: const EdgeInsets.all(20),
                        borderWidth: 2,
                        borderRadius: BorderRadius.circular(15),
                        containerColor: Colors.pinkAccent.withOpacity(0.8),
                        spreadColor: Colors.pinkAccent.withOpacity(0.5),
                        child: const Center(
                          child: Text(
                            '추첨 시작하기',
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
      ),
    );
  }

  Widget CounterWidget(int value, {Function()? onRemove, Function()? onAdd}) {
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
