class stringModify {
  String formatErrorMsg(String msg) {
    // String formatted = msg.split(" ")[0].split("/")[1];
    // String prefix = "[";
    String formatted = msg.split("]")[1];
    return formatted;
  }
}
