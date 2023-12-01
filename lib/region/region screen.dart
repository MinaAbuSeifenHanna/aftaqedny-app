import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:valligeapp/person%20information/search%20screen/search%20screen.dart';
import 'package:valligeapp/region/update%20screen/update%20screen.dart';
import 'package:valligeapp/shard/resources/styles_manager.dart';
import '../region/add region screen.dart';
import '../shard/resources/color_manager.dart';
import '../shard/resources/strings_manager.dart';
import '../street/street screen.dart';
class RegionScreen extends StatelessWidget {
  const RegionScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.titleOfRegionScreen,
          style: whiteStyle(),
        ),
        actions: [

           
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              },
              icon: const Icon(Icons.search)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 12,
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('regions')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: SizedBox(
                          width: 80,
                          height: 80,
                          child: CircularProgressIndicator(
                            color: Colors.blue,
                            strokeWidth: 3,
                          )),
                    );
                  }
                  if (snapshot.hasError) {
                    return const Center(
                      child: SizedBox(
                          width: 150,
                          height: 150,
                          child: CircularProgressIndicator(
                            color: Colors.red,
                            strokeWidth: 5,
                          )),
                    );
                  }
                  final userSnapshot = snapshot.data?.docs;
                  if (userSnapshot!.isEmpty) {
                    return Center(
                      child: Card(
                        child: Text(
                          " لا توجد مناطق ",
                          style: blackStyle(),
                        ),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemBuilder: (BuildContext context, int index) =>
                        GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StreetScreen(
                                    regionName: userSnapshot[index]['name']
                                        .toString())));
                      },
                      onLongPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UpdateRegionScreen(
                                    regionName: userSnapshot[index]['name'])));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(colors: [
                              ColorManager.grdint_one,
                              ColorManager.grdint_two,
                              ColorManager.grdint_three
                            ]),
                          ),
                          child: Column(
                            children: [
                              Text(
                                userSnapshot[index]['name'].toString(),
                                textAlign: TextAlign.center,
                                style: blackStyle(),
                              ),
                              StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance.collection('regions')
                                      .doc(userSnapshot[index]['name']).collection('streets')
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState == ConnectionState.waiting) {
                                      return const Center(
                                        child: SizedBox(
                                            width: 80,
                                            height: 80,
                                            child: CircularProgressIndicator(
                                              color: Colors.blue,
                                              strokeWidth: 3,
                                            )),
                                      );
                                    }
                                    if (snapshot.hasError) {
                                      return const Center(
                                        child: SizedBox(
                                            width: 150,
                                            height: 150,
                                            child: CircularProgressIndicator(
                                              color: Colors.red,
                                              strokeWidth: 5,
                                            )),
                                      );
                                    }
                                    final userSnapshot = snapshot.data?.docs;
                                    if (userSnapshot!.isEmpty) {
                                      return Center(
                                        child: Card(
                                          child: Text(
                                            " لا توجد شوارع  ",
                                            style: dataInfoStyle(),
                                          ),
                                        ),
                                      );
                                    }
                                    return Card(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(userSnapshot.length.toString(),
                                            style: dataInfoStyle(),
                                          ),
                                        
                                          Text('  : عدد الشوارع',
                                            style: dataInfoStyle(),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ),
                    itemCount: userSnapshot.length,
                  );
                }),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(5.0),
              color: ColorManager.primary,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddRegionScreen()));
                  },
                  child: Text(
                    AppStrings.addNewRegion,
                    textAlign: TextAlign.right,
                    style: whiteStyle(),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
