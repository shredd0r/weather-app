import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_logs/flutter_logs.dart';


import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:weather_app/src/services/repositories/impl/configuration/configuration_sqllite_repository.dart';
import 'package:weather_app/src/static/weather_provider_enum.dart';
import 'src/ui/pages/home_page.dart';

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

  @override
  Widget build(BuildContext context) {
    var repo = ConfigurationSqlLiteRepository();

    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(repo),
    );
  }
}
