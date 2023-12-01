import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/models.dart';
part 'street_state.dart';

class StreetCubit extends Cubit<StreetState> {
  StreetCubit() : super(StreetInitial());
  static StreetCubit get(context) => BlocProvider.of(context);
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addStreet(Streets  street ) async {
    try {
      await FirebaseFirestore.instance
          .collection('regions')
          .doc(street.regionId)
          .collection('streets')
          .doc(street.nameStreet)
          .set({'name': street.nameStreet});
      print('StreetAddedSuccessfully');
      emit(StreetAddedSuccessfully());
    } catch (error) {
      print('StreetAddedRegion $error');
      emit(ErrorAddedStreet());
    }
  }
  Future<void> deleteStreet(String regionId, String streetName) async {
    try {
      final docRef = FirebaseFirestore.instance
          .collection('regions')
          .doc(regionId)
          .collection('streets')
          .doc(streetName);
      await docRef.delete();

      print('StreetDeletedSuccessfully');
      emit(StreetDeletedSuccessfully());
    } catch (error) {
      print('ErrorDeletingStreet $error');
      emit(ErrorDeletingStreet());
    }
  }

}
