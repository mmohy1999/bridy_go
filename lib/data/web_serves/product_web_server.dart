import 'package:bridy_go_user/constants/strings.dart';
import 'package:dio/dio.dart';

import '../dio_helper.dart';

class ProductWebServer{
  final DioHelper _dioHelper =DioHelper();


  Future getHome() async{
    Response response = await _dioHelper.dio.get('/home');
    return response.data;
  }

  Future searchProductByName({required String text,String sortBy='popular'}) async{
    Response response = await _dioHelper.dio.get('/product/search',
        queryParameters:{
          'keyword':text,
          'sort_by':sortBy,
        },
        options:Options(
          headers:{'Authorization':'Bearer ${mUser.token}'},
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },) );

    return response.data;
  }

  Future getProductsByCategorySlug({required String slug,String sortBy='popular',String page='1'}) async {
    Response response = await _dioHelper.dio.get('/product/search',
    queryParameters:{
      'category_slug':slug,
      'sort_by':sortBy,
      'page':page
    },
        options:Options(
          headers:{'Authorization':'Bearer ${mUser.token}'},
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },) );

    return response.data;
  }

  Future getProductBySlug(String slug) async {
    Response response = await _dioHelper.dio.get('/product/details/$slug',
        options:Options(
        headers:{'Authorization':'Bearer ${mUser.token}'}));
    return response.data;
  }

  Future getProductReviews(int id) async {
    Response response = await _dioHelper.dio.get('/product/reviews/$id');
    return response.data;
  }



    Future getProductsBySellerSlug(String slug) async {
    Response response = await _dioHelper.dio.get('/shop/$slug/home');

    return response.data;
  }

  //region wishList
  Future getWishListProduct() async{
    Response response =await _dioHelper.dio.get('/user/wishlists',
        options:Options(
          headers:{'Authorization':'Bearer ${mUser.token}'},
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },));
    return response.data;
  }

  Future addToWishListProduct(int id) async{
    Response response =await _dioHelper.dio.post('/user/wishlists',
        data: {
          'product_id':id
        },
        options:Options(
            headers:{'Authorization':'Bearer ${mUser.token}'},
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },));
    return response.data;
  }

  Future removeFromWishListProduct(int id) async{
    Response response =await _dioHelper.dio.delete('/user/wishlists/$id',
        options:Options(
          headers:{'Authorization':'Bearer ${mUser.token}'},
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          },));
    return response.data;
  }
  //endregion

//region cart
  Future getProductsCart() async{
    Response response = await _dioHelper.dio.post('/carts',options:Options(
        headers:{'Authorization':'Bearer ${mUser.token}'}));
    return response.data;
  }

  Future addProductToCart(int  variationId) async{
    Response response = await _dioHelper.dio.post('/carts/add',data: {
      'variation_id':variationId,
      'qty':1
    },options:Options(
        headers:{'Authorization':'Bearer ${mUser.token}'}));
    return response.data;

  }
  Future changeQty(int  id,String type) async{
    Response response = await _dioHelper.dio.post('/carts/add',data: {
      'cart_id':id,
      'type':type
    },options:Options(
        headers:{'Authorization':'Bearer ${mUser.token}'}));
    return response.data;

  }
  Future deleteCartProduct(int id) async{
    Response response = await _dioHelper.dio.post('/carts/destroy',data: {
      'cart_id':id,
    },options:Options(
        headers:{'Authorization':'Bearer ${mUser.token}'}));
    return response.data;
  }

//endregion
//region Chat

  Future allMessages() async{
    Response response = await _dioHelper.dio.get('/user/chats',options:Options(
        headers:{'Authorization':'Bearer ${mUser.token}'}));
    return response.data;
  }
  Future sendMessage(String message) async{
    Response response = await _dioHelper.dio.post('/user/chats/send',
        data: {
      'message':message
        }
        ,options:Options(
        headers:{'Authorization':'Bearer ${mUser.token}'}));
    return response.data;
  }

//endregion


}

