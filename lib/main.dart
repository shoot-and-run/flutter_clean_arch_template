import 'package:beamer/beamer.dart';
import 'package:clean_arch_template/di/di_host.dart';
import 'package:clean_arch_template/presentation/base/localization/localization_widget.dart';
import 'package:clean_arch_template/presentation/base/navigation/navigation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    LocalizationWidget(
      child: const DIHost(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Clean arch template',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: BeamerParser(),
      routerDelegate: routerDelegate,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
    );
  }
}
