import 'package:flutter/material.dart';
import 'package:africa_time/service/africa_time.dart';
import 'package:africa_time/pages/loading_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);

    Color bgColor = data['isDaytime'] ? Colors.red : Colors.amber;
    String bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    Color textColor = data['isDaytime'] ? Color(0xFFE8BD0D) : Color(0xFFFF6263);
    Color opacityColor = data['isDaytime']
        ? Colors.blue.withOpacity(0.6)
        : Colors.blue.withOpacity(0.8);

    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('lib/assets/$bgImage'),
                fit: BoxFit.cover,
                colorFilter:
                    new ColorFilter.mode(opacityColor, BlendMode.dstATop))),
        child: Padding(
          padding: const EdgeInsets.only(top: 200),
          child: Center(
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/location');

                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isDaytime': result['isDaytime'],
                          'flag': result['flag'],
                        };
                      });
                    },
                    icon: Icon(Icons.location_on_rounded),
                    label: Text(
                      'Edit Location',
                      style: TextStyle(color: textColor, fontSize: 15),
                    )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  data['location'],
                  style: TextStyle(
                    fontSize: 30,
                    letterSpacing: 1.5,
                    color: Color(0xFFFF6263),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
