import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_market/pages/home.dart';
import 'package:e_market/pages/cart.dart';
import 'package:e_market/componets/products.dart';

class ProductDetails extends StatelessWidget {
  final String productName;
  final String productPrice;
  final String productOldPrice;
  final String productPicture;

  ProductDetails({
    required this.productName,
    required this.productOldPrice,
    required this.productPicture,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        centerTitle: true,
        title: InkWell(
          child: Text('E-Market'),
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => HomePage(),
            //   ),
            // );
          },
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Cart(),
                ),
              );
            },
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.white,
            height: 300,
            child: Hero(
              tag: productName,
              child: GridTile(
                child: Image.asset(
                  productPicture,
                  fit: BoxFit.contain,
                ),
                footer: Container(
                  color: Colors.white54,
                  child: ListTile(
                    leading: Text(
                      productName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    title: Row(
                      children: <Widget>[
                        Expanded(
                            child: Text(
                          productOldPrice + ' S.P',
                          style: TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.lineThrough),
                        )),
                        Expanded(
                            child: Text(
                          productPrice + ' S.P',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Size'),
                            content: Text('Choose the size'),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Close'),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text('Size'),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Color'),
                            content: Text('Choose the color'),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Close'),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text('Color'),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Quantity'),
                            content: Text('Choose the quantity'),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Close'),
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text('Qty'),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.red,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Buy now',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add_shopping_cart,
                              color: Colors.red,
                            )),
                      ),
                      Container(
                        color: Colors.white,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite_border,
                              color: Colors.red,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.black,
          ),
          ListTile(
            title: Text('Product details'),
            subtitle: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
          ),
          Divider(
            color: Colors.black,
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text(
                  'Product name',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(productName),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text(
                  'Product brand',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text('Brand X'),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(12, 5, 5, 5),
                child: Text(
                  'Product condition',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Text('New'),
              ),
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text('Similar products'),
          ),
          SimilarProducts(),
        ],
      ),
    );
  }
}

class SimilarProducts extends StatelessWidget {
  final products = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "oldPrice": "50000",
      "price": "25000",
    },
    {
      "name": "Red drees",
      "picture": "images/products/dress1.jpeg",
      "oldPrice": "75000",
      "price": "50000",
    },
    {
      "name": "Hills",
      "picture": "images/products/hills1.jpeg",
      "oldPrice": "25000",
      "price": "15000",
    },
    {
      "name": "Pants",
      "picture": "images/products/pants1.jpg",
      "oldPrice": "40000",
      "price": "25000",
    },
    {
      "name": "Shoes",
      "picture": "images/products/shoe1.jpg",
      "oldPrice": "30000",
      "price": "15000",
    },
    {
      "name": "Skirt",
      "picture": "images/products/skt1.jpeg",
      "oldPrice": "60000",
      "price": "30000",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: products.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return product(
            name: products[index]['name'].toString(),
            location: products[index]['picture'].toString(),
            oldPrice: products[index]['oldPrice'].toString(),
            price: products[index]['price'].toString(),
          );
        },
      ),
    );
  }
}
