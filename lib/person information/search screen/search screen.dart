import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valligeapp/shard/resources/strings_manager.dart';
import 'package:valligeapp/shard/resources/styles_manager.dart';
import '../../shard/constant/constant.dart';
import '../person cubit/person_cubit.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PersonCubit, PersonState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                AppStrings.searchPerson,
                style: whiteStyle(),
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(' البحث حسب ',
                          style: blackStyle(),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Radio(
                                value: 0,
                                groupValue: PersonCubit.get(context).searchFaild,
                                onChanged: (value) {
                                  PersonCubit.get(context).searchSelectedFaild(value!);
                                },
                              ),
                              const Text('الاسم'),
                              Radio(
                                value: 1,
                                groupValue: PersonCubit.get(context).searchFaild,
                                onChanged: (value) {
                                  PersonCubit.get(context).searchSelectedFaild(value!);
                                },
                              ),
                              const Text('الرقم القومي'),
                              Radio(
                                value: 2,
                                groupValue: PersonCubit.get(context).searchFaild,
                                onChanged: (value) {
                                  PersonCubit.get(context).searchSelectedFaild(value!);

                                },
                              ),
                              const Text('رقم الموبايل'),
                              Radio(
                                value: 3,
                                groupValue: PersonCubit.get(context).searchFaild,
                                onChanged: (value) {
                                  PersonCubit.get(context).searchSelectedFaild(value!);

                                },
                              ),
                              const Text('السن'),
                              Radio(
                                value: 4,
                                groupValue: PersonCubit.get(context).searchFaild,
                                onChanged: (value) {
                                  PersonCubit.get(context).searchSelectedFaild(value!);

                                },
                              ),
                              const Text('العمل '),
                              Radio(
                                value: 5,
                                groupValue: PersonCubit.get(context).searchFaild,
                                onChanged: (value) {
                                  PersonCubit.get(context).searchSelectedFaild(value!);

                                },
                              ),
                              const Text('اب الاعتراف '),      Radio(
                                value: 6,
                                groupValue: PersonCubit.get(context).searchFaild,
                                onChanged: (value) {
                                  PersonCubit.get(context).searchSelectedFaild(value!);

                                },
                              ),
                              const Text('المرحلة التعليمية'),

                            ],
                          ),
                        ),
                        searchPersonField(),
                        ElevatedButton(
                            onPressed: () {
                              PersonCubit.get(context)
                                  .searchPersonInformation(
                                searchFaild:  PersonCubit.get(context).searchFaild!,
                                searchTerm: PersonCubit.get(context).searchFaild! != 6 ? fatherCase(searchPersonController.text )
                                : eduCase(searchPersonController.text ),
                              );
                              searchPersonController.clear();
                              PersonCubit.get(context).searchResultsALl =  [];
                            },
                            child: Text(
                              PersonCubit.get(context).searchResultsALl.isEmpty
                              ?
                              AppStrings.searchPerson :
                              "مسح",
                              textAlign: TextAlign.right,
                              style: whiteStyle(),
                            )),





                      ],
                    )),
                Expanded(
                  flex: 12,
                  child: PersonCubit.get(context).searchResultsALl.isEmpty
                      ?  Center(child: Text('  ابحث عما تريد',
                  style: blackStyle(),))
                      : ListView.builder(
                        itemBuilder: (BuildContext context, int index) =>
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ExpansionPanelList.radio(
                                elevation: 3,
                                expandIconColor: Colors.blue,
                                children: [
                                  ExpansionPanelRadio(
                                    value: index,
                                    headerBuilder: (BuildContext context,
                                        bool isExpanded) {
                                      return Align(
                                        alignment:
                                        Alignment.centerRight,
                                        child: Text(
                                          textDirection: TextDirection.rtl,
                                          PersonCubit.get(context)
                                              .searchResultsALl[index]['personName']
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
                                                      PersonCubit.get(context)
                                                          .searchResultsALl[index]
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
                                                    PersonCubit.get(context)
                                                        .searchResultsALl[index]
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
                                                    PersonCubit.get(context)
                                                        .searchResultsALl[index]
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
                                                    PersonCubit.get(context)
                                                        .searchResultsALl[index][
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
                                                      PersonCubit.get(context)
                                                          .searchResultsALl[index][
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
                                                      PersonCubit.get(context)
                                                          .searchResultsALl[index][
                                                      'personState'] ==
                                                          0
                                                          ? 'متزوج'
                                                          : PersonCubit.get(context)
                                                          .searchResultsALl[index]
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
                                                      PersonCubit.get(context)
                                                          .searchResultsALl[index][
                                                      'personEducation'] ==
                                                          0
                                                          ? ' حضانة'
                                                          : PersonCubit.get(context)
                                                          .searchResultsALl[index]
                                                      [
                                                      'personEducation'] ==
                                                          1
                                                          ? 'المرحلة الابتدائية '
                                                          : PersonCubit.get(context)
                                                          .searchResultsALl[index]
                                                      [
                                                      'personEducation'] ==
                                                          2
                                                          ? 'المرحلة الاعداديه'
                                                          : PersonCubit.get(context)
                                                          .searchResultsALl[index]['personEducation'] ==
                                                          3
                                                          ? ' المرحلة الثانوية'
                                                          : PersonCubit.get(context)
                                                          .searchResultsALl[index]['personEducation'] ==
                                                          4
                                                          ? ' تعليم فني'
                                                          : PersonCubit.get(context)
                                                          .searchResultsALl[index]['personEducation'] == 5
                                                          ? 'خريج فني '
                                                          : PersonCubit.get(context)
                                                          .searchResultsALl[index]['personEducation'] == 6
                                                          ? 'المرحلة الجامعية'
                                                          : PersonCubit.get(context)
                                                          .searchResultsALl[index]['personEducation'] == 7
                                                          ? ' خريج'
                                                          : PersonCubit.get(context)
                                                          .searchResultsALl[index]['personEducation'] == 8
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
                                                      PersonCubit.get(context)
                                                          .searchResultsALl[index]
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
                                                      PersonCubit.get(context)
                                                          .searchResultsALl[index][
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
                                                      PersonCubit.get(context)
                                                          .searchResultsALl[index][
                                                      'personFather'] ==
                                                          0
                                                          ? ' ابونا ابراهيم'
                                                          : PersonCubit.get(context)
                                                          .searchResultsALl[index]
                                                      [
                                                      'personFather'] ==
                                                          1
                                                          ? 'ابونا يوسف '
                                                          : PersonCubit.get(context)
                                                          .searchResultsALl[index]
                                                      [
                                                      'personFather'] ==
                                                          2
                                                          ? 'ابونا ارميا'
                                                          : PersonCubit.get(context)
                                                          .searchResultsALl[index]['personFather'] ==
                                                          3
                                                          ? ' ابونا جبرائيل'
                                                          : PersonCubit.get(context)
                                                          .searchResultsALl[index]['personFather'] ==
                                                          4
                                                          ? 'ابونا غبريال'
                                                          : PersonCubit.get(context)
                                                          .searchResultsALl[index]['personFather'] == 5
                                                          ? 'ابونا سوريال '
                                                          : PersonCubit.get(context)
                                                          .searchResultsALl[index]['personFather'] == 6
                                                          ? 'ابونا شاروبيم'
                                                          : PersonCubit.get(context)
                                                          .searchResultsALl[index]['personFather'] == 7
                                                          ? ' ابونا ديسقورس'
                                                          : PersonCubit.get(context)
                                                          .searchResultsALl[index]['personFather'] == 8
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
                              ),
                            ),
                        itemCount: PersonCubit.get(context)
                            .searchResultsALl.length,
                      ),
                ),

              ],
            ),
          );
        });
  }
}

 dynamic fatherCase(String fatherName)
{
    switch (fatherName) {
      case 'ابونا ابراهيم':
        return 0;
      case 'ابونا يوسف':
        return 1;
      case 'ابونا ارميا':
        return 2;
      case 'ابونا جبرائيل':
        return 3;
      case 'ابونا غبريال':
        return 4;
      case 'ابونا سوريال':
        return 5;
      case 'ابونا شاروبيم':
        return 6;
      case 'ابونا ديسقورس':
        return 7;
      case 'ابونا اغاثون':
        return 8;
      case 'ابونا شنودة':
        return 9;
      default:
        return fatherName; // Or any other value to indicate no match.
    }
  }
dynamic eduCase(String edu)
{
  switch (edu) {
    case 'حضانة':
      return 0;
    case 'لمرحلة الابتدائية':
      return 1;
    case 'المرحلة الاعدادية':
      return 2;
    case 'لمرحلة الثانوية':
      return 3;
    case 'تعليم فني':
      return 4;
    case 'خريج فني':
      return 5;
    case 'المرحلة الجامعية':
      return 6;
    case 'خريج':
      return 7;
    case 'تحت حضانة':
      return 8;
    case 'فلاح':
      return 9;
    default:
      return -1; // Or any other value to indicate no match.
  }
}



