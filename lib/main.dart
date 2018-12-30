import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_with_redux/models/models.dart';
import 'package:flutter_with_redux/redux/actions.dart';
import 'package:flutter_with_redux/second_page.dart';
import 'package:flutter_with_redux/views/add_item.dart';
import 'package:flutter_with_redux/views/item_list.dart';
import 'package:flutter_with_redux/views/remove_item_button.dart';
import 'package:redux/redux.dart';
import 'redux/reducers.dart';





//int counterReducer(int state , dynamic action){
//  if(action == Actions.Increment){
//    return state + 1;
//  }
//
//  return state;
//}


void main() {
  final store = Store<AppState>(addStateReducer , initialState: AppState.initialize());
  runApp(MyApp(
      title: 'My Flutter Redux App',
      store: store,
  ));
}


class MyApp extends StatelessWidget {

  final Store<AppState> store;
  final title;

  MyApp({Key key, this.store, this.title}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        theme: ThemeData.dark(),
        title : title,
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ));
  }
}



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home page')),
      body : StoreConnector<AppState, ViewModel>(
          converter:(Store<AppState> store )=> ViewModel.create(store),
          builder: (BuildContext context, ViewModel vm){
            return Column(
              children: <Widget>[
                Text(vm.items != null && vm.items.length > 0 ? vm.items[vm.items.length -1 ].body ?? '' : ''),
                AddItemWidget(vm: vm),
                Expanded(child: ItemListWidget(vm:vm)),
                RemoveItemButton(vm: vm),

              ],
            );
          }
      )
    );
  }
}


class AddItemWidget extends StatefulWidget {

  final ViewModel vm;

  AddItemWidget({this.vm});

  @override
  _AddItemWidgetState createState() => _AddItemWidgetState();
}

class _AddItemWidgetState extends State<AddItemWidget> {

  final TextEditingController _c = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: TextField(
        controller: _c,
        decoration: InputDecoration(
          hintText: 'Add Item'
        ),
        onSubmitted: (String s){
          widget.vm.onAddItem(s);
          _c.text = '';
        },
      ),
    );
  }
}


class ItemListWidget extends StatefulWidget {

  final ViewModel vm;

  ItemListWidget({this.vm});

  @override
  _ItemListWidgetState createState() => _ItemListWidgetState();
}

class _ItemListWidgetState extends State<ItemListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.vm.items.length,
      itemBuilder: (context, i){
        return ListTile(
            title: Text(widget.vm.items[i].body),
            leading: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              widget.vm.onRemoveItem(widget.vm.items[i]);
            }
            ,
          ),
        );
      },
    );
  }
}


class RemoveItemButton extends StatefulWidget {

  final ViewModel vm;

  RemoveItemButton({this.vm});

  @override
  _RemoveItemButtonState createState() => _RemoveItemButtonState();
}

class _RemoveItemButtonState extends State<RemoveItemButton> {
  @override
  Widget build(BuildContext context) {
    return
    Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        RaisedButton(onPressed: (){
          widget.vm.onRemoveItems();
        }, child: Text('Delete All Items')),
        RaisedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (c){
            return SecondPage();
          }));
        }, child: Text('Next Page')),
      ],
    );
  }
}



class ViewModel{
  final List<Item> items;
  final Function(String) onAddItem;
  final Function(Item) onRemoveItem;
  final Function() onRemoveItems;

  ViewModel({this.items, this.onAddItem, this.onRemoveItem, this.onRemoveItems});

  factory ViewModel.create(Store<AppState> store){
    _onAddItem(String body){
      store.dispatch(AddItemAction(body));
    }

    _onRemoveItem(Item item){
      store.dispatch(RemoveItemAction(item));
    }

    _onRemoveItems(){
      store.dispatch(RemoveItemsAction());
    }

    return ViewModel(
      items: store.state.items,
      onAddItem: _onAddItem,
      onRemoveItem: _onRemoveItem,
      onRemoveItems: _onRemoveItems,
    );

  }

}



