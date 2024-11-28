import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvTypeEnum { dev, prod }

class EnvVariable {
  EnvVariable._();
  static final EnvVariable instance = EnvVariable
      ._(); //one instanced only in the class itsel in the app(singleton pattern)

  String _envType = '';
// env switch
  Future<void> init({required EnvTypeEnum envType}) async {
    switch (envType) {
      case EnvTypeEnum.dev:
        await dotenv.load(fileName: '.env.dev');

      case EnvTypeEnum.prod:
        await dotenv.load(fileName: '.env.prod');
    }
    _envType = dotenv.get('ENV_TYPE');
  }

  bool get debugMode =>
      _envType ==
      'dev'; // public getter for accessing the private _envType variable.
}
