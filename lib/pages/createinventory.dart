import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop_management/model/model.dart';

class CreateInventory extends StatefulWidget {
  @override
  _CreateInventoryState createState() => _CreateInventoryState();
}

Future<UserModel> createUser(
  String inventoryName,
  String inventoryDescription,
) async {
  final response = await http.post(
      Uri.parse('tunishub.com/management_api/api/category/create.php'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "inventory_name": inventoryName,
        "inventory_description": inventoryDescription
      }));
  print(response.statusCode);
  if (response.statusCode == 201) {
    String responseString = response.body;
    return UserModel.fromJson(jsonDecode(responseString));
  } else {
    throw Exception('Failed');
  }
}

class _CreateInventoryState extends State<CreateInventory> {
  Future<UserModel> _user;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobController = TextEditingController();

  // _displayDialog(BuildContext context) async {
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           // title: Text('Input '),
  //           title: TextField(
  //             controller: inventory_name,
  //             decoration: InputDecoration(hintText: "Inventory Name"),
  //           ),
  //           content: TextField(
  //             controller: inventory_description,
  //             decoration: InputDecoration(hintText: "Inventory description"),
  //           ),
  //           actions: <Widget>[
  //             FlatButton(
  //               child: new Text('CANCEL'),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //             new FlatButton(
  //               child: new Text('SUBMIT'),
  //               onPressed: () {
  //                 createInventory();
  //               },
  //             ),
  //           ],
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField AlertDialog Demo'),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              TextField(
                controller: nameController,
              ),
              TextField(
                controller: jobController,
              ),
              _user != null ? Container() : Text(""),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        // padding: EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 12.0),
        // shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(8.0)),
        // color: Theme.of(context).primaryColor,
        onPressed: () {
          String name = nameController.text;
          String job = jobController.text;

          setState(() {
            _user = createUser(name, job);
          });
        },
      ),
    );
  }
}
