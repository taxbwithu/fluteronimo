import 'pagination.dart';

class PaginatedData<T> {
  final Pagination paginationData;

  List<T> items;

  PaginatedData({
    required this.paginationData,
    required this.items,
  });
}
