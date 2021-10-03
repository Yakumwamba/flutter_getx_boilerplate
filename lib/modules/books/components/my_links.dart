import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyLinks extends StatelessWidget {
  MyLinks({Key? key}) : super(key: key);
  final List<String> entries = <String>['A', 'B', 'C', 'B', 'C', 'B', 'C'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: Get.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 100,
                  child: Center(
                    child: Text("Search videos "),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  padding: EdgeInsets.only(left: 6, right: 6),
                  child: ListView.separated(
                    padding: const EdgeInsets.all(10),
                    itemCount: entries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 100,
                        color: Colors.grey[300],
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 100,
                                width: 70,
                                decoration: BoxDecoration(color: Colors.white),
                                child: Center(
                                  child: Text("Links "),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(
                      height: 10,
                      color: Colors.green,
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
