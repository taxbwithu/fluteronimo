import 'package:flutteronimo/common/repositories/deals/deals_repository.dart';

import '../../services/deals_service.dart';

class StubDealsRepository extends DealsRepository {
  final DealsService service;

  StubDealsRepository({
    required this.service,
  });

  //TODO replace with actual objects and pagination
  @override
  Future<List<String>?> readDealList() async {
    return service.readDealList();
  }}