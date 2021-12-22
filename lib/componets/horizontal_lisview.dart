import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Category(
            imageLocation: 'images/cats/accessories.png',
            imageCaption: 'Accessories',
          ),
          Category(
            imageLocation: 'images/cats/dress.png',
            imageCaption: 'Drees',
          ),
          Category(
            imageLocation: 'images/cats/formal.png',
            imageCaption: 'Formal',
          ),
          Category(
            imageLocation: 'images/cats/informal.png',
            imageCaption: 'Informal',
          ),
          Category(
            imageLocation: 'images/cats/jeans.png',
            imageCaption: 'Jeans',
          ),
          Category(
            imageLocation: 'images/cats/shoe.png',
            imageCaption: 'Shoes',
          ),
          Category(
            imageLocation: 'images/cats/tshirt.png',
            imageCaption: 'Shirts',
          ),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;

  Category({required this.imageCaption, required this.imageLocation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 80,
          child: Column(children: <Widget>[
            Expanded(
              child: Image.asset(
                imageLocation,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              imageCaption,
              textAlign: TextAlign.center,
            ),
          ]),
        ),
      ),
    );
  }
}
