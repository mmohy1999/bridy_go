import 'package:bridy_go_user/constants/strings.dart';
import 'package:bridy_go_user/data/models/review.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../data/models/product.dart';
import '../../data/repository/product_repository.dart';
import '../../data/web_serves/product_web_server.dart';
import '../../presentation/screens/product/album.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  late ProductRepository _productRepository;
  late bool bookmarkedIcon;
  final _categorySlug=categorySlug;
  late List<Product> products=[];
  late List<Review>reviews=[];

  static ProductCubit get(context)=>BlocProvider.of(context);
  late Product product=Product.initial();
  ProductCubit() : super(ListViewInitial()){
    emit(LoadingState());
    _productRepository=ProductRepository(ProductWebServer());
  }

  getProductsByCategory(){
    _productRepository.getProductsByCategorySlug(slug:_categorySlug).then((value){
      products=value!;
      emit(LoadedListViewState());
    });
  }

  goToProductInfo(String slug,context){
    productSlug=slug;
    Navigator.pushNamed(context, productScreen);
    emit(LoadingState());
  }
  // String parseHtmlString(String htmlString) {
  //   String s=htmlString.replaceAll('<br>', '\n');
  //   s=s.replaceAll('<p>', ' ');
  //   s= s.replaceAll('</p>', ' ');
  //   return s;
  // }
  getProductDetails(){
    emit(LoadingState());
    _productRepository.getProductById(productSlug).then((value){
      bookmarkedIcon= value!.isSaved ?? false;
      product=value;
      if(value.reviewCount!=0){
        getReviews(value.id);
      }else{
        emit(LoadedLProductState());
      }
    });
  }

  onBookmarkTap(int id){
    if(bookmarkedIcon) {//remove
      removeFromWishList(id).then((value){
        bookmarkedIcon = !bookmarkedIcon;
        emit(BookmarkState());
      });
      emit(BookmarkState());
    }else{//add
      addToWishList(id).then((value){
        bookmarkedIcon = !bookmarkedIcon;
        emit(BookmarkState());
      });

    }
  }
  Future addToWishList(int id) async{
   return await  _productRepository.addToWishListProduct(id);
  }
  Future removeFromWishList(id) async{
    return await  _productRepository.removeFromWishListProduct(id);
  }

  getReviews(id){
    _productRepository.getProductReviews(id).then((value){
      reviews=value;
      emit(LoadedReviewsState());
    });
  }

  buyNow(id){
    _productRepository.addProductToCart(id).then((value){
      if(value){

        Fluttertoast.showToast(
            msg: 'product add to cart',fontSize: 16,
            gravity: ToastGravity.BOTTOM,backgroundColor: Colors.greenAccent,
        toastLength: Toast.LENGTH_SHORT ,);
      }
    });
  }
  goToSellerProducts(String slug,String sellerName,context){
    sellerSlug=slug;
    flagListScreen='seller';
    titleListScreen=sellerName;
    Navigator.pushNamed(context, listProductsScreen);
  }

  getProductsBySeller(){
    _productRepository.getProductsBySellerSlug(sellerSlug).then((value){
      products=value!;
      emit(LoadedListViewState());
    });
  }
  getProductsBySearch(){
    _productRepository.searchProductByName(text: titleListScreen).then((value){
      products=value!;
      emit(LoadedListViewState());
    });
  }

  goToAlbum(List<String> images,context){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Album(images)));

  }
}
