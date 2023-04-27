import 'package:google_docs_clone/model/utilities/imports/generalImport.dart';

// format time of the day

String formatTimeOfDay(TimeOfDay tod) {
  final now = DateTime.now();
  final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
  final format = DateFormat.jm(); //"6:00 AM"
  return format.format(dt);
}

// current time

currentTime({DateTime? timeInputed}) {
  DateTime now = timeInputed ?? DateTime.now();
  TimeOfDay timeNow = TimeOfDay.fromDateTime(now);
  var time = formatTimeOfDay(timeNow);
  return time;
}

// convert 12 hours time to 24 hours
dateTime24(String time) {
  // time in this format 6:45AM or 6:45PM
  DateTime date1 = DateFormat("hh:mma").parse(time.replaceAll(" ", ""));
  TimeOfDay timeNow =
      TimeOfDay.fromDateTime(date1); // returns e.g TimeOfDay(18:45)
  var value = timeNow.toString().split("").sublist(10, 15); // returns [18:45]
  var concatenate = StringBuffer();
  // with the function below, you will convert the list to string
  value.forEach((item) {
    concatenate.write(item);
  });
  print(concatenate);
  return concatenate;
}

// convert 24 hours to 12 hours time (not done yet)
dateTime12hours() {
  Map growableMap = {}; // this map is a growable map
  List<String> questions = [
    "1",
    "3",
    "4",
    "6",
    "6",
    "1",
    "0"
  ]; // this is the list of question
  List mapCounter = List.generate(
      questions.length,
      (index) =>
          index +
          1); // i am creating list of int, from the length of the question and increasing the result by 1, to remove 0 index and start from 1

  // i am using the mapCounter, using the integer as key and question  value as value
  for (int index in mapCounter) {
    growableMap[index] = questions[index - 1];
  }
  // after the above function runs, the map will be filled with the new value
  print(growableMap);
}

// current date
currentDate(value) {
  DateTime now = DateTime.now();
  String formattedDate = DateFormat('EEEE d, MMMM y ').format(now);
  String dayMonth = DateFormat('EEEE d, MMMM ').format(now);
  String justDay = DateFormat('d').format(now);
  String justMonth = DateFormat('MMMM ').format(now);
  String justYear = DateFormat('y').format(now);
  String monthYear = DateFormat(' MMMM y ').format(now);
  if (value == 'day') return justDay;
  if (value == 'full date') return formattedDate;
  if (value == 'year') return justYear;
  if (value == 'month') return justMonth;
  if (value == 'day and month') return dayMonth;
  if (value == 'month and year') return monthYear;
}

getCurrentDate(DateTime now, String value) {
  String formattedDate = DateFormat('d, MMMM y ').format(now);
  String dayMonth = DateFormat('EEEE d, MMMM ').format(now);
  String commaSeparated = DateFormat("dd/MM/yyyy").format(now);
  String dashSeparated = DateFormat("dd-MM-yyyy").format(now);
  String justMonth = DateFormat('MMMM ').format(now);
  String monthNumber = DateFormat('M').format(now);
  String justDay = DateFormat('d').format(now);
  String justYear = DateFormat(' y ').format(now);
  String monthYear = DateFormat(' MMMM y ').format(now);
  if (value == 'full date') return formattedDate;
  if (value == 'comma separated') return commaSeparated;
  if (value == 'dash separated') return dashSeparated;
  if (value == 'day') return justDay;
  if (value == 'year') return justYear;
  if (value == 'month') return justMonth;
  if (value == 'monthNumber') return monthNumber;
  if (value == 'day and month') return dayMonth;
  if (value == 'month and year') return monthYear;
}

Map<int, int> monthList(bool isLeapYear) {
  return {
    1: 31,
    2: isLeapYear == true ? 28 : 27,
    3: 31,
    4: 30,
    5: 30,
    6: 30,
    7: 30,
    8: 30,
    9: 30,
    10: 30,
    11: 30,
    12: 30
  };
}

int calculateMonth(DateTime to) {
  DateTime from = DateTime.now();
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  print((to.difference(from).inHours / 24).round());
  return (to.difference(from).inHours / 24).round();
}
