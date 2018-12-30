import 'package:flutter/material.dart';


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


