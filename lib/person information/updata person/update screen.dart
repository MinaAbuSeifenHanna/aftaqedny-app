import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valligeapp/models/models.dart';
import 'package:valligeapp/person%20information/updata%20person/update%20person.dart';
import 'package:valligeapp/shard/resources/strings_manager.dart';
import 'package:valligeapp/shard/resources/styles_manager.dart';

import '../person cubit/person_cubit.dart';

class UpdatePersonScreen extends StatelessWidget {
  const UpdatePersonScreen(
      {super.key,
      required this.personName,
      required this.homeName,
      required this.regionId,
      required this.streetId
      });

  final String streetId;
  final String regionId;
  final String homeName;
  final String personName;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PersonCubit, PersonState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title:  Text(AppStrings.updatePerson,
              style: whiteStyle(),
              ),
            ) ,
            body: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                  alignment: Alignment.center,
                  child:  Text(
                    textDirection: TextDirection.rtl,
                    'تحديث البيانات  \n $personName',
                    style: blackStyle(),
                    textAlign: TextAlign.center,
                  )),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UpdatePersonOfFamily(
                               homeName: homeName,
                                  streetId: streetId,
                                  regionId: regionId,
                                  personName: personName,
                                )));
                      },
                      child: Text(
                        AppStrings.updatePerson,
                        textAlign: TextAlign.right,
                        style: whiteStyle(),
                      )),
                  ElevatedButton(
                      onPressed: ()
                      {
                        PersonCubit.get(context)
                            .deletePersonInformation(PersonInformationToDelete(streetId: streetId, regionId: regionId, homeName: homeName, personName: personName));
                       Navigator.of(context).pop();
                      },
                      child: Text(
                        AppStrings.deletePerson,
                        textAlign: TextAlign.right,
                        style: whiteStyle(),
                      )),
                ],
              ),
            ),
          );
        });
  }
}
