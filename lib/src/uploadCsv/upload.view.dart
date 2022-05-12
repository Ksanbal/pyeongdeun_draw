import 'package:flutter/material.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'package:pyeongdeun_draw/src/setting/setting.view.dart';
import 'package:pyeongdeun_draw/src/uploadCsv/upload.repository.dart';

class UploadCsvView extends StatelessWidget {
  UploadCsvView({Key? key}) : super(key: key);

  final UploadRepository _uploadRepository = UploadRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: oNeonContainer(
          borderRadius: BorderRadius.circular(15),
          spreadColor: Colors.cyan.withOpacity(0.6),
          containerColor: Colors.black,
          lightBlurRadius: 10,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                oNeonText(
                  text: '평생 든든 뽑기!',
                  fontWeight: FontWeight.bold,
                  textSize: 60,
                  spreadColor: Colors.pink,
                ),
                const SizedBox(height: 100),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 300,
                  ),
                  child: oFlickerNeonContainer(
                    flickerTimeInMilliSeconds: 1000,
                    borderRadius: BorderRadius.circular(15),
                    borderWidth: 3,
                    lightSpreadRadius: 10,
                    lightBlurRadius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextButton.icon(
                        onPressed: () async {
                          List<String> participateList = await _uploadRepository.getListFromUploadCsv();
                          if (participateList.isNotEmpty) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SettingView(
                                  participateList: participateList,
                                ),
                              ),
                            );
                          }
                        },
                        icon: const Icon(
                          Icons.file_upload_outlined,
                          color: Colors.white,
                          size: 35,
                        ),
                        label: const Text(
                          '명단 업로드',
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
        ),
      ),
    );
  }
}
