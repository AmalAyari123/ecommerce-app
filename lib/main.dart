import 'package:ecommerce/global/connectivityController.dart';
import 'package:ecommerce/global/env.variable.dart';
import 'package:ecommerce/screens/home.dart';
import 'package:ecommerce/screens/noNetwork.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvVariable.instance.init(envType: EnvTypeEnum.dev);

  // Initialize Firebase
  await Firebase.initializeApp();

  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Connectivitycontroller.instance.isConnected,
        builder: (_, value, __) {
          if (value) {
            return MaterialApp(
                debugShowCheckedModeBanner: EnvVariable.instance.debugMode,
                title: 'Flutter Demo',
                theme: ThemeData(
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
                builder: (context, widget) {
                  return Scaffold(
                    body: Builder(builder: (context) {
                      Connectivitycontroller.instance.init();
                      return widget!;
                    }),
                  );
                },
                home: Scaffold(
                  body: Text("aaa"),
                ));
          } else {
            return MaterialApp(
              debugShowCheckedModeBanner: EnvVariable.instance.debugMode,
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: NoNetwrok(),
            );
          }
        });
  }
}
