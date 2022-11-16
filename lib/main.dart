import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:untitled/controller.dart';

main() {
  runApp(GetMaterialApp(home: zomato()));
}

class zomato extends StatelessWidget {
  zomato({Key? key}) : super(key: key);
  cntr ct_ = Get.put(cntr());

  List<int> prise = [50, 100, 120, 70, 150];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("ZOMATO"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      Obx(() => CheckboxListTile(
                          subtitle: Card(
                              child: Text(
                                "RS = ${prise[index]}\$",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.height * 0.03, color: Colors.black),
                              ),
                              color: Colors.pinkAccent),
                          title: Card(
                              color: Colors.red,
                              child: Text(
                                "iteme ${index + 1}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.height * 0.04,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                          value: ct_.cat[index],
                          onChanged: (val) {
                            ct_.cat[index] = val!;
                            ct_.getTotal(prise[index], val, index);
                          })),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 3, color: Colors.black),
                              image: DecorationImage(
                                  image: AssetImage("img/f${index + 1}.jpg"))),
                          height:MediaQuery.of(context).size.height * 0.1,
                          width:MediaQuery.of(context).size.height * 0.1,
                        ),
                      )
                    ],
                  );
                },
                itemCount: 5,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.height * 0.12,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.redAccent, Colors.pinkAccent]),
                  shape: BoxShape.circle),
              alignment: Alignment.center,
              child: Obx(() => Text("${ct_.total}",
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.bold))),
            )
          ],
        ));
  }
}
