import 'package:calculator/core/constants/keys.dart';
import 'package:calculator/views/mainview.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() async {
  await SentryFlutter.init(
    (options) {
      options.dsn = Keys.sentryDsn;
      options.sendDefaultPii = true;
    },
    appRunner: () => runApp(
      SentryWidget(
        child: App(),
      ),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Mainview(),
      ),
    );
  }
}
