import 'package:agric/pages/cart_page.dart';
import 'package:agric/pages/explore_page.dart';
import 'package:agric/pages/profile_page.dart';
import 'package:agric/pages/services_page.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pages = [
    const ExplorePage(),
    const ServicesPage(),
    const CartPage(),
    const ProfilePage(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi Takunda",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              "Enjoy Our Services",
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton.filledTonal(
              onPressed: () {},
              icon: badges.Badge(
                position: badges.BadgePosition.topEnd(top: -15, end: -12),
                badgeContent: const Text(
                  '3',
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                badgeStyle: const badges.BadgeStyle(
                  badgeColor: Colors.green,
                ),
                child: const Icon(IconlyBroken.notification),
              ),
            ),
          )
        ],
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(IconlyLight.home),
              activeIcon: Icon(IconlyBold.home),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(IconlyLight.call),
              activeIcon: Icon(IconlyBold.call),
              label: "Services"),
          BottomNavigationBarItem(
              icon: Icon(IconlyLight.buy),
              activeIcon: Icon(IconlyBold.buy),
              label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(IconlyLight.profile),
              activeIcon: Icon(IconlyBold.profile),
              label: "Profile"),
        ],
      ),
    );
  }
}
