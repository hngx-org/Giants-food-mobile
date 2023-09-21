import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:giants_free_lunch/core/utils/image_constant.dart';
import 'package:giants_free_lunch/themes/app_theme.dart';

class GiveLucyFreeLunchTwoScreen extends StatefulWidget {
  const GiveLucyFreeLunchTwoScreen({super.key});

  @override
  State<GiveLucyFreeLunchTwoScreen> createState() =>
      _GiveLucyFreeLunchTwoScreenState();
}

class _GiveLucyFreeLunchTwoScreenState
    extends State<GiveLucyFreeLunchTwoScreen> {
  final TextEditingController _complimentController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _complimentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Color(0xff0F172A),
          size: 20,
        ),
        title: Row(
          children: [
            Text(
              'Give Lucy free lunch',
              style:  TextStyle(
                  fontSize: 18.0,
                  shadows: const [
                    Shadow(
                      blurRadius: 4.0,
                      color: Colors.grey,
                      offset: Offset(0.0, 5.0),
                    ),
                  ],
                  fontWeight: FontWeight.w700,
                  fontFamily: 'inter',
                  fontStyle: FontStyle.normal,
                  height: 2.8,
                  color: AppTheme().primaryColor),
            ),
           const SizedBox( width: 9,),
           Image.asset('assets/images/img_lucy.png')
          ],
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 21, left: 21, right: 21),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 92,
                width: 92,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            ImageConstant.imgUnsplashe9gnuhpsg1w92x92)),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 3, color: Color(0xff8a8a8a))),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                'Lucy John',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'inter',
                  fontStyle: FontStyle.normal,
                  height: 2.0,
                  color: Color(0xff000000),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                'HR Administration',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'inter',
                  fontStyle: FontStyle.normal,
                  height: 2.0,
                  color: Color(0xff333333),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SvgPicture.asset(
                  height: 57.42, width: 46, ImageConstant.imgTrashAmberA200),
              const SizedBox(
                height: 12,
              ),
              buildEditField(
                  keyboard: TextInputType.text,
                  title: 'Compliment',
                  textController: _complimentController,
                  fieldHeight: 108),
              const SizedBox(
                height: 16,
              ),
              const Row(
                children: [
                  Text(
                    'Select number of lunch',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'inter',
                      fontStyle: FontStyle.normal,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 40,
                      mainAxisSpacing: 40,
                      crossAxisCount: 2,
                      childAspectRatio: 1.5,
                    ),
                    itemCount: mealCategory.length,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        width: 84,
                        height: 65,
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                height: 23,
                                width: 24,
                                child:
                                    Image.asset(ImageConstant.imgGroup1623x24)),
                            Text(
                              mealCategory[index].title,
                              style: const TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'inter',
                                fontStyle: FontStyle.normal,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 38,
              ),
              buildButton(
                onPressed: () {},
                buttonText: 'Give free lunch',
              )
            ],
          ),
        ),
      )),
    );
  }

  SizedBox buildButton(
      {required void Function()? onPressed, required String buttonText}) {
    return SizedBox(
      height: 46,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: AppTheme().primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: AppTheme().primaryColor))),
        child: Text(
          buttonText,
          style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              fontFamily: 'inter',
              fontStyle: FontStyle.normal,
              color: Color(0xffcbff89)),
        ),
      ),
    );
  }

  Column buildEditField(
      {required TextInputType keyboard,
      required String title,
      required TextEditingController textController,
      required double fieldHeight}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'inter',
            fontStyle: FontStyle.normal,
            color: Colors.black,
          ),
        ),
        Container(
          width: 400,
          height: fieldHeight,
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Color.fromARGB(255, 89, 88, 88))),
          child: TextFormField(
            controller: textController,
            expands: true,
            minLines: null,
            maxLines: null,
            keyboardType: keyboard,
            autocorrect: false,
            cursorColor: AppTheme().primaryColor,
            autovalidateMode: AutovalidateMode.disabled,
            decoration: const InputDecoration(
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.all(0),
            ),
          ),
        ),
      ],
    );
  }
}

class AvailableMealCategoryModel {
  final String title;

  AvailableMealCategoryModel({
    required this.title,
  });
}

List<AvailableMealCategoryModel> mealCategory = [
  AvailableMealCategoryModel(title: '1 free lunch'),
  AvailableMealCategoryModel(title: '2 free lunch'),
  AvailableMealCategoryModel(title: '3 free lunch'),
  AvailableMealCategoryModel(title: '4 free lunch'),
];