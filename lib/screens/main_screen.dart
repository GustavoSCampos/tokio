import 'package:tokio_test/widgets/dashboard_widget.dart';
import 'package:tokio_test/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SizedBox(
        child: CustomDrawer(),
      ),
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: DashboardWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
