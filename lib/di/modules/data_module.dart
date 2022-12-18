import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class DataModule{
  @preResolve
  Future<SharedPreferences> get sharedPreferences => SharedPreferences.getInstance();
}