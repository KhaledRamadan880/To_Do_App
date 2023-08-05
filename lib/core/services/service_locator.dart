import 'package:get_it/get_it.dart';
import 'package:to_do_app/core/database/database.dart';

final serviceLocator = GetIt.instance;
void setup()  {
  serviceLocator.registerLazySingleton<Cach>(() => Cach());
}
