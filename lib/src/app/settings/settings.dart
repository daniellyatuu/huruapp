import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Color(0xFF417690),
      ),
      body: ListView(
        children: [
          Card(
            color: Colors.grey.shade200,
            child: ListTile(
              title: Text('About us'),
              trailing: Icon(Icons.arrow_right),
            ),
          ),
          Card(
            color: Colors.grey.shade200,
            child: ListTile(
              leading: Icon(Icons.share_outlined),
              title: Text('Tell a friends'),
              trailing: Icon(Icons.arrow_right),
            ),
          ),
          Card(
            color: Colors.grey.shade200,
            child: ListTile(
              title: Text('Privacy Policy'),
              trailing: Icon(Icons.arrow_right),
            ),
          ),
          Card(
            color: Colors.grey.shade200,
            child: ListTile(
              title: Text('Huru Website'),
              trailing: Icon(Icons.arrow_right),
            ),
          ),
        ],
      ),
    );
  }
}
