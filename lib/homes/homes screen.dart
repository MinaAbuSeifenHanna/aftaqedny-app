import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:valligeapp/homes/add%20home.dart';
import 'package:valligeapp/homes/update%20screen.dart';
import 'package:valligeapp/person%20information/person%20screen.dart';
import 'package:valligeapp/shard/resources/styles_manager.dart';
import '../shard/resources/color_manager.dart';
import '../shard/resources/strings_manager.dart';

class HomesScreen extends StatelessWidget {
  const HomesScreen({super.key , required this.streetName , required this.regionName});
  final String regionName;
  final String streetName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          streetName,
          style:  whiteStyle(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 12,
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('regions')
                    .doc(regionName)
                    .collection('streets')
                    .doc(streetName)
                    .collection('Homes')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState ==
                      ConnectionState.waiting) {
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
                  if (userSnapshot!.isEmpty)
                  {
                    return  Center(child:  Align(
                      alignment: Alignment.center,
                      child: Card(
                        color: Colors.grey,
                        child: Text(" لا توجد منازل في \n$streetName" ,
                          textAlign: TextAlign.center,
                          style: blackStyle(),
                        ),
                      ),
                    ));
                  }
                  return ListView.builder(
                    itemBuilder: (BuildContext context, int index) =>
                        GestureDetector(
                          onLongPress: (){
                            Navigator.push(context,
                            MaterialPageRoute(builder: (_)=> UpdateHomeScreen(
                             regionName: regionName,
                              streetName: streetName,
                            homeName:  userSnapshot[index]['name']
                            )));
                          },
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PersonScreen(
                                               regionName: regionName,
                                                streetName: streetName,
                                                homeName: userSnapshot[index]['name']
                                                .toString())));
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
                                  ColorManager.white,
                                  ColorManager.darkPrimary,

                                ]),
                              ),
                              child:  Column(
                                children: [
                                  Text(
                                    userSnapshot[index]['name'].toString(),
                                    textAlign: TextAlign.center,
                                    style: blackStyle(),
                                  ),
                                  StreamBuilder<QuerySnapshot>(
                                      stream: FirebaseFirestore.instance.collection('regions')
                                          .doc(regionName).collection('streets').doc(streetName)
                                          .collection('Homes').doc(userSnapshot[index]['name']).collection('famaily')
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
                                                " لا يوجد افراد  ",
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

                                              Text('  : عدد الافراد ف المنزل',
                                                style: dataInfoStyle(),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                ],
                              ) ,
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
                            builder: (context) => AddHomeScreen(
                                regionName: regionName, streetName: streetName))
                            );
                  },
                  child: Text(
                    AppStrings.addNewHome,
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

