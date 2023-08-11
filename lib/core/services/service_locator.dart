import 'package:get_it/get_it.dart';
import 'package:to_do_app/core/database/cash/database.dart';
import 'package:to_do_app/core/database/sqlflite_helper/sqlflite_helper.dart';

final serviceLocator = GetIt.instance;
void setup()  {
  serviceLocator.registerLazySingleton<Cach>(() => Cach());
  serviceLocator.registerLazySingleton<SqlFLiteHelper>(() => SqlFLiteHelper());
}
