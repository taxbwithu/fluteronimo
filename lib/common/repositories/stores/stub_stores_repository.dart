import 'dart:convert';

import 'package:flutteronimo/common/data_models/store_data/store_data.dart';
import 'package:flutteronimo/common/repositories/storage_and_settings/data_model/shared_preference_key.dart';
import 'package:flutteronimo/common/repositories/storage_and_settings/shared_preferences_storage.dart';
import 'package:flutteronimo/common/repositories/stores/stores_repository.dart';

import '../../services/stores_service.dart';

class StubStoresRepository extends StoresRepository {
  final StoresService service;
  final SharedPreferencesStorage storage;

  StubStoresRepository({
    required this.service,
    required this.storage,
  });

  @override
  Future saveStoreList() async {
    final itemList = await getStoreList();
    if (itemList != null) {
      return itemList;
    }
    final items = await service.readStoreList();
    await storage.saveString(
      value: json.encode(items.map((e) => e.toJson()).toList()),
      forKey: SharedPreferenceKey.storages,
    );
  }

  @override
  Future<List<StoreData>?> getStoreList() async {
    String? itemsRaw = (await storage.getValueFor(
      key: SharedPreferenceKey.storages,
    )) as String?;
    if (itemsRaw == null || itemsRaw.isEmpty) {
      return null;
    }
    List<dynamic> items = json.decode(itemsRaw);
    return items.map((e) => StoreData.fromJson(e)).toList();
  }
}
