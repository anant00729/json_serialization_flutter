import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_with_redux/main.dart';
import 'package:flutter_with_redux/models/models.dart';
import 'package:redux/redux.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Second Page')),
        body: StoreConnector<AppState, ViewModel>(
            converter: (Store<AppState> store) => ViewModel.create(store),
            builder: (BuildContext context, ViewModel vm) {
              return Column(
                children: <Widget>[
                  Text(vm.items != null && vm.items.length > 0
                      ? vm.items[vm.items.length - 1].body ?? ''
                      : ''),
                  AddItemWidget(vm: vm),
                  Expanded(child: ItemListWidget(vm: vm)),
                  RemoveItemButton(vm: vm),
                ],
              );
            }));
  }
}
