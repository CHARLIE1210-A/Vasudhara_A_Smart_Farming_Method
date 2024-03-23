import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String logoPath;

  CustomAppBar({required this.title, required this.logoPath});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(logoPath, height: 36.0),
          ),
          Text(title),
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
      backgroundColor: Colors.blue,
    );
  }
}

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Agriculture Features'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.eco),
            title: Text('Smart Greenhouses'),
            onTap: () {
              // Update the state of the app
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.pets),
            title: Text('Remote Livestock Management'),
            onTap: () {
              // Update the state of the app
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.airplanemode_active),
            title: Text('Drone Monitoring'),
            onTap: () {
              // Update the state of the app
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.analytics_outlined),
            title: Text('Long-term Forecasts and Financial Analytics'),
            onTap: () {
              // Update the state of the app
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.water_damage),
            title: Text('Precision Watering'),
            onTap: () {
              // Update the state of the app
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.bug_report),
            title: Text('Smart Pest and Disease Control'),
            onTap: () {
              // Update the state of the app
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.agriculture),
            title: Text('Crop and Harvest Monitoring'),
            onTap: () {
              // Update the state of the app
              // ...
            },
          ),
          ListTile(
            leading: Icon(Icons.wb_sunny),
            title: Text('Weather Tracking and Prediction'),
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
