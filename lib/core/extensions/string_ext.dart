extension Slash on String {

  String get removeLastSlash{
    String value = this;
    if(this[length-1] == '/'){
      value = replaceRange(length-1, length, '');
      value = value.removeLastSlash;
    }
    return value;
  }
}

extension TimeFromDate on String {
  String get timeStringFromDateString{
    String value = this;
    String time = '' ;
    if(length != 0){
      List<String> list = value.split("T");
      if(list.isNotEmpty) {
        List<String> timeList = list[1].split('.');
        if(timeList.isNotEmpty){
        time = timeList[0];
       List times = time.split(":");
       if(times.isNotEmpty && times.length > 1){
         time = times[0] + ":" + times[1] ;
       }

        }
      }
    }
    return time;
  }
}

extension DateFromTimeString on String {
  DateTime?  dateFromTimeString(DateTime time){
    String value = this;
    List values = value.split(":") ;
    int? hours = int.tryParse(values[0]);
    int? minutes =int.tryParse(values[1]);
    return DateTime(time.year , time.month, time.day , hours?? 00 ,minutes ?? 00 ,00);
  }
}

