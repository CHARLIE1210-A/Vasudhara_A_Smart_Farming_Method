import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String logoPath;

  const CustomAppBar({super.key, required this.title, required this.logoPath});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.white, // Change drawer icon color here
      ),

      title: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            // child: Image.asset(
            //   logoPath,
            //   height: 45.0,
            //   color: Colors.white,
            // ),
            child: SvgPicture.asset(
              'assets/logo/download.svg',
              height: 50,
              width: 50,
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcATop),
            ),
          ),
          Text(
            title,
            style: GoogleFonts.merienda(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              letterSpacing: 2.5,
            ),
          ),
        ],
      ),

      // leading: Builder(
      //   builder: (BuildContext context) {
      //     return IconButton(
      //       icon: const Icon(Icons.menu),
      //       color: Colors.white,
      //       onPressed: () {
      //         Scaffold.of(context).openDrawer();
      //       },
      //       tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      //     );
      //   },
      // ),
      backgroundColor: Colors.green,
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFFFFFFF),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Text(
              'Agriculture Features',
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.eco),
            title: const Text('Smart Greenhouses'),
            onTap: () {
              // Update the state of the app
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.pets),
            title: const Text('Remote Livestock Management'),
            onTap: () {
              // Update the state of the app
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.airplanemode_active),
            title: const Text('Drone Monitoring'),
            onTap: () {
              // Update the state of the app
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.analytics_outlined),
            title: const Text('Long-term Forecasts and Financial Analytics'),
            onTap: () {
              // Update the state of the app
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.water_damage),
            title: const Text('Precision Watering'),
            onTap: () {
              // Update the state of the app
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.bug_report),
            title: const Text('Smart Pest and Disease Control'),
            onTap: () {
              // Update the state of the app
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.agriculture),
            title: const Text('Crop and Harvest Monitoring'),
            onTap: () {
              // Update the state of the app
              // ...
            },
          ),
          ListTile(
            leading: const Icon(Icons.wb_sunny),
            title: const Text('Weather Tracking and Prediction'),
            onTap: () {
              // Update the state of the app
              // ...
            },
          ),
        ],
      ),
    );
  }
}
