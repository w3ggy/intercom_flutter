import 'package:flutter/material.dart';
import 'package:intercom_flutter/intercom_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Intercom.initialize(
    'appId',
    androidApiKey: 'androidApiKey',
    iosApiKey: 'iosApiKey',
  );
  runApp(SampleApp());
}

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Intercom example app'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FlatButton(
                onPressed: () {
                  Intercom.displayMessenger();
                },
                child: Text('Show messenger'),
              ),
              StreamBuilder(
                stream: Intercom.getUnreadConversationsChangeStream(),
                initialData: -1,
                builder: (context, AsyncSnapshot<int> snapshot) {
                  return Text(
                      'Unread Conversations count: ${snapshot.data.toString()}');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
