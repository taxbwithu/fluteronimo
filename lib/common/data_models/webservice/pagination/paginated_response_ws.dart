
import 'package:flutteronimo/common/data_models/webservice/pagination/pagination.dart';

class PaginatedResponseWs {
  final List<Map<String, dynamic>> items;
  final Pagination paginationData;

  PaginatedResponseWs({
    required this.paginationData,
    required this.items,
  });

  factory PaginatedResponseWs.fromJson(Map<String, dynamic> json) {
    final jsonItems = json["_embedded"]["items"] as List<dynamic>;
    final items = jsonItems
            .map<Map<String, dynamic>>(
              (dynamic node) => node as Map<String, dynamic>,
            )
            .toList();

    return PaginatedResponseWs(
      paginationData: Pagination(
        page: json["page"] as int,
        limit: json["limit"] as int,
        pages: json["pages"] as int,
        total: json["total"] as int,
      ),
      items: items,
    );
  }
}
