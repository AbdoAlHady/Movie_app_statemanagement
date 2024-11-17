import 'package:flutter/material.dart';

import 'package:movie_app/core/service/setup_getit.dart';
import 'package:movie_app/movie_app.dart';

import 'core/helpers/env_variables.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvVariables().init();
  initGetIt();
  runApp(const MovieApp());
}
