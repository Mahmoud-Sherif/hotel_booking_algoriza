import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'bloc_observer.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await di.init();
  runApp(const MyApp());
}
