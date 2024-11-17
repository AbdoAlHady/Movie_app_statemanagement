import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvVariables {
  EnvVariables._();
  static final EnvVariables _instance = EnvVariables._();
  factory EnvVariables() => _instance;
  String _token = '';
  String _apiKey = '';

  Future<void> init() async {
    await dotenv.load(fileName: '.env');
    _token = dotenv.get('TOKEN');
    _apiKey = dotenv.get('API_KEY');
  }

  String get token => _token;
  String get apiKey => _apiKey;
}
