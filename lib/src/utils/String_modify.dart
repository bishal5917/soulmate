class stringModify {
  Map<String, dynamic> yearMap = {
    "01": "Jan",
    "02": "feb",
    "03": "Mar",
    "04": "Apr",
    "05": "May",
    "06": "June",
    "07": "July",
    "08": "Aug",
    "09": "Sep",
    "10": "Oct",
    "11": "Nov",
    "12": "Dec",
  };

  String formatErrorMsg(String msg) {
    // String formatted = msg.split(" ")[0].split("/")[1];
    // String prefix = "[";
    String formatted = msg.split("]")[1];
    return formatted;
  }

  String formatDate(String receivedDate) {
    // const receivedDate = "2023-05-15 19:05:52.808426";
    String year = receivedDate.split(" ")[0];
    String time = receivedDate.split(" ")[1].split(".")[0];
    final getYear = year.split("-")[0];
    final getMonth = year.split("-")[1];
    final getDay = year.split("-")[2];
    final yearPart = "$getDay,${yearMap[getMonth]} $getYear";
    final getHour = time.split(":")[0];
    final getMins = time.split(":")[1];
    final getHourIn12Hr = int.parse(getHour) - 12;
    final timePart = "$getHourIn12Hr:$getMins";
    final formattedDate = "$yearPart at $timePart";
    // print(formattedDate);
    return formattedDate;
  }
}
