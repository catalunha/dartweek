class PaginationFilter {
  int page;
  int limit;
  PaginationFilter({
    this.page = 1,
    this.limit = 1,
  });

  @override
  String toString() => 'PaginationFilter(page: $page, limit: $limit)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PaginationFilter &&
        other.page == page &&
        other.limit == limit;
  }

  @override
  int get hashCode => page.hashCode ^ limit.hashCode;
}
