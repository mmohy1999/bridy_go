class Cart{
 late String title,image;
 late int  maxQty,minQty,qty,price,cartId, index;



 Cart.fromJson(Map<String,dynamic> json){
   title=json['name'];
   image=json['thumbnail'];
   qty=json['qty'];
   maxQty=json['max_qty'];
   minQty=json['min_qty'];
   price=json['dicounted_price'];
   cartId=json['cart_id'];
 }
}