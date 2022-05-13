import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'package:pyeongdeun_draw/src/input/input.view.dart';

class UploadCsvView extends StatelessWidget {
  const UploadCsvView({Key? key}) : super(key: key);

  // final UploadRepository _uploadRepository = UploadRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: oNeonContainer(
          borderWidth: 2,
          borderRadius: BorderRadius.circular(15),
          spreadColor: Colors.cyan.withOpacity(0.6),
          containerColor: Colors.black,
          lightBlurRadius: 10,
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 50,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          // child: Image.network('https://i.gifer.com/yi.gif'),
                          child: CachedNetworkImage(
                            imageUrl: 'https://i.gifer.com/yi.gif',
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            oNeonText(
                              text: '평생 든든 뽑기!',
                              fontWeight: FontWeight.bold,
                              textSize: 60,
                              spreadColor: Colors.pink,
                            ),
                            const SizedBox(height: 50),
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 500,
                              ),
                              child: oFlickerNeonContainer(
                                flickerTimeInMilliSeconds: 1000,
                                borderWidth: 2,
                                borderRadius: BorderRadius.circular(15),
                                lightSpreadRadius: 10,
                                lightBlurRadius: 30,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: TextButton.icon(
                                    onPressed: () async {
                                      // List<String> participateList = await _uploadRepository.getListFromUploadCsv();
                                      // if (participateList.isNotEmpty) {
                                      //   Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //       builder: (context) => SettingView(
                                      //         participateList: participateList,
                                      //       ),
                                      //     ),
                                      //   );
                                      // }
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const InputView(),
                                        ),
                                      );
                                    },
                                    // icon: const Icon(
                                    //   Icons.file_upload_outlined,
                                    //   color: Colors.white,
                                    //   size: 35,
                                    // ),
                                    // label: const Text(
                                    //   '명단 업로드',
                                    //   style: TextStyle(
                                    //     color: Colors.white,
                                    //     fontSize: 30,
                                    //   ),
                                    // ),
                                    icon: const Icon(
                                      Icons.input_rounded,
                                      color: Colors.white,
                                      size: 35,
                                    ),
                                    label: const Text(
                                      ' 참가자 입력하기',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: oFlickerNeonText(
                    text: 'powered by dev.ksanbal',
                    spreadColor: Colors.pink,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
