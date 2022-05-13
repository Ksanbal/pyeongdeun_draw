import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'package:pyeongdeun_draw/src/result/result.repository.dart';
import 'package:pyeongdeun_draw/src/setting/setting.model.dart';
import 'package:pyeongdeun_draw/src/uploadCsv/upload.view.dart';

class ResultView extends StatefulWidget {
  const ResultView({
    Key? key,
    required this.maxWinning,
    required this.participateList,
  }) : super(key: key);

  final int maxWinning;
  final List<TicketModel> participateList;

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  late final ResultRepository _resultRepository;
  String? winner;
  bool showGif = false;
  List<Color> colorList = [
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.red,
    Colors.pink,
    Colors.orange,
    Colors.deepOrange,
    Colors.deepPurple,
    Colors.cyan,
    Colors.yellow,
    Colors.lime,
  ];

  @override
  void initState() {
    super.initState();
    _resultRepository = ResultRepository(widget.maxWinning, widget.participateList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: oNeonContainer(
          // padding: const EdgeInsets.all(30),
          borderWidth: 2,
          borderRadius: BorderRadius.circular(15),
          spreadColor: Colors.pink.withOpacity(0.6),
          containerColor: Colors.black,
          lightBlurRadius: 10,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // 배경 gif
              (showGif)
                  ? SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                      // child: Image.network(
                      //   'https://i.gifer.com/6SSp.gif',
                      //   fit: BoxFit.fill,
                      // ),
                      child: CachedNetworkImage(
                        imageUrl: 'https://i.gifer.com/6SSp.gif',
                        fit: BoxFit.fill,
                      ),
                    )
                  : Container(),
              // 당첨자 이름
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    (winner != null && winner != '두구두구') ? '축하해요' : '누가 당첨될까요?',
                    style: const TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  oNeonText(
                    text: winner ?? '',
                    fontWeight: FontWeight.bold,
                    textSize: 120,
                    blurRadius: 100,
                    spreadColor: colorList[Random().nextInt(colorList.length)],
                  ),
                  const SizedBox(height: 100),
                ],
              ),
              // 뽑기 버튼
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 700),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          // onTap: _resultRepository.drawOne,
                          // onTap: () => setState(() {
                          //   if (winner == null) {
                          //     showGif = true;
                          //   }
                          //   winner = _resultRepository.drawOne();
                          // }),
                          onTap: () {
                            winner = '두구두구';
                            showGif = false;
                            setState(() {});
                            Future.delayed(const Duration(milliseconds: 1500), () {
                              showGif = true;
                              winner = _resultRepository.drawOne();
                              setState(() {});
                            });
                          },
                          child: oNeonContainer(
                            height: 100,
                            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                            borderWidth: 2,
                            borderRadius: BorderRadius.circular(20),
                            containerColor: Colors.deepPurple,
                            child: const Center(
                              child: Text(
                                '뽑기!',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            // Navigator.of(context).pop();
                            // Navigator.of(context).pop();
                            // Navigator.of(context).pop();
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const UploadCsvView(),
                              ),
                              (route) => false,
                            );
                          },
                          child: Text(
                            '메인으로 돌아가기',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
