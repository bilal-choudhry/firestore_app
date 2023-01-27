import 'package:flutter/material.dart';
import 'package:custom_utils/custom_utils.dart';
import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class HomePageScreen extends StatelessWidget {
  var controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .primaryColor,
      appBar: AppBar(
        title: Text("All Products List"),
        centerTitle: true,
        actions: [
          ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add_shopping_cart_outlined),
              label:  Obx(()=>Text(controller.count.toString())),
              ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: GetBuilder<ProductController>(builder: (controller) =>
                  ListView.builder(
                    itemCount: controller.productData.length,
                    itemBuilder: (context, index) =>
                        Container(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Theme
                                      .of(context)
                                      .primaryColor, width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            elevation: 5,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                    height: 120,
                                    width: double.infinity,
                                    child: Image.asset(
                                      controller.productData[index]
                                          .productImage,
                                      fit: BoxFit.contain,
                                    )),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    children: [
                                      Text(controller.productData[index]
                                          .productName, style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                      IconButton(onPressed: () {
                                        controller.addtoFavourites(
                                            controller.productData[index].id);
                                      }, icon: Icon(
                                        controller.productData[index].favourite
                                            ?
                                        Icons.favorite_border
                                            :
                                        Icons.favorite

                                       ,
                                        color: Colors.red,
                                      ))
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Text(
                                        "Price : ${controller.productData[index]
                                            .price
                                        }", style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),),
                                      ElevatedButton(onPressed: () {
                                        controller.addtoCart(
                                            controller.productData[index]);
                                      }, child: Text("Add to Cart"))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                  ))
          ),
          SizedBox(
            height: 10,
          ),
           Obx(()=>Text("Total Amount : ${controller.totalPrice}",
             style: TextStyle(fontSize: 20, color: Colors.white),))
          ,
          SizedBox(height: 20,)],

      ),
    );
  }
}
