extension ReplaceWhiteSpaces on String {
  replaceWhiteSpaces() {
    return replaceAll(RegExp(r"\s+"), " ");
  }
}
