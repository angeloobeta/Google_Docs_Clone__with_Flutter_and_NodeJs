String k_m_b_generator(num number) {
  if (number > 999 && number < 99999) {
    return "${(number / 1000).round().toString()} K";
  } else if (number > 99999 && number < 999999) {
    return "${(number / 1000)..round().toString()} K";
  } else if (number > 999999 && number < 999999999) {
    return "${(number / 1000000).round().toString()} M";
  } else if (number > 999999999) {
    return "${(number / 1000000000).round().toString()} B";
  } else {
    return number.toString();
  }
}

// change month to years plus month
String monthsToYear(int value) {
  if (value == 1) {
    return "1 Month";
  }
  if (value < 12) {
    return "$value Months";
  }
  if (value >= 12) {
    String year = (value / 12).floor().toString();
    int month = value % 12;
    return "$year ${int.parse(year) == 1 ? "Year" : "Years"}${month > 0 ? ", $month ${month == 1 ? "Month" : "Months"}" : ""}";
  } else {
    return "";
  }
}
