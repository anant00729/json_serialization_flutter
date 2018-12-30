import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_with_redux/user.dart';
import 'package:http/http.dart' as http;



class JsonDecode extends StatefulWidget {
  @override
  _JsonDecodeState createState() => _JsonDecodeState();
}

class _JsonDecodeState extends State<JsonDecode> {

  void _fetchData() async {
    final res = await http.get('http://192.168.1.28:3000');
    Map<String, dynamic> data = json.decode(res.body);


    SeatLayoutData d = SeatLayoutData.fromJson(data);
    print(d);


    for (var v in d.seatLayouts) {
      for (var s in v.seats) {
        print('Seat Name ${s.SeatName} and Seat Price is ${s.Price}');
      }
    }

  }


  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('he'),),
    );
  }
}
