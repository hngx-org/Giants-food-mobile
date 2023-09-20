import 'package:flutter/material.dart';

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
                    'Profile',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey, width: 2),
                        image: const DecorationImage(
                            image: AssetImage('assets/png/profile.png'),
                            fit: BoxFit.cover)),
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
                  const Text(
                    "Send Invitation",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue),
                  ),
                  Container(
                    height: 1,
                    width: 100,
                    decoration: const BoxDecoration(color: Colors.blue),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Profile',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 18),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.person_outline),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Edit Profile',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Icon(Icons.keyboard_arrow_right_sharp)
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Icon(Icons.dark_mode_rounded),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Lunch History',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Icon(Icons.keyboard_arrow_right_sharp)
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Icon(Icons.notifications),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Notifications',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Icon(Icons.keyboard_arrow_right_sharp)
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Icon(Icons.security),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Security',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Icon(Icons.keyboard_arrow_right_sharp)
                    ],
                  )
                ],
              ),
            ),
             SizedBox(height: 20,),
             const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Icon(
                    Icons.logout_outlined,
                    color: Colors.red,
                  ),
                  Text(
                    'Logout',
                    style: TextStyle(color: Colors.red,fontWeight: FontWeight.w500,fontSize: 16),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
