import 'package:africa_time/service/africa_time.dart';
import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<AfricaTime> datas = [
    AfricaTime(
        location: 'Eygpt, Cairo', url: 'Africa/Cairo', flag: 'egypt.png'),
    AfricaTime(
        location: 'Ghana, Accra', url: 'Europe/London', flag: 'ghana.png'),
    AfricaTime(
        location: 'Kenya, Nairobi', url: 'America/Chicago', flag: 'kenya.jpg'),
    AfricaTime(
        location: 'Guinea, Bissau', url: 'Africa/Bissau', flag: 'guinea.jpg'),
    AfricaTime(
        location: 'South Africa, Johannesburg',
        url: 'Africa/Johannesburg',
        flag: 'southAfrica.jpg'),
    AfricaTime(
        location: 'São Tomé and Príncipe, Sao_Tome',
        url: 'Africa/Sao_Tome',
        flag: 'saoTome.jpg'),
    AfricaTime(
        location: 'Tunisia, Tunis', url: 'Africa/Tunis', flag: 'tunisia.jpg'),
  ];

  void updatetime(index) async {
    AfricaTime instance2 = datas[index];
    await instance2.getTime();

    Navigator.pop(context, {
      'location': instance2.location,
      'isDaytime': instance2.isDaytime,
      'time': instance2.time,
      'flag': instance2.flag,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Location'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: datas.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updatetime(index);
                  },
                  title: Text(datas[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('lib/assets/flags/${datas[index].flag}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
