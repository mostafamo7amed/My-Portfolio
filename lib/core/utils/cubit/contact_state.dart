part of 'contact_cubit.dart';

sealed class ContactState {}

final class ContactInitial extends ContactState {}

final class ContactSuccess extends ContactState {}

final class ContactError extends ContactState {}

final class ContactLoading extends ContactState {}
