import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:giants_free_lunch/core/app_export.dart';
import 'package:giants_free_lunch/screens/give_lucy_free_lunch_two_screen.dart';

class GiveLunch extends StatefulWidget {
  GiveLunch({super.key});

  @override
  State<GiveLunch> createState() => _GiveLunchState();
}

class _GiveLunchState extends State<GiveLunch> {
  final appTheme = AppTheme();

  bool check = false;

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
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
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
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 15,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            check = !check;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
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
                                  width: 5,
                                ),
                                const Text('Kolawole Emmanuel'),
                              ],
                            ),
                            Checkbox(
                              shape: const CircleBorder(),
                              value: check,
                              onChanged: (bool? value) {
                                setState(() {
                                  check = value!;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    const Divider()
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: AppButton(
          buttonText: "Proceed",
          onPressed: () {
            Get.to(const GiveLucyFreeLunchTwoScreen());
          },
        ),
      ),
      // SizedBox(
      //   height: 40,
      //   width: MediaQuery.sizeOf(context).width * 0.8,
      //   child: FloatingActionButton.extended(
      //     onPressed: () => Get.to(() => GiveLucyFreeLunchTwoScreen()),
      //     label: Text(
      //       "Proceed",
      //       style: const TextStyle(color: Colors.white),
      //     ),
      //     shape: const BeveledRectangleBorder(
      //         borderRadius: BorderRadius.all(Radius.circular(5))),
      //     backgroundColor: appTheme.primaryColor,
      //   ),
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: appTheme.appBackgroundColor,
    );
  }
}
