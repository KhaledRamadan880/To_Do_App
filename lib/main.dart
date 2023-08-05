import 'package:flutter/material.dart';
import 'package:to_do_app/core/database/database.dart';
import 'package:to_do_app/core/services/service_locator.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await serviceLocator<Cach>().init();
  runApp(const MyApp());
}
