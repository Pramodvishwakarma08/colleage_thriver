import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Email Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Email Example'),
      ),
      body: Center(
        child: SendEmailButton(),
      ),
    );
  }
}

class SendEmailButton extends StatelessWidget {
  Future<void> sendEmail() async {
    print('object');
    Uri uri =Uri.parse("mailto:info@rapidtech.dev?subject=Flutter url launcher &body=Hi ,Flutter developer");
    // final Uri emailUri = Uri(
    //   scheme: 'mailto',
    //   path: 'example@email.com',
    //   queryParameters: {'subject': 'Hello from Flutter!'},
    // );
    //

  }
  // void _launchEmail(String recipient) async {
  //   final Uri emailUri = Uri(
  //     scheme: 'mailto',
  //     path: recipient,
  //   );
  //
  //   if (await canLaunch(emailUri.toString())) {
  //     await launch(emailUri.toString());
  //   } else {
  //     throw 'Could not launch $emailUri';
  //   }
  // }



  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => sendEmail(),
      child: Text('Send Email'),
    );
  }
}
