import 'package:flutter/material.dart';

import 'package:shop_management/model/api_model.dart';

class InventoryPage extends StatefulWidget {
  final List<Inventory> listInventoryData;
  InventoryPage({this.listInventoryData});
  @override
  _InventoryPageState createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  List inventorys;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Inventories',
        ),
      ),
      body: SafeArea(
        child: Container(
            child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.listInventoryData.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      "${widget.listInventoryData[index].inventoryName}",
                    ),
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                  ),
                ),
                onPressed: () {},
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Text("Create Inventory"),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
