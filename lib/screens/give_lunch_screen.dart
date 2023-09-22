import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:giants_free_lunch/core/app_export.dart';
import 'package:giants_free_lunch/screens/give_lucy_free_lunch_two_screen.dart';

class GiveLunch extends StatelessWidget {
  GiveLunch({super.key});

  final appTheme = AppTheme();
  bool check = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () => Get.back(),
                            icon: const Icon(Icons.arrow_back_ios_rounded)),
                        const SizedBox(
                          width: 50,
                        ),
                        const Text(
                          'Give free lunch',
                          style: TextStyle(
                              fontFamily: "assets/fonts/InterBold.ttf",
                              fontWeight: FontWeight.w700),
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
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.white,
                    child: TextFormField(
                        decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.black45),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: Colors.black45),
                      ),
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
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
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
                                  check = value!;
                                })
                          ],
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
      ),
      floatingActionButton: SizedBox(
        height: 40,
        width: MediaQuery.sizeOf(context).width * 0.8,
        child: FloatingActionButton.extended(
          onPressed: () => Get.to(() => GiveLucyFreeLunchTwoScreen()),
          label: Text(
            "Proceed",
            style: const TextStyle(color: Colors.white),
          ),
          shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          backgroundColor: appTheme.primaryColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: appTheme.appBackgroundColor,
    );
  }
}
