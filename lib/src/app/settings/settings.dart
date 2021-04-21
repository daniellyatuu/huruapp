import 'package:flutter/material.dart';
import 'package:huruapp/src/app/settings/settings_files.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String _url = 'https://www.huruapp.org/';
  void _launchURL() async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

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
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AboutUs()),
                );
              },
              title: Text('About us'),
              trailing: Icon(Icons.arrow_right),
            ),
          ),
          Card(
            color: Colors.grey.shade200,
            child: ListTile(
              onTap: () {
                Share.share(
                    'You can stop using drugs, you just have to make the decision to do so today. Please visit https://www.huruapp.org/');
              },
              leading: Icon(Icons.share_outlined),
              title: Text('Tell a friends'),
              trailing: Icon(Icons.arrow_right),
            ),
          ),
          // Card(
          //   color: Colors.grey.shade200,
          //   child: ListTile(
          //     onTap: () {
          //       Navigator.of(context).push(
          //         MaterialPageRoute(
          //           builder: (context) => PrivacyPolicy(),
          //         ),
          //       );
          //     },
          //     title: Text('Privacy Policy'),
          //     trailing: Icon(Icons.arrow_right),
          //   ),
          // ),
          Card(
            color: Colors.grey.shade200,
            child: ListTile(
              onTap: _launchURL,
              title: Text('Huru Website'),
              trailing: Icon(Icons.arrow_right),
            ),
          ),
        ],
      ),
    );
  }
}
