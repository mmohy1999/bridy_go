
import 'package:bridy_go_user/data/models/cart.dart';
import 'package:bridy_go_user/data/models/message.dart';
import 'package:bridy_go_user/data/models/review.dart';

import '../models/home_model.dart';
import '../models/product.dart';
import '../web_serves/product_web_server.dart';

class ProductRepository{
    final ProductWebServer _webServer;
    ProductRepository(this._webServer);

    Future<List<HomeModel>?> getHome() async {
      final response = await _webServer.getHome();

      if(response['success']){
        List<HomeModel> _list=[];
         response['data'].forEach((model){
           _list.add(HomeModel.fromJson(model));
         });
         return _list;
      }

      return null;
    }

    Future getProductsByCategorySlug({required String slug,String sortBy='popular',String page='1'}) async {
      final response = await _webServer.getProductsByCategorySlug(slug: slug,page: page,sortBy: sortBy);

      if(response['success']){
      List<Product> _products=[];
      response['products']['data'].forEach((model){
        _products.add(Product.fromJson(model));
      });
      return _products;
      }
        return null;
      }

    Future<Product?> getProductById(String slug) async {
      final response = await _webServer.getProductBySlug(slug);
      if(response['success']){
        Product product=Product.fromJson(response['data']);
        return product;

      }
      return null;
    }

    Future searchProductByName({required String text,String sortBy='popular'}) async {
      final response = await _webServer.searchProductByName(text: text);
      if(response['success']){
        List<Product> _products=[];
        response['products']['data'].forEach((model){
          _products.add(Product.fromJson(model));
        });
        return _products;
      }
    }
      Future getProductsBySellerSlug(String slug) async {
      final response = await _webServer.getProductsBySellerSlug(slug);
      if(response['success']){
        List<Product> _products=[];
        response['data']['best_selling_products']['data'].forEach((model){
          _products.add(Product.fromJson(model));
        });
        return _products;
      }
      return null;
    }
    Future<List<Review>> getProductReviews(int id) async {
      final response = await _webServer.getProductReviews(id);
      List<Review> _list=[];
      response['data'].forEach((model){
        _list.add(Review.fromJson(model));
      });
      return _list;
    }

    //region wishList
    Future<bool> addToWishListProduct(int id) async{
      final response = await _webServer.addToWishListProduct(id);
      return response['success'];
    }

    Future<bool> removeFromWishListProduct(int id) async{
      final response = await _webServer.removeFromWishListProduct(id);
      return response['success'];
    }

    Future<List<Product>?> getWishListProduct() async {
      final response =await _webServer.getWishListProduct();
      if(response['success']){
        List<Product> _products=[];
        response['data'].forEach((model){
          _products.add(Product.fromJson(model));
        });
        return _products;
      }
      return null;
    }
    //endregion
    //region cart
      Future<List<Cart>?> getProductsCart() async{
        final response = await _webServer.getProductsCart();
        if(response['success']&&response['cart_items']['data']!=null){
          List<Cart> _products=[];
          response['cart_items']['data'].forEach((model){
            _products.add(Cart.fromJson(model));
          });
          return _products;
        }
        return null;

      }

      Future<bool> addProductToCart(int  variationId) async{
        final response = await _webServer.addProductToCart(variationId);

        if(response['success']){
          return true;
        }

        return false;
      }
    Future<bool> changeQty(int  id,String type) async{
      final response = await _webServer.changeQty(id, type);

      if(response['success']){
        return true;
      }
      return false;
    }

    Future<bool> deleteCartProduct(int id) async {
      final response = await _webServer.deleteCartProduct(id);
      if(response['success']){
        return true;
      }
      return false;
    }
      //endregion

//region Chat
  Future<List<Message>?> allMessages() async {
    final response =await _webServer.allMessages();
    if(response['success']) {
      List<Message> _messages=[];
      response['data']['data'].forEach((model){
        _messages.add(Message.fromJson(model));
      });
      if(_messages.length<4) {
        for (int i = _messages.length; i <= 4; i++) {
          Message _message = Message(massage: '', time: '');
          _messages.add(_message);
        }
      }

      return _messages;
    }
    return null;

  }
  Future<Message?> sendMessage(String message) async {
    final response =await _webServer.sendMessage(message);
    if(response['success']){
      Message massage=Message.fromJson(response['data']);
      return massage;
    }
    return null;
  }

//endregion

}