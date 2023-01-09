extension ListExtension<String> on List<String> {
  List<String> addAllUnique() {
    List<String> list = this;
    List<String> newList = [];
    for (var element in list) {
      if (!newList.contains(element)) {
        newList.add(element);
      }
    }
    return newList;
  }
}