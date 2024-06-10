import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  _launchURL() async {
    const url = 'http://192.168.43.141:5601';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // No app to handle URL, open in browser
      await launch(url, forceWebView: true); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _launchURL,
          child: Text('elasticsearch'),
        ),
      ),
    );
  }
}
