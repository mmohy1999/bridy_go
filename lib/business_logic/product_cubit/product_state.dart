part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ListViewInitial extends ProductState {}
class LoadedListViewState extends ProductState {}
class LoadingState extends ProductState {}
class LoadedLProductState extends ProductState {}
class BookmarkState extends ProductState {}
class AlbumState extends ProductState {}

class LoadingReviewsState extends ProductState {}
class LoadedReviewsState extends ProductState {}



