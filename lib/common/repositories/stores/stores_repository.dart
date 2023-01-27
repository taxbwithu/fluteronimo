
import '../../data_models/store_data/store_data.dart';

abstract class StoresRepository {
  Future saveStoreList();

  Future<List<StoreData>?> getStoreList();
}