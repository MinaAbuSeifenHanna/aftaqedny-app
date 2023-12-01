import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/models.dart';
part 'region state.dart';

class RegionCubit extends Cubit<RegionState> {
  RegionCubit() : super(HomeInitial());

  static RegionCubit get(context) => BlocProvider.of(context);
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addRegion(Region region) async {
    try {
      await FirebaseFirestore.instance
          .collection('regions')
          .doc(region.nameRegion)
          .set({'name': region.nameRegion});
      print('RegionAddedSuccessfully');
      emit(RegionAddedSuccessfully());
    } catch (error) {
      print('ErrorAddedRegion $error');
      emit(ErrorAddedRegion());
    }
  }

  Future<void> deleteRegion(String documentId) async {
    try {
      final docRef = FirebaseFirestore.instance.collection('regions').doc(documentId);
      await docRef.delete();

      print('RegionDeletedSuccessfully');
      emit(RegionDeletedSuccessfully());
    } catch (error) {
      print('ErrorDeletingRegion $error');
      emit(ErrorDeletingRegion());
    }
  }
/*
  Future<void> updateDocumentId(String currentId, String newId) async {
    try {
      final oldDocRef = FirebaseFirestore.instance.collection('regions').doc(currentId);
      final oldDocSnapshot = await oldDocRef.get();

      if (oldDocSnapshot.exists) {
        final data = oldDocSnapshot.data();

        // Create a new document with the new ID
        final newDocRef = FirebaseFirestore.instance.collection('regions').doc(newId);
        await newDocRef.set(data!);

        // Delete the old document
        await oldDocRef.delete();

        print('DocumentIdUpdatedSuccessfully');
        emit(DocumentIdUpdatedSuccessfully());
      } else {
        throw Exception('Document not found');
      }
    } catch (error) {
      print('ErrorUpdatingDocumentId $error');
      emit(ErrorUpdatingDocumentId());
    }
  }

  Future<void> updateRegionName(Region oldRegion, String newName) async {
    try {
      await FirebaseFirestore.instance
          .collection('regions')
          .doc(oldRegion.nameRegion)
          .update({'name': newName});
      print('RegionNameUpdatedSuccessfully');
      emit(RegionNameUpdatedSuccessfully());
    } catch (error) {
      print('ErrorUpdatingRegionName $error');
      emit(ErrorUpdatingRegionName());
    }
  }

 */


}
