extension ListExtension<T> on List<T> {
  List<T> insertBetween(T element) {
    for (var i = length - 1; i > 0; i--) {
      insert(i, element);
    }
    return this;
  }
}
