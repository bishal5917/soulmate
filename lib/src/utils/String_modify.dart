class stringModify {
  String formatErrorMsg(String msg) {
    String formatted = msg.split(" ")[0].split("/")[1];
    String prefix = "[";
    return prefix + formatted;
  }
}
