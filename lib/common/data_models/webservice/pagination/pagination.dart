class Pagination {
  int page;
  int limit;
  int pages;
  int total;

  Pagination({
    required this.page,
    required this.limit,
    required this.pages,
    required this.total,
  });

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pagination &&
          runtimeType == other.runtimeType &&
          page == other.page &&
          limit == other.limit &&
          pages == other.pages &&
          total == other.total;

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode =>
      page.hashCode ^ limit.hashCode ^ pages.hashCode ^ total.hashCode;

  bool isLastPage() {
    return pages == page;
  }
}
