import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shop_management/helper/helper.dart';
import 'package:shop_management/model/api_model.dart';
import 'package:shop_management/pages/charts.dart';
import 'package:shop_management/pages/createinventory.dart';
import 'package:shop_management/pages/inventorypage.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List dataSource;

  String formatDateDay(DateTime dateTime) => '${dateTime.day}';
  String newDate(x) => DateFormat.MMMEd().format(x);

  getData() async {
    try {
      const url = "https://tunishub.com/management_api/api/inventory/read.php";
      http.Response source = await http.get(url);
      dataSource = jsonDecode(source.body);

      //print(data);
      if (dataSource.isNotEmpty) {
        for (var i = 0; i < dataSource.length; i++) {
          Records record = Records.fromJson(dataSource[i]);
          listRecords.add(record);
        }
        setState(() {});
      } else {
        print('Empty Records');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Management',
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(
                'Menu',
              ),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            ListTile(
              title: Text(
                'Create Inventory Name',
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => CreateInventory()));
              },
            ),
            ListTile(
              title: Text(
                'Charts',
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => ChartsPage()));
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: dataSource != null
            ? ListView.builder(
                itemCount: listRecords.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        "${formatDateDay(listRecords[index].date)}",
                      ),
                    ),
                    title: Text("${newDate(listRecords[index].date)}"),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => InventoryPage(
                            listInventoryData: listRecords[index].inventory,
                          ),
                        ),
                      );
                    },
                  );
                },
              )
            : SpinKitFadingCircle(
                color: Colors.green,
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => InventoryPage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
