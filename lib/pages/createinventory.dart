import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<http.Response> createInventory(
    String inventoryname, String description, String date) {
  return http.post(
      'https://tunishub.com/management_api/api/category/create.php',
      body: {
        'inventory_name': inventoryname,
        'inventory_description': description,
        'inventory_created': '2021-02-15 12:03:36'
      });
}

class CreateInventory extends StatelessWidget {
  final TextEditingController _textFieldController = TextEditingController();

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // title: Text('Input '),
            title: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Inventory Name"),
            ),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Inventory description"),
            ),
            actions: <Widget>[
              FlatButton(
                child: new Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              new FlatButton(
                child: new Text('SUBMIT'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

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
              Expanded(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile();
                  },
                ),
              ),
              Container(
                width: double.infinity,
                child: FlatButton(
                  child: Text(
                    'ADD INVENTORY',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  padding: EdgeInsets.fromLTRB(20.0, 12.0, 20.0, 12.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  color: Theme.of(context).primaryColor,
                  onPressed: () => _displayDialog(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
