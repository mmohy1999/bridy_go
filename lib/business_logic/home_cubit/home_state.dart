part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class LoadingHomeState extends HomeState {}
class AppChangeBottomNavigationBarState extends HomeState {}
class LoadedWishListState extends HomeState {}

class LoadedHomeState extends HomeState {}


class HomeDataState extends HomeState {}

class CartPlusState extends HomeState {}
class CartMinusState extends HomeState {}
class CartRemoveState extends HomeState {}

class GetMessagesState extends HomeState {}
class MessagesSendState extends HomeState {}





