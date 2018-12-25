import 'package:flutter/material.dart';
import 'package:flutter_with_redux/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' ;


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter + Redux",
      theme: ThemeData.dark(),
      home: JsonDecode(),
      debugShowCheckedModeBanner: false,
    );
  }
}


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



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context,i){
            return ListTile(
              title: Text('hello all $i'),
              leading: Checkbox(value: false, onChanged: null),
            );
      }),
      floatingActionButton: FloatingActionButton(onPressed: (){_showPopup(context);},child: Icon(Icons.add),),
    );
  }

  void _showPopup(BuildContext context) {
    showDialog(context: context, builder: (context){
       return new AlertDialog(
         contentPadding: const EdgeInsets.all(16.0),
         content: Row(
           children: <Widget>[
             Expanded(
               child: TextField(
                 decoration: InputDecoration(
                   labelText: 'Item name' , hintText: 'eg. Apple'
                 ),
               ),
             )
           ],
         ),
         actions: <Widget>[
           FlatButton(
             child: Text('CANCEL'),
             onPressed: (){
               Navigator.pop(context);
             },
           ),
           FlatButton(
             child: Text('ADD'),
             onPressed: (){
               Navigator.pop(context);
             },
           )
         ],
       );
    });
  }
}


class CartItem{
  String name;
  bool checked;
  CartItem({this.name, this.checked});
}


