import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../models/models.dart';
part 'homes_state.dart';

class HomesCubit extends Cubit<HomesState> {
  HomesCubit() : super(HomesInitial());
  static HomesCubit get(context) => BlocProvider.of(context);


  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addhome(Homes  home  , ) async
  {
    try {
      await FirebaseFirestore.instance
          .collection('regions')
          .doc(home.regionId)
          .collection('streets')
          .doc(home.streetId)
         .collection('Homes')
         .doc(home.homeName)
          .set({'name': home.homeName});

      print('HomeAddedSuccessfully');
      emit(HomeAddedSuccessfully());
    } catch (error) {
      print('ErrorAddedHome $error');
      emit(ErrorAddedHome());
    }
  }
  Future<void> deleteHome(String regionId, String streetName , String homeName) async {
    try {
      final docRef = FirebaseFirestore.instance
          .collection('regions')
          .doc(regionId)
          .collection('streets')
          .doc(streetName)
         .collection('Homes')
         .doc(homeName);
      await docRef.delete();

      print('HomeDeletedSuccessfully');
      emit(HomeDeletedSuccessfully()); //
    } catch (error) {
      print('ErrorDeletingHome $error');
      emit(ErrorDeletingHome());
    }
  }

}

