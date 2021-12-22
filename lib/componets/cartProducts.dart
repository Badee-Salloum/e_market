import 'package:flutter/material.dart';

class CartProducts extends StatelessWidget {
  final cartProducts = [
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "price": "25000",
      "size": "M",
      "color": "Red",
      "qty": "1",
    },
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "price": "25000",
      "size": "M",
      "color": "Red",
      "qty": "1",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: cartProducts.length,
        itemBuilder: (context, index) {
          return CartProduct(
            name: cartProducts[index]['name'].toString(),
            size: cartProducts[index]['size'].toString(),
            qty: cartProducts[index]['qty'].toString(),
            color: cartProducts[index]['color'].toString(),
            picture: cartProducts[index]['picture'].toString(),
            price: cartProducts[index]['price'].toString(),
          );
        });
  }
}

class CartProduct extends StatelessWidget {
  final String name;
  final String picture;
  final String price;
  final String size;
  final String qty;
  final String color;

  CartProduct(
      {required this.name,
      required this.price,
      required this.color,
      required this.picture,
      required this.qty,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(
          picture,
          width: 80,
          height: 80,
        ),
        title: Text(name),
        subtitle: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Text('Size :'),
                ),
                Padding(
                  padding: EdgeInsets.all(4),
                  child: Text(
                    size,
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 8, 8, 8),
                  child: Text('Color :'),
                ),
                Padding(
                  padding: EdgeInsets.all(4),
                  child: Text(
                    color,
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                '$price S.P',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        trailing: Column(
          children: [
            InkWell(
              child: new Icon(
                Icons.arrow_drop_up,
                size: 20,
              ),
              onTap: () {},
            ),
            Expanded(
              child: new Text(
                "$qty",
                style: new TextStyle(fontSize: 20),
              ),
            ),
            InkWell(
                child: Icon(
                  Icons.arrow_drop_down,
                  size: 20,
                ),
                onTap: () {}),
          ],
        ),
      ),
    );
  }
}
