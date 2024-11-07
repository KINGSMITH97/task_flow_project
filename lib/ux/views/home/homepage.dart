import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:task_flow_project/ux/resources/colors.dart';
import 'package:task_flow_project/ux/view_models/bottom_nav_model.dart';
import 'package:task_flow_project/ux/views/home/archive_page.dart';
import 'package:task_flow_project/ux/views/home/calendar_page.dart';
import 'package:task_flow_project/ux/views/home/report_page.dart';
import 'package:task_flow_project/ux/views/home/tasks_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final pages = [
    const TasksPage(),
    const ReportPage(),
    const CalendarPage(),
    const ArchivePage(),
  ];
  // int selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[Provider.of<BottomNavModel>(context).selectedIndex],
      bottomNavigationBar: Consumer<BottomNavModel>(
          builder: (context, bottomNavProvider, child) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (value) => bottomNavProvider.toggleSelectedIndex(value),
          showSelectedLabels: true,
          showUnselectedLabels: false,
          backgroundColor: ColorSource.white,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
          elevation: 0,
          currentIndex: bottomNavProvider.selectedIndex,
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedHome02,
                color: ColorSource.black,
              ),
            ),
            BottomNavigationBarItem(
              label: "Reports",
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedAnalytics02,
                color: ColorSource.black,
              ),
            ),
            BottomNavigationBarItem(
              label: "Calendar",
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedCalendar03,
                color: ColorSource.black,
              ),
            ),
            BottomNavigationBarItem(
              label: "Archive",
              icon: HugeIcon(
                icon: HugeIcons.strokeRoundedDelete03,
                color: ColorSource.black,
              ),
            ),
          ],
        );
      }),
    );
  }
}
