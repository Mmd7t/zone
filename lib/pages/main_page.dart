import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'menu_page/menu_page.dart';
import 'product_pages/products_page.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;

  final List pages = [
    Container(child: Text('الرئيسية'), alignment: Alignment.center),
    ProductsPage(),
    Container(child: Text('الطلبات'), alignment: Alignment.center),
    MenuPage(),
  ];

  final List appBarTitles = [
    'الرئيسية',
    'المنتجات',
    'الطلبات',
    'القائمة',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appBarTitles[currentPage],
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            color: Colors.black,
            icon: const Icon(CupertinoIcons.bell),
          ),
        ],
      ),
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        backgroundColor: Colors.white,
        selectedItemColor: Colors.grey.shade700,
        unselectedItemColor: Colors.grey.shade400,
        currentIndex: currentPage,
        items: [
          BottomNavigationBarItem(
            label: "الرئيسية",
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageIcon(Svg("assets/svg/home.svg")),
            ),
          ),
          BottomNavigationBarItem(
            label: "المنتجات",
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageIcon(Svg("assets/svg/order.svg")),
            ),
          ),
          BottomNavigationBarItem(
            label: "الطلبات",
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageIcon(Svg("assets/svg/car.svg"), size: 28),
            ),
          ),
          BottomNavigationBarItem(
            label: "القائمة",
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ImageIcon(Svg("assets/svg/menuo.svg")),
            ),
          ),
        ],
      ),
    );
  }
}
