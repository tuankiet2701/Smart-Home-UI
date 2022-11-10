import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home_ui/utils/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //padding constants
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  //list of smart devices
  List mySmartDevices = [
    ["Smart Light", "assets/icons/lightbulb.png", false],
    ["Smart AC", "assets/icons/air-conditioner.png", false],
    ["Smart TV", "assets/icons/smart-tv.png", false],
    ["Smart Fan", "assets/icons/fan.png", false]
  ];

  //power button switched
  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //custom app bar
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //menu icon
                  Image.asset(
                    'assets/icons/menu.png',
                    height: 35,
                    color: Colors.grey[800],
                  ),

                  //account icon
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey[800],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            //welcome home
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Home,',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[700],
                    ),
                  ),
                  Text(
                    'Tuan Kiet',
                    style: GoogleFonts.bebasNeue(fontSize: 72),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Divider(
                color: Colors.grey[800],
                thickness: 1,
              ),
            ),

            //smart devices + grid
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                'Smart Devices',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.grey[800],
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: mySmartDevices.length,
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(25),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.2,
                ),
                itemBuilder: (context, index) {
                  return SmartDeviceBox(
                    smartDeviceName: mySmartDevices[index][0],
                    iconPath: mySmartDevices[index][1],
                    powerOn: mySmartDevices[index][2],
                    onChanged: (value) => powerSwitchChanged(value, index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
