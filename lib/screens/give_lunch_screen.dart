import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:giants_free_lunch/controllers/give_lunch_controller.dart';
import 'package:giants_free_lunch/core/app_export.dart';
import 'package:giants_free_lunch/screens/give_lucy_free_lunch_two_screen.dart';

class GiveLunch extends StatefulWidget {
  GiveLunch({super.key});

  @override
  State<GiveLunch> createState() => _GiveLunchState();
}

class _GiveLunchState extends State<GiveLunch> {
  final appTheme = AppTheme();

  final GiveLunchController getEmployeeByOrgIdController =
      Get.put(GiveLunchController());

  // List<bool> check = [
  //   false,
  //   false,
  //   false,
  //   false,
  //   false,
  //   false,
  // ];

  @override
  void initState() {
    // getEmployeeByOrgIdController =
    // TODO: implement initState
    super.initState();
  }

  String userId = '';
  String firstName = '';
  String lastName = '';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appTheme.appBackgroundColor,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        // centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              'Give free lunch',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: appTheme.primaryColor,
                height: 2,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            SvgPicture.asset(
              ImageConstant.imgCut,
              semanticsLabel: 'SVG Image',
              height: 20,
              width: 20,
            ),
            const SizedBox(
              width: 30,
            ),
            const Spacer()
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  color: Colors.white,
                  height: 45,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: TextFormField(
                      decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.black45),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(width: 2, color: Colors.black45),
                    ),
                    contentPadding: const EdgeInsets.fromLTRB(10, 5, 5, 0),
                    hintText: "Search worker's name",
                    hintStyle: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w500),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search_outlined),
                    ),
                  )),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => ListView.builder(
              shrinkWrap: true,
              itemCount: getEmployeeByOrgIdController.dataList.length,
              itemBuilder: (context, i) {
                final item = getEmployeeByOrgIdController.dataList[i];
                print(getEmployeeByOrgIdController.dataList.length);
                return Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          userId = item.id.toString();
                          firstName = item.firstName.toString();
                          lastName = item.lastName.toString();
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Colors.black26,
                                image: DecorationImage(
                                  image: AssetImage(
                                      ImageConstant.imgUnsplashqayxtcv4aq),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(100),
                                //color: Colors.blue
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text('${item.lastName.toString()} ${item.firstName.toString()}'),
                            const Spacer(),
                            userId == item.id.toString()
                                ? Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: appTheme.primaryColor),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const Icon(
                                      Icons.check,
                                      color: Colors.green,
                                      size: 18,
                                    ),
                                  )
                                : Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Divider(),
                    )
                  ],
                );
              },
            ),
          ),
          const SizedBox(
            height: 80,
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: AppButton(
          buttonText: "Proceed",
          onPressed: () {
            if (firstName == '') {
            } else {
              Get.to(GiveLucyFreeLunchTwoScreen(
                userId: userId,
                firstName: firstName,
                lastName: lastName,
              ));
            }
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: appTheme.appBackgroundColor,
    );
  }
}
