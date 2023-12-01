import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../models/models.dart';

part 'person_state.dart';

class PersonCubit extends Cubit<PersonState> {
  PersonCubit() : super(PersonInitial());



  static PersonCubit get(context) => BlocProvider.of(context);

  int? personGender;
  int? personState;
  int? personEduc;
  int? personFather;
  int searchFaild = 5;
  Map<String, dynamic>  regionInfo = {}; //= await getRegionInfo(regionIdToQuery);
  //print('Number of streets in the region: ${regionInfo['numberOfStreets']}');
  //print('Total number of people in the region: ${regionInfo['totalPeopleInRegion']}');
  searchSelectedFaild(int faild) {
    searchFaild = faild;

    emit(SearchSelectedFaildSuccess());
  }

  personSelectedFather(int father) {
    personFather = father;
    emit(ChoseFatherrSuccs());
  }

  personSelectedGender(int gender) {
    personGender = gender;
    emit(ChoseGenderSuccs());
  }

  personSelectedState(int state) {
    personState = state;
    emit(ChoseStateSuccs());
  }

  personSelectedEduc(int educ) {
    personEduc = educ;
    emit(ChoseEducSuccs());
  }

  bool isShow = false;

  changePersonExpand(bool show) {
    isShow = !show;
    emit(ChanageExpandedSuccess());
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// method add
  Future<void> addPersonInformation(PersonInformation data) async {
    try {
      await FirebaseFirestore.instance
          .collection('regions')
          .doc(data.regionId)
          .collection('streets')
          .doc(data.streetId)
          .collection('Homes')
          .doc(data.homeName)
          .collection('famaily')
          .doc(data.personName)
          .set({
        'personName': data.personName, // personName , personID  , personWork ,personFather , personRelation, personEducation , personDateOfBarthday ,personState ,  personGender , personPhone , personAge , personDateOfBarthday ,
        'personID': data.personID,
        'personPhone': data.personPhone,
        'personAge': data.personAge,
        'personDateOfBarthday': data.personDateOfBarthday,
        'personGender': data.personGender,
        'personState': data.personState,
        'personEducation': data.personEducation,
        'personWork': data.personWork,
        'personRelation': data.personRelation,
        'personFather': data.personFather,
      });
      print('AddPersonInformationSuccess');
      emit(AddPersonInformationSuccess());
    } catch (error) {
      print('AddPersonInformationError $error');
      emit(AddPersonInformationError());
    }
  }

  ///        method update
  Future<void> updatePersonInformation(PersonInformation data) async {
    try {
      await FirebaseFirestore.instance
          .collection('regions')
          .doc(data.regionId)
          .collection('streets')
          .doc(data.streetId)
          .collection('Homes')
          .doc(data.homeName)
          .collection('famaily')
          .doc(data.personName)
          .update({
        'personID': data.personID,
        'personPhone': data.personPhone,
        'personAge': data.personAge,
        'personDateOfBarthday': data.personDateOfBarthday,
        'personGender': data.personGender,
        'personState': data.personState,
        'personEducation': data.personEducation,
        'personWork': data.personWork,
        'personRelation': data.personRelation,
        'personFather': data.personFather,
      });

      print('UpdatePersonInformationSuccess');
      emit(UpdatePersonInformationSuccess());
    } catch (error) {
      print('UpdatePersonInformationError $error');
      emit(UpdatePersonInformationError());
    }
  }

  /// method delete
  Future<void> deletePersonInformation(PersonInformationToDelete data) async {
    try {
      await FirebaseFirestore.instance
          .collection('regions')
          .doc(data.regionId)
          .collection('streets')
          .doc(data.streetId)
          .collection('Homes')
          .doc(data.homeName)
          .collection('famaily')
          .doc(data.personName)
          .delete();

      print('DeletePersonInformationSuccess');
      emit(DeletePersonInformationSuccess());
    } catch (error) {
      print('DeletePersonInformationError $error');
      emit(DeletePersonInformationError());
    }
  }

  ///  method search
  ///
  List<Map<String, dynamic>> searchResultsALl = [];

  Future<void> searchPersonInformation(
      {required int searchFaild, required dynamic searchTerm}) async {
    try {
      searchResultsALl = [];
      final snapshot = await FirebaseFirestore.instance
          .collectionGroup('famaily')
          .where(
        getSearchField(searchFaild) ,
        isEqualTo: searchTerm,
      )
          .get();
      final searchResults = snapshot.docs.map((doc) => doc.data()).toList();
      searchResultsALl = searchResults;
      print(
          '///////////////////////////////////////////////////////////////////SearchPersonInformationSuccess: $searchResults');
      emit(SearchPersonInformationSuccess());
    } catch (error) {
      print(
          '----------------------------------------------------------------SearchPersonInformationError $error');
      emit(SearchPersonInformationError());
    }
  }



}
String getSearchField(int searchFaild) {
  switch (searchFaild) {
    case 0:
      return 'personName';
    case 1:
      return 'personID';
    case 2:
      return 'personPhone';
    case 3:
      return 'personAge';
    case 4:
      return 'personWork';
    case 5:
      return 'personFather';
    default:
      return 'personEducation';
  }
}
