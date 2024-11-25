import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/core/helpers/cache_helper.dart';
import 'package:movie_app/core/logs/riverpod_observer.dart';

import 'package:movie_app/core/service/setup_getit.dart';
import 'package:movie_app/movie_app.dart';

import 'core/helpers/env_variables.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvVariables().init();
  await CacheHelper().init();
  initGetIt();
  runApp(
      ProviderScope(observers: [RiverpodObserver()], child: const MovieApp()));
}
