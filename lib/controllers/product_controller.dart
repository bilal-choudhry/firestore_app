import 'package:get/get.dart';

import '../models/product_model.dart';

class ProductController extends GetxController{
  List<Product> productData = [];
  List<Product> cartItem = List<Product>.empty().obs;
  addtoCart(Product item){
    cartItem.add(item);
  }
  double get totalPrice => cartItem.fold(0, (sum, item)=>sum+item.price);
  int get count => cartItem.length;
  fetchProductData()async {
    Future.delayed(Duration(seconds: 5));
    List<Product> serverResponse = [
      Product(id: 1,
          productName: "productName 1",
          productImage: "assets/images/shirt1.png",
          productDescription: "Black Half Sleeves Shirt",
          price: 499,
          favourite: false
      ),
      Product(id: 2,
          productName: "productName 2",
          productImage: "assets/images/shirt2.png",
          productDescription: "White Half Sleeves Shirt",
          price: 499,
          favourite: false
      ),
    ];
    productData.assignAll(serverResponse);

  }
  addtoFavourites(id){
    var index = productData.indexWhere((element) => element.id == id);
    productData[index].favourite = !productData[index].favourite;
    update();

  }

  @override
  void onInit() {
    super.onInit();
    fetchProductData();
  }
}