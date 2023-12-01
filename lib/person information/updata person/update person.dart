import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valligeapp/models/models.dart';
import 'package:valligeapp/person%20information/person%20cubit/person_cubit.dart';
import 'package:valligeapp/person%20information/person%20screen.dart';
import 'package:valligeapp/shard/resources/strings_manager.dart';
import 'package:valligeapp/shard/resources/styles_manager.dart';

import '../../shard/constant/constant.dart';
class UpdatePersonOfFamily extends StatelessWidget {
  const UpdatePersonOfFamily(
      {super.key, required this.regionId, required this.streetId, required this.homeName , required this.personName});
  final String streetId;
  final String regionId;
  final String homeName;
  final String personName ; /// new
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PersonCubit, PersonState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                AppStrings.updatePerson,
                style: whiteStyle(),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(children: [
                Text(
                  AppStrings.personName,
                  style: blackStyle(),
                ),
                personNameField(),
                Text(
                  AppStrings.personID,
                  style: blackStyle(),
                ),
                personIDField(),
                Text(
                  AppStrings.personPhone,
                  style: blackStyle(),
                ),
                personPhoneField(),
                Text(
                  AppStrings.personAge,
                  style: blackStyle(),
                ),
                personAgeField(),
                Text(
                  AppStrings.personBarthDay,
                  style: blackStyle(),
                ),
                personBarthDayField(),
                Text(
                  AppStrings.personType,
                  style: blackStyle(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Radio(
                      value: 0,
                      groupValue:  PersonCubit.get(context).personGender,
                      onChanged: (value) {
                        PersonCubit.get(context).personSelectedGender(value!);

                      },
                    ),
                    const Text(AppStrings.male),
                    const SizedBox(
                      width: 40,
                    ),
                    Radio(
                      value: 1,
                      groupValue:  PersonCubit.get(context).personGender,
                      onChanged: (value) {
                        PersonCubit.get(context).personSelectedGender(value!);
                      },
                    ),
                    const Text(AppStrings.female),
                  ],
                ),
                Text(
                  AppStrings.personState,
                  style: blackStyle(),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Radio(
                        value: 0,
                        groupValue: PersonCubit.get(context).personState,
                        onChanged: (value) {
                          PersonCubit.get(context).personSelectedState(value!);
                        },
                      ),
                      const Text(' متزوج / ه'),
                      Radio(
                        value: 1,
                        groupValue: PersonCubit.get(context).personState,
                        onChanged: (value) {
                          PersonCubit.get(context).personSelectedState(value!);
                        },
                      ),
                      const Text(' اعزب / ه'),
                      Radio(
                        value: 2,
                        groupValue: PersonCubit.get(context).personState,
                        onChanged: (value) {
                          PersonCubit.get(context).personSelectedState(value!);
                        },
                      ),
                      const Text('ارمل /ه'),
                    ],
                  ),
                ),
                Text(
                  AppStrings.personEduc,
                  style: blackStyle(),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Radio(
                        value: 8,
                        groupValue: PersonCubit.get(context).personEduc,
                        onChanged: (value) {
                          PersonCubit.get(context).personSelectedEduc(value!);
                        },
                      ),
                      const Text('تحت حضانة'),
                      Radio(
                        value: 0,
                        groupValue: PersonCubit.get(context).personEduc,
                        onChanged: (value) {
                          PersonCubit.get(context).personSelectedEduc(value!);
                        },
                      ),
                      const Text('حضانة'),
                      Radio(
                        value: 1,
                        groupValue: PersonCubit.get(context).personEduc,
                        onChanged: (value) {
                          PersonCubit.get(context).personSelectedEduc(value!);

                        },
                      ),
                      const Text('المرحلة الابتدائية'),
                      Radio(
                        value: 2,
                        groupValue: PersonCubit.get(context).personEduc,
                        onChanged: (value) {
                          PersonCubit.get(context).personSelectedEduc(value!);

                        },
                      ),
                      const Text('المرحلة الاعدادية'),
                      Radio(
                        value: 3,
                        groupValue: PersonCubit.get(context).personEduc,
                        onChanged: (value) {
                          PersonCubit.get(context).personSelectedEduc(value!);

                        },
                      ),
                      const Text('المرحلة الثانوية'),
                      Radio(
                        value: 4,
                        groupValue: PersonCubit.get(context).personEduc,
                        onChanged: (value) {
                          PersonCubit.get(context).personSelectedEduc(value!);

                        },
                      ),
                      const Text('تعليم فني '),
                      Radio(
                        value: 5,
                        groupValue: PersonCubit.get(context).personEduc,
                        onChanged: (value) {
                          PersonCubit.get(context).personSelectedEduc(value!);

                        },
                      ),
                      const Text('خريج فني '),
                      Radio(
                        value: 6,
                        groupValue: PersonCubit.get(context).personEduc,
                        onChanged: (value) {
                          PersonCubit.get(context).personSelectedEduc(value!);

                        },
                      ),
                      const Text('المرحلة الجامعيه'),
                      Radio(
                        value: 7,
                        groupValue: PersonCubit.get(context).personEduc,
                        onChanged: (value) {
                          PersonCubit.get(context).personSelectedEduc(value!);
                        },
                      ),
                      const Text('خريج'),
                      Radio(
                        value: 9,
                        groupValue: PersonCubit.get(context).personEduc,
                        onChanged: (value) {
                          PersonCubit.get(context).personSelectedEduc(value!);
                        },
                      ),
                      const Text('فلاح'),
                    ],
                  ),
                ),
                Text(
                  AppStrings.personwork,
                  style: blackStyle(),
                ),
                personWorkField(),
                Text(
                  AppStrings.personRelation,
                  style: blackStyle(),
                ),
                personRelationField(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Radio(
                        value: 0,
                        groupValue: PersonCubit.get(context).personFather,
                        onChanged: (value) {
                          PersonCubit.get(context).personSelectedFather(value!);
                        },
                      ),
                      const Text('ابونا ابراهيم'),
                      Radio(
                        value: 1,
                        groupValue: PersonCubit.get(context).personFather,
                        onChanged: (value) {
                          PersonCubit.get(context).personSelectedFather(value!);
                        },
                      ),
                      const Text('ابونا يوسف'),
                      Radio(
                        value: 2,
                        groupValue: PersonCubit.get(context).personFather,
                        onChanged: (value) {
                          PersonCubit.get(context).personSelectedFather(value!);

                        },
                      ),
                      const Text('ابونا ارميا'),
                      Radio(
                        value: 3,
                        groupValue: PersonCubit.get(context).personFather,
                        onChanged: (value) {
                          PersonCubit.get(context).personSelectedFather(value!);

                        },
                      ),
                      const Text('ابونا جبرائيل'),
                      Radio(
                        value: 4,
                        groupValue: PersonCubit.get(context).personFather,
                        onChanged: (value) {
                          PersonCubit.get(context).personSelectedFather(value!);

                        },
                      ),
                      const Text('ابونا غبريال'),
                      Radio(
                        value: 5,
                        groupValue: PersonCubit.get(context).personFather,
                        onChanged: (value) {
                          PersonCubit.get(context).personSelectedFather(value!);

                        },
                      ),
                      const Text('ابونا سوريال '),
                      Radio(
                        value: 6,
                        groupValue: PersonCubit.get(context).personFather,
                        onChanged: (value) {
                          PersonCubit.get(context).personSelectedFather(value!);

                        },
                      ),
                      const Text('ابونا شاروبيم '),
                      Radio(
                        value: 7,
                        groupValue: PersonCubit.get(context).personFather,
                        onChanged: (value) {
                          PersonCubit.get(context).personSelectedFather(value!);

                        },
                      ),
                      const Text('ابونا ديسقورس'),
                      Radio(
                        value: 8,
                        groupValue: PersonCubit.get(context).personFather,
                        onChanged: (value) {
                          PersonCubit.get(context).personSelectedFather(value!);
                        },
                      ),
                      const Text('ابونا اغاثون'),
                      Radio(
                        value: 9,
                        groupValue: PersonCubit.get(context).personFather,
                        onChanged: (value) {
                          PersonCubit.get(context).personSelectedFather(value!);
                        },
                      ),
                      const Text('ابونا شنودة'),

                    ],
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                            (states) => Colors.blue),
                  ),
                  onPressed: () {
                    PersonCubit.get(context)
                        .updatePersonInformation(PersonInformation(
                        personAge: personAgeController.text,
                        streetId: streetId,
                        regionId: regionId,
                        homeName: homeName ,
                        personDateOfBarthday: personBarthDayController.text,
                        personEducation: PersonCubit.get(context).personEduc!,
                        personGender: PersonCubit.get(context).personGender!,
                        personID: personIDController.text,
                        personName: personName, /// this new
                        personPhone: personPhoneController.text,
                        personState: PersonCubit.get(context).personState!,
                        personWork: personWorkController.text,
                        personRelation: personRelationController.text,
                        personFather: PersonCubit.get(context).personFather!,

                    ));
                    personAgeController.clear();
                    personBarthDayController.clear();
                    PersonCubit.get(context).personEduc = null ;
                    PersonCubit.get(context).personGender = null ;
                    personIDController.clear() ;
                    personNameController.clear();
                    personPhoneController.clear();
                    PersonCubit.get(context).personState = null ;
                    personWorkController.clear() ;
                    personRelationController.clear();
                    PersonCubit.get(context).personFather = null ;
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context)=> PersonScreen(
                          regionName: regionId,
                          streetName: streetId,
                          homeName: homeName))
                    );
                    print('Pavly update father ');
                  },
                  child: const Text(AppStrings.update),
                ),
              ]),
            ),
          );
        });
  }
}
