import 'package:flutter/material.dart';
import 'package:flutter_logs/flutter_logs.dart';

import 'ui/pages/home_page.dart';

void main() {
  runApp(const MyApp());
  setupLogging();

}

void setupLogging() async {
  await FlutterLogs.initLogs(
      logLevelsEnabled: [
        LogLevel.INFO,
        LogLevel.WARNING,
        LogLevel.ERROR,
        LogLevel.SEVERE
      ],
      directoryStructure: DirectoryStructure.FOR_DATE,
      timeStampFormat: TimeStampFormat.TIME_FORMAT_READABLE,
      logFileExtension: LogFileExtension.LOG,
      debugFileOperations: true,
      isDebuggable: true);

  FlutterLogs.logInfo("weather_app", "main", "setup logs successful");
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}
