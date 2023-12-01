part of 'homes_cubit.dart';

@immutable
abstract class HomesState {}

class HomesInitial extends HomesState {}
class HomeAddedSuccessfully extends HomesState {}
class ErrorAddedHome extends HomesState {}
class HomeDeletedSuccessfully extends HomesState {}
class ErrorDeletingHome extends HomesState {}
