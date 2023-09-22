import '../controllers/recent_activity_controller.dart';
import '../core/app_export.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_text.dart';

class RecentActivityPage extends StatelessWidget {
  // final RecentActivityController _controller =
  //     Get.put(RecentActivityController());

  final Rx<BottomBarItem> selectedItem = BottomBarItem.Home.obs;

  RecentActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2, // Number of tabs
        child: Scaffold(
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
            title: Text(
              'Recent Activity',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: appTheme.primaryColor,
                height: 2,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey, // Tab bar bottom border color
                      width: 1.0, // Tab bar bottom border width
                    ),
                  ),
                ),
                child: TabBar(
                  indicatorColor: Colors.black, // Indicator color
                  labelColor: Colors.black, // Selected tab text color
                  unselectedLabelColor:
                      Colors.grey, // Unselected tab text color
                  tabs: [
                    Tab(
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: const Text('Lunch Received'),
                      ),
                    ),
                    Tab(
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: const Text('Lunch Given'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: const TabBarView(
            children: [
              LunchReceivedTab(),
              LunchGivenTab(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedItem: selectedItem,
      ),
    );
  }
}

class LunchReceivedTab extends StatelessWidget {
  const LunchReceivedTab({super.key});

  @override
 Widget build(BuildContext context) {
  return  Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
    _buildActivities(),
    _buildActivities(),
    _buildActivities(),
    _buildActivities(),

      ]
    ),
  );
}

   _buildActivities() {
    return SizedBox(
    width: double.infinity, // Set a specific width, or use 'double.infinity' for full width
    child: ListTile(
      minVerticalPadding: 20,
      leading: Image(image: AssetImage(ImageConstant.imgGroup16)),
      title: const Text(
        'You got 2 free lunches',
        style: TextStyle(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          fontSize: 12.0,
        ),
      ),
      subtitle: const Text(
        'You received a free lunch for your outstanding contribution, thank\nyou for your hard work',
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 12.0,
        ),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
           CustomText(
            fontsize: 12,
            color: appTheme.primaryColor,
            isBold: true, text: 'From Lucy',
          ),
          CustomText(
            fontsize: 10,
            color: appTheme.primaryColor,
            text: 'Today, 02:19pm',
          )
        ],
      ),
    ),
  );
  }
}

class LunchGivenTab extends StatelessWidget {
  const LunchGivenTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('This is the Lunch Received tab content'),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RecentActivityPage(),
  ));
}
