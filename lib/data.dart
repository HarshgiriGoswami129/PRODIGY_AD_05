import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ScannedDataScreen extends StatelessWidget {
  final String scannedData;

  ScannedDataScreen({required this.scannedData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scanned Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Scanned Data:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(scannedData),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _launchURL,
              child: Text('Open Link'),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL() async {
    if (await canLaunch(scannedData)) {
      await launch(scannedData);
    } else {
      throw 'Could not launch $scannedData';
    }
  }
}
