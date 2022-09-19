import 'package:yoko_test/core/api/api.dart';
import 'package:yoko_test/core/storage/local_storage.dart';

abstract class AppProvider {
  final _api = Api();
  final _storage = LocalStorage();

  Api get api => _api;
  LocalStorage get storage => _storage;
}
