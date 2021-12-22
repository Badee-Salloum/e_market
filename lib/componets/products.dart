import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_market/pages/products_details.dart';

class Products extends StatelessWidget {
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

class product extends StatelessWidget {
  final String name;
  final String location;
  final String price;
  final String oldPrice;
  product({
    required this.name,
    required this.location,
    required this.oldPrice,
    required this.price,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Material(
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductDetails(
                      productName: name,
                      productOldPrice: oldPrice,
                      productPicture: location,
                      productPrice: price,
                    )));
          },
          child: GridTile(
            child: Image.asset(
              location,
              fit: BoxFit.cover,
            ),
            footer: Container(
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Text(
                    oldPrice,
                    style: TextStyle(
                      color: Colors.grey,
                      textBaseline: TextBaseline.alphabetic,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    price,
                    style: TextStyle(
                      color: Colors.red,
                      textBaseline: TextBaseline.alphabetic,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
