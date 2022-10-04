import 'package:bridy_go_user/data/models/cart.dart';
import 'package:bridy_go_user/data/models/message.dart';
import 'package:bridy_go_user/presentation/screens/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/strings.dart';
import '../../data/models/home_model.dart';
import '../../data/models/product.dart';
import '../../data/repository/product_repository.dart';
import '../../data/web_serves/product_web_server.dart';
import '../../presentation/screens/Account/more.dart';
import '../../presentation/screens/cart/cart_screen.dart';
import '../../presentation/screens/home/categories_screen.dart';
import '../../presentation/screens/home/home_screen.dart';
import '../../presentation/screens/home/inbox_screen.dart';
import '../../presentation/screens/home/wish_list_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  //region filed
  final List<Widget> screens = [
    const HomeScreen(),
    const CategoriesScreen(),
     Chat(),
    const WishListScreen(),
     CartScreen()
  ];
  late ProductRepository _productRepository;
  late List<HomeModel> homeData=[];
  late  List<Product> wishListProducts=[];
  late List<Cart> cartList=[];
  late List<Message> messages=[];
  final formGlobalKey = GlobalKey<FormState>();
  final messageController = TextEditingController();

  //endregion

  static HomeCubit get(context)=>BlocProvider.of(context);

  HomeCubit() : super(HomeInitial()){
    emit(LoadingHomeState());
    _productRepository=ProductRepository(ProductWebServer());
  }


  Future getHomeData() async{
    emit(LoadingHomeState());
    _productRepository.getHome().then((value){
      homeData=value!;
      emit(LoadedHomeState());
    });
  }

  getCartData(){
    _productRepository.getProductsCart().then((value){
      cartList=value??[];
      emit(LoadedWishListState());

    });
  }
   onBottomNavigationTap(int index) {
    navBottomCurrentIndex = index;
    if(index==3){
      emit(LoadingHomeState());
      getWishListProduct();
    }
    if(homeData.isEmpty&&(index==2||index==1)){
     getHomeData();
    }
    if(index==4){
      emit(LoadingHomeState());
      getCartData();
    }
    if(index==2){
      emit(LoadingHomeState());
      getMessages();
    }
    emit(AppChangeBottomNavigationBarState());

  }

  changeCartQty(int index,int id , String type){
    if(type=='plus'&&cartList[index].qty>cartList[index].maxQty){
      _productRepository.changeQty(id, type).then((value){
        if(value){
          cartList[index].qty++;
          emit(CartPlusState());
        }
      });
    }else if(type=='minus'&&cartList[index].qty<cartList[index].minQty){
      _productRepository.changeQty(id, type).then((value){
        if(value){
          cartList[index].qty--;
          print('minus');
          emit(CartMinusState());
        }
      });
    }
  }
  deleteProduct(int index,int id){
    _productRepository.deleteCartProduct(id).then((value){
      if(value){
        cartList.removeAt(index);
        emit(CartRemoveState());
      }
    });
  }
  goToProductInfo(String slug,context){
    productSlug=slug;
    Navigator.pushNamed(context, productScreen);
  }

  categoryClick(int index,context){
    if(index==5) {
      navBottomCurrentIndex = 1;
      emit(AppChangeBottomNavigationBarState());
    }else{
      goToProductsScreen(homeData[index].category.slug,homeData[index].category.title,context);
    }
  }

  goToProductsScreen(String slug,String categoryTitle,context){
    categorySlug=slug;
    flagListScreen='category';
    titleListScreen=categoryTitle;
    Navigator.pushNamed(context, listProductsScreen);
  }

  getWishListProduct(){
    _productRepository.getWishListProduct().then((value){
      wishListProducts=value!;
      emit(LoadedWishListState());

    });
  }

  goToMorePage(context){
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => More()));
  }


  getMessages(){
    _productRepository.allMessages().then((value){
      if(value!=null){
        messages=value;
        messages.forEach((element) {
          print(element.toString());
        });
        emit(GetMessagesState());
      }
    });
  }

  sendMessage(){
    if (formGlobalKey.currentState!.validate()) {
      formGlobalKey.currentState!.save();
      _productRepository.sendMessage(messageController.text).then((value) {
        bool _flag=false;
        if(messages.length>4){
        for(int i=0;i<=4;i++){
          if(messages[i].massage==''){
            messages[i]=value!;
            _flag=true;
            break;
          }
        }}
        if(!_flag) {
          messages.add(value!);
        }
        messageController.text='';
        emit(MessagesSendState());
      });
    }
  }
}
