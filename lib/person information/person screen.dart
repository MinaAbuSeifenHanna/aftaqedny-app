import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valligeapp/person%20information/add%20person.dart';
import 'package:valligeapp/person%20information/person%20cubit/person_cubit.dart';
import 'package:valligeapp/person%20information/updata%20person/update%20screen.dart';
import 'package:valligeapp/shard/resources/styles_manager.dart';
import '../shard/resources/color_manager.dart';
import '../shard/resources/strings_manager.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen(
      {super.key,
      required this.regionName,
      required this.streetName,
      required this.homeName});

  final String regionName;
  final String streetName;
  final String homeName;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PersonCubit, PersonState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                homeName,
                style: whiteStyle(),
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
                          .doc(homeName)
                          .collection('famaily')
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
                          return Center(
                            child: Text(
                              "لا يوجد افراد ",
                              style: blackStyle(),
                            ),
                          );
                        }
                        return ListView.builder(
                          itemBuilder: (BuildContext context, int index) =>
                              Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                                onLongPress: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UpdatePersonScreen(
                                                  personName:
                                                      userSnapshot[index]
                                                              ['personName']
                                                          .toString(),
                                                  homeName: homeName,
                                                  regionId: regionName,
                                                  streetId: streetName)));
                                },
                                child: ExpansionPanelList.radio(
                                  elevation: 3,
                                  expandIconColor: Colors.blue,
                                  children: [
                                    ExpansionPanelRadio(
                                      value: index,
                                      headerBuilder: (BuildContext context,
                                          bool isExpanded) {
                                        return Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            textDirection: TextDirection.rtl,
                                            userSnapshot[index]['personName']
                                                .toString(),
                                            textAlign: TextAlign.left,
                                            style: dataInfoStyle(),
                                          ),
                                        );
                                      },
                                      body: Container(
                                        padding: const EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                          color: Colors.black12,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            DataTable(
                                              headingRowHeight: 40,
                                              dataRowMinHeight: 30,
                                              dataRowMaxHeight: 65,
                                              border: TableBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                horizontalInside:
                                                    const BorderSide(
                                                  width: double.infinity,
                                                  color: Colors.grey,
                                                  strokeAlign: 1,
                                                  style: BorderStyle.solid,
                                                ),
                                                verticalInside:
                                                    const BorderSide(
                                                  color: Colors.grey,
                                                  strokeAlign: 1,
                                                  style: BorderStyle.solid,
                                                ),
                                              ),
                                              //  columnSpacing: double.infinity,
                                              //  dividerThickness: 3,
                                              dataTextStyle: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                              ),

                                              headingTextStyle: const TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25,
                                              ),
                                              columns: const [
                                                DataColumn(
                                                  label: Text('البيانات'),
                                                  numeric: false,
                                                ),
                                                DataColumn(
                                                  label: Text('الفرد'),
                                                  numeric: true,
                                                ),
                                              ],
                                              rows: [
                                                DataRow(cells: [
                                                  DataCell(
                                                    Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Text(
                                                        userSnapshot[index]
                                                                ['personID']
                                                            .toString(),
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: dataInfoStyle(),
                                                      ),
                                                    ),
                                                  ),
                                                  DataCell(Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Text(
                                                        textDirection:
                                                            TextDirection.rtl,
                                                        'الرقم القومي',
                                                        style: dataStyle(),
                                                      ))),
                                                ]),
                                                DataRow(cells: [
                                                  DataCell(
                                                    Text(
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      userSnapshot[index]
                                                              ['personPhone']
                                                          .toString(),
                                                      style: dataInfoStyle(),
                                                    ),
                                                  ),
                                                  DataCell(Text(
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    'رقم الموبايل',
                                                    style: dataStyle(),
                                                  )),
                                                ]),
                                                DataRow(cells: [
                                                  DataCell(
                                                    Text(
                                                      userSnapshot[index]
                                                              ['personAge']
                                                          .toString(),
                                                      textAlign: TextAlign.left,
                                                      style: dataInfoStyle(),
                                                    ),
                                                  ),
                                                  DataCell(Text(
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    'السن',
                                                    style: dataStyle(),
                                                  )),
                                                ]),
                                                DataRow(cells: [
                                                  DataCell(
                                                    Text(
                                                      userSnapshot[index][
                                                              'personDateOfBarthday']
                                                          .toString(),
                                                      textAlign: TextAlign.left,
                                                      style: dataInfoStyle(),
                                                    ),
                                                  ),
                                                  DataCell(Text(
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    'عيد الميلاد',
                                                    style: dataStyle(),
                                                  )),
                                                ]),
                                                DataRow(cells: [
                                                  DataCell(
                                                    Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Text(
                                                        userSnapshot[index][
                                                                    'personGender'] ==
                                                                0
                                                            ? 'ذكر'
                                                            : "انثي",
                                                        textDirection:
                                                            TextDirection.rtl,
                                                        textAlign:
                                                            TextAlign.right,
                                                        style: dataInfoStyle(),
                                                      ),
                                                    ),
                                                  ),
                                                  DataCell(Text(
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    'النوع',
                                                    style: dataStyle(),
                                                  )),
                                                ]),
                                                DataRow(cells: [
                                                  DataCell(
                                                    Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Text(
                                                        userSnapshot[index][
                                                                    'personState'] ==
                                                                0
                                                            ? 'متزوج'
                                                            : userSnapshot[index]
                                                                        [
                                                                        'personState'] ==
                                                                    1
                                                                ? 'اعزب'
                                                                : 'ارمل',
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: dataInfoStyle(),
                                                      ),
                                                    ),
                                                  ),
                                                  DataCell(Text(
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    'الحالة',
                                                    style: dataStyle(),
                                                  )),
                                                ]),
                                                DataRow(cells: [
                                                  DataCell(
                                                    Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Text(
                                                        userSnapshot[index][
                                                                    'personEducation'] ==
                                                                0
                                                            ? ' حضانة'
                                                            : userSnapshot[index]
                                                                        [
                                                                        'personEducation'] ==
                                                                    1
                                                                ? 'المرحلة الابتدائية '
                                                                : userSnapshot[index]
                                                                            [
                                                                            'personEducation'] ==
                                                                        2
                                                                    ? 'المرحلة الاعداديه'
                                                                    : userSnapshot[index]['personEducation'] ==
                                                                            3
                                                                        ? ' المرحلة الثانوية'
                                                                        : userSnapshot[index]['personEducation'] ==
                                                                                4
                                                                            ? ' تعليم فني'
                                                                            : userSnapshot[index]['personEducation'] == 5
                                                                                ? 'خريج فني '
                                                                                : userSnapshot[index]['personEducation'] == 6
                                                                                    ? 'المرحلة الجامعية'
                                                                                    : userSnapshot[index]['personEducation'] == 7
                                                                                        ? ' خريج'
                                                                                        : userSnapshot[index]['personEducation'] == 8
                                                                                            ? ' بيبي'
                                                                                            : ' فلاح',
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: dataInfoStyle(),
                                                      ),
                                                    ),
                                                  ),
                                                  DataCell(Text(
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    'المرحلة التعليمية',
                                                    style: dataStyle(),
                                                  )),
                                                ]),
                                                DataRow(cells: [
                                                  DataCell(
                                                    Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Text(
                                                        userSnapshot[index]
                                                                ['personWork']
                                                            .toString(),
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: dataInfoStyle(),
                                                      ),
                                                    ),
                                                  ),
                                                  DataCell(Text(
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    'الوظيفة',
                                                    style: dataStyle(),
                                                  )),
                                                ]),
                                                DataRow(cells: [
                                                  DataCell(
                                                    Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Text(
                                                        userSnapshot[index][
                                                                'personRelation']
                                                            .toString(),
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: dataInfoStyle(),
                                                      ),
                                                    ),
                                                  ),
                                                  DataCell(Text(
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    'العلاقة',
                                                    style: dataStyle(),
                                                  )),
                                                ]),
                                                DataRow(cells: [
                                                  DataCell(
                                                    Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Text(
                                                        userSnapshot[index][
                                                                    'personFather'] ==
                                                                0
                                                            ? ' ابونا ابراهيم'
                                                            : userSnapshot[index]
                                                                        [
                                                                        'personFather'] ==
                                                                    1
                                                                ? 'ابونا يوسف '
                                                                : userSnapshot[index]
                                                                            [
                                                                            'personFather'] ==
                                                                        2
                                                                    ? 'ابونا ارميا'
                                                                    : userSnapshot[index]['personFather'] ==
                                                                            3
                                                                        ? ' ابونا جبرائيل'
                                                                        : userSnapshot[index]['personFather'] ==
                                                                                4
                                                                            ? 'ابونا غبريال'
                                                                            : userSnapshot[index]['personFather'] == 5
                                                                                ? 'ابونا سوريال '
                                                                                : userSnapshot[index]['personFather'] == 6
                                                                                    ? 'ابونا شاروبيم'
                                                                                    : userSnapshot[index]['personFather'] == 7
                                                                                        ? ' ابونا ديسقورس'
                                                                                        : userSnapshot[index]['personFather'] == 8
                                                                                            ? ' ابونا اغاثون'
                                                                                            : ' ابونا شنودة',
                                                        textAlign:
                                                            TextAlign.left,
                                                        style: dataInfoStyle(),
                                                      ),
                                                    ),
                                                  ),
                                                  DataCell(Text(
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    ' اب الاعتراف',
                                                    style: dataStyle(),
                                                  )),
                                                ]),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                )),
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
                                  builder: (context) => AddPersonOfFamily(
                                        regionId: regionName,
                                        streetId: streetName,
                                        homeName: homeName,
                                      )));
                        },
                        child: Text(
                          AppStrings.addPersonInFamaily,
                          textAlign: TextAlign.right,
                          style: whiteStyle(),
                        )),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
