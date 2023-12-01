import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valligeapp/shard/resources/strings_manager.dart';
import 'package:valligeapp/shard/resources/styles_manager.dart';
import 'package:valligeapp/street/street%20cubit/street_cubit.dart';
import 'package:valligeapp/street/update%20screen/update%20screen.dart';
import '../../shard/resources/color_manager.dart';
import '../../street/add street.dart';
import '../homes/homes screen.dart';

class StreetScreen extends StatelessWidget {
  const StreetScreen({super.key, required this.regionName});

  final String regionName;

  @override
  Widget build(BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                regionName,
                style: whiteStyle(),
                textAlign: TextAlign.right,
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
                        if (userSnapshot!.isEmpty) {
                          return Center(child:  Align(
                            alignment: Alignment.center,
                            child: Card(
                              color: Colors.grey,
                              child: Text(" لا توجد شوارع في \n$regionName" ,
                                 textAlign: TextAlign.center,
                                 style: blackStyle(),

                              ),
                            ),
                          ));
                        }
                        return ListView.builder(
                          itemBuilder: (BuildContext context, int index) =>
                              GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HomesScreen(
                                              streetName:userSnapshot[index]['name'].toString(),
                                              regionName: regionName,
                                          )
                                  )
                              );
                            },
                                onLongPress: (){
                                 Navigator.push(context,
                                 MaterialPageRoute(builder: (context)=> UpdateStreetScreen(streetName: userSnapshot[index]['name'], regionName: regionName,))
                                 );
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
                                            .doc(regionName).collection('streets').doc(userSnapshot[index]['name'])
                                            .collection('Homes')
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
                                                color: Colors.grey,
                                                child: Text(
                                                  " لا توجد منازل  ",
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

                                                Text('  : عدد المنازل',
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
                                builder: (context) =>
                                    AddStreetScreen(regionName: regionName)));
                      },
                      child: Text(
                        AppStrings.addNewStreet,
                        textAlign: TextAlign.right,
                        style: whiteStyle(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        
  }
}
