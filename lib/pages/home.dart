import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_market/componets/horizontal_lisview.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:carousel_pro/carousel_pro.dart';
import 'package:e_market/componets/products.dart';
import 'cart.dart';
import 'package:e_market/pages/admin.dart';

class HomePage extends StatefulWidget {
  String? locUsername;
  HomePage({required this.locUsername});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget imageCarousal = Expanded(
      child: Container(
        height: 250,
        child: Carousel(
          images: [
            Image(
              image: AssetImage('images/c1.jpg'),
              fit: BoxFit.fill,
            ),
            Image(
              image: AssetImage('images/m1.jpeg'),
              fit: BoxFit.fill,
            ),
            Image(
              image: AssetImage('images/m2.jpg'),
              fit: BoxFit.fill,
            ),
            Image(
              image: AssetImage('images/w1.jpeg'),
              fit: BoxFit.fill,
            ),
            Image(
              image: AssetImage('images/w3.jpeg'),
              fit: BoxFit.fill,
            ),
            Image(
              image: AssetImage('images/w4.jpeg'),
              fit: BoxFit.fill,
            ),
          ],
          animationDuration: Duration(milliseconds: 1000),
          animationCurve: Curves.fastOutSlowIn,
          boxFit: BoxFit.fill,
          dotSize: 6,
          indicatorBgPadding: 2,
          dotBgColor: Colors.transparent,
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text('E-Market'),
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
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('badee'),
              accountEmail: Text('badesalloum'),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(
                  Icons.home,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My account'),
                leading: Icon(
                  Icons.person,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My orders'),
                leading: Icon(
                  Icons.shopping_basket,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Cart(),
                  ),
                );
              },
              child: ListTile(
                title: Text('Shopping cart'),
                leading: Icon(
                  Icons.shopping_cart,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Favourites'),
                leading: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
            ),
            if (widget.locUsername == 'admin@admin.com')
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Admin(),
                    ),
                  );
                },
                child: ListTile(
                  title: Text('Store manager'),
                  leading: Icon(
                    Icons.manage_accounts,
                    color: Colors.red,
                  ),
                ),
              ),
            Divider(),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('About'),
                leading: Icon(
                  Icons.help,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          imageCarousal,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Categoris',
              textAlign: TextAlign.center,
            ),
          ),
          HorizontalList(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Recent products',
              textAlign: TextAlign.center,
            ),
          ),
          Products(),
        ],
      ),
    );
  }
}
