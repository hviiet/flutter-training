extension DateExtension on String {
  String get toShortDayofWeek {
    if (isEmpty) {
      return ''; 
    }

    try {
      DateTime date = DateTime.parse(this);
      switch (date.weekday) {
        case DateTime.monday:
          return 'Mon';
        case DateTime.tuesday:
          return 'Tue';
        case DateTime.wednesday:
          return 'Wed';
        case DateTime.thursday:
          return 'Thu';
        case DateTime.friday:
          return 'Fri';
        case DateTime.saturday:
          return 'Sat';
        case DateTime.sunday:
          return 'Sun';
        default:
          return '';
      }
    } catch (e) {
      return this; 
    }
  }

  bool get isTodayOrTomorrow {
    DateTime date = DateTime.parse(this);
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    DateTime tomorrow = today.add(const Duration(days: 1));
    
    return date == today || date == tomorrow;
  }

  String get getDayLabel{
    DateTime date = DateTime.parse(this);
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    DateTime tomorrow = today.add(const Duration(days: 1));
    
    if (date == today) return 'Today';
    if (date == tomorrow) return 'Tomorrow';
    
    return this; // Trả về chuỗi gốc nếu không phải hôm nay hoặc ngày mai
  }
}