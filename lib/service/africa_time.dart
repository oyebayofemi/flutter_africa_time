import 'package:intl/intl.dart';
import 'package:http/http.dart';
import 'dart:convert';

class AfricaTime {
  String location;
  String url;
  late String time;
  late bool isDaytime;
  String flag;

  AfricaTime({required this.location, required this.url, required this.flag});

  Future<void> getTime() async {
    try {
      String link = 'https://worldtimeapi.org/api/timezone/$url';

      Response linkResponse = await get(Uri.parse(link));

      Map datas = jsonDecode(linkResponse.body);

      //print(linkResponse);
      //print(datas);

      String datetime = datas['datetime'];
      String offset = datas['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDaytime = now.hour > 7 && now.hour < 19 ? true : false;
      print(isDaytime);
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('object');
    }
  }
}
