import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Column(
                children: [
                  const Text(
                    'My Profile',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Color(0xFF150D57)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey, width: 1.5),
                      image: const DecorationImage(image: AssetImage('assets/images/img_unsplashxogwpcmgdw.png'))

                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "John Olumide",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                 InkWell(
                   onTap: (){},
                   child: Column(
                     children: [
                       const Text(
                         "Send Invitation",
                         style: TextStyle(
                             fontSize: 15,
                             fontWeight: FontWeight.w500,
                             color: Color(0xff4031B4)),
                       ),
                       Container(
                         height: 1.5,
                         width: 107,
                         decoration: const BoxDecoration(color: Color(0xff4031B4)),
                       ),
                     ],
                   ),
                 )
                ],
              ),
            ),
            const SizedBox(
              height: 45,
            ),
             Text(
              'Profile',
              style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontWeight: FontWeight.w500,
                  fontSize: 17),
            ),
            const SizedBox(
              height: 15,
            ),
            Card(
              elevation: 3,
              surfaceTintColor: Colors.white,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    ProfileItems(
                      title: 'Edit Profile',
                      widget:
                          SvgPicture.asset('assets/images/img_navprofile.svg'),
                      voidCallback: () {},
                    ),
                    ProfileItems(
                      title: 'Lunch History',
                      widget: SvgPicture.asset(
                          'assets/images/img_pajamasappearance.svg'),
                      voidCallback: () {},
                    ),
                    ProfileItems(
                      title: 'Notifications',
                      widget: SvgPicture.asset(
                          'assets/images/img_notification_black_900.svg'),
                      voidCallback: () {},
                    ),
                    ProfileItems(
                      title: 'Security',
                      widget: SvgPicture.asset(
                          'assets/images/img_heroiconsoutli_black_900.svg'),
                      voidCallback: () {},
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
             Center(
              child: InkWell(
                onTap: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/images/img_file.svg'),
                    // Icon(Iconsax.logout),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Logout',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileItems extends StatefulWidget {
  final String title;
  final Widget widget;
  final VoidCallback voidCallback;

  const ProfileItems({
    super.key,
    required this.title,
    required this.widget,
    required this.voidCallback,
  });

  @override
  State<ProfileItems> createState() => _ProfileItemsState();
}

class _ProfileItemsState extends State<ProfileItems> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.voidCallback,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            widget.widget,
            const SizedBox(
              width: 10,
            ),
            Text(
              widget.title,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            const Icon(Icons.keyboard_arrow_right_sharp)
          ],
        ),
      ),
    );
  }
}
