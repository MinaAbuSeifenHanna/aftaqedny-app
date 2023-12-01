part of 'street_cubit.dart';

@immutable
abstract class StreetState {}

class StreetInitial extends StreetState {}

class DataArriveSuccess extends StreetState {}
class DataArriveError extends StreetState {}

class StreetAddedSuccessfully extends StreetState {}
class ErrorAddedStreet extends StreetState {}
class StreetDeletedSuccessfully extends StreetState {}
class ErrorDeletingStreet extends StreetState {}


