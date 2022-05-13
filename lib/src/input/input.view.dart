import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'package:pyeongdeun_draw/src/setting/setting.view.dart';

class InputView extends StatefulWidget {
  const InputView({Key? key}) : super(key: key);

  @override
  State<InputView> createState() => _InputViewState();
}

class _InputViewState extends State<InputView> {
  final LocalStorage storage = LocalStorage('pyd_history');
  final TextEditingController _textEditingController = TextEditingController();
  List<String> nameList = [];

  @override
  void initState() {
    super.initState();

    // localstorage 체크
    // 값이 있으면 불러오는지 물어보고 불러오기
    Future.delayed(const Duration(milliseconds: 500), () async {
      if (await storage.ready && await storage.getItem('nameList') != null) {
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('리스트를 불러오시겠습니까?'),
            content: const Text('이전에 저장된 리스트를 불러올 수 있습니다'),
            actions: [
              TextButton(
                onPressed: Navigator.of(context).pop,
                child: const Text('아니요 괜찮아요!'),
              ),
              TextButton(
                onPressed: () async {
                  for (var item in await storage.getItem('nameList')) {
                    nameList.add(item.toString());
                  }

                  Navigator.of(context).pop();
                  setState(() {});
                },
                child: const Text('네 불러주세요'),
              ),
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: Colors.grey[800],
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: oNeonContainer(
            borderWidth: 2,
            borderRadius: BorderRadius.circular(15),
            spreadColor: Colors.pink.withOpacity(0.6),
            containerColor: Colors.black,
            lightBlurRadius: 10,
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      if (nameList.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettingView(
                              participateList: nameList,
                            ),
                          ),
                        );
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text(
                            '설정하러 가기',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 5),
                          Icon(
                            Icons.keyboard_double_arrow_right_rounded,
                            size: 30,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
                        '참가자',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // 참가자 리스트
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ListView.separated(
                      itemCount: nameList.length,
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 10);
                      },
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 50,
                                padding: const EdgeInsets.only(left: 20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    nameList[index],
                                    style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            InkWell(
                              onTap: () => setState(() {
                                nameList.removeAt(index);
                              }),
                              child: const CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.delete,
                                  size: 30,
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // 입력창
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 60,
                        padding: const EdgeInsets.only(left: 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: TextFormField(
                            controller: _textEditingController,
                            keyboardType: TextInputType.name,
                            autofocus: true,
                            style: const TextStyle(fontSize: 25),
                            decoration: const InputDecoration(
                              hintText: '참가자 이름을 적어주세요!',
                              border: InputBorder.none,
                              icon: Icon(Icons.person_add),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    InkWell(
                      onTap: () {
                        if (_textEditingController.text.isNotEmpty) {
                          if (!nameList.contains(_textEditingController.text)) {
                            nameList.add(_textEditingController.text);
                            _textEditingController.text = '';
                            setState(() {});
                          }
                        }
                      },
                      child: oNeonContainer(
                        containerColor: Colors.deepPurple,
                        borderColor: Colors.transparent,
                        borderRadius: BorderRadius.circular(15),
                        height: 60,
                        width: 100,
                        child: const Center(
                          child: Text(
                            '추가',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
