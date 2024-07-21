extension ExtensionList<T> on List<T> {
  List<T> insertBetween(T elem)
  {
    for (int i = 1; i < length - 1; i++) {
      insert(i, elem);
    }
    return this;
  }
}