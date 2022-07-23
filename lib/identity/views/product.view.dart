import 'package:flutter/material.dart'; 
import '../models/product.dart';
import '../services/product.service.dart'; 


class ProductView extends StatefulWidget{
  const ProductView({Key? key}) : super(key: key);
   @override
   _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<ProductView>{

  List<Product> listProduct=[];
  ProductService productService =  ProductService();

  @override
  void initState() {
    productService.getAll().then((response) {
      setState(() {

        print("test set state");
        listProduct = response;
      });
    });

    super.initState();
  }

    @override
    Widget build(BuildContext context) {

      return Scaffold(
          appBar: AppBar(
              title: const Text('Products'),),
              body: ListView.builder(
                  itemCount: listProduct.length,
                  itemBuilder:(context, index){
                    Product item = listProduct[index]; 
                    return Card(child: ListTile(
                      title: Text(item.name),
                      trailing: Row(
                          mainAxisSize: MainAxisSize.min, 
                        ),
                      onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => PageDetails(index),));
                      },
                    ), 
                    
                  );
                },
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, 'create');
          },
        child: const Icon(Icons.add),
        ),
    );
    }
}





























