import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rivercounter/model/sampleModel.dart';

import '../model/DataProvider/dataProvider.dart';

class SecondScreen extends ConsumerWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _data = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Second Screen",
          style: TextStyle(color: Colors.blue),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
      ),
      body: _data.when(
          data: (_data) {
            List<Sample> userList = _data.map((e) => e).toList();
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: userList.length,
                          itemBuilder: (_, index) {
                            return Card(
                              color: Colors.grey,
                              elevation: 0,
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: ListTile(
                                title: Text(
                                  userList[index].title.toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                                subtitle: Text(
                                  userList[index].id.toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                                trailing: Text(
                                    userList[index].description.toString(),
                                    style: TextStyle(color: Colors.white)),
                              ),
                            );
                          }))
                ],
              ),
            );
          },
          error: (err, s) {
            Text(err.toString());
          },
          loading: () => Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
