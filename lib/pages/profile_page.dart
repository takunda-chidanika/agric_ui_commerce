import 'package:agric/pages/order_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          //Profile Image
          Padding(
            padding: const EdgeInsets.only(top: 25, bottom: 15),
            child: CircleAvatar(
              radius: 62,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: const CircleAvatar(
                radius: 60,
                foregroundImage: AssetImage("assets/avatar.jpg"),
              ),
            ),
          ),
          Center(
            child: Text(
              "TJ Chidanika",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Center(
            child: Text(
              "tjchidanika@gmail.com",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          const SizedBox(height: 20,),
          ListTile(
            title: const Text("My Orders"),
             leading: const Icon(IconlyLight.bag),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(context)=> const OrderPage()));
            },
          ),
          ListTile(
            title: const Text("About us"),
            leading: const Icon(IconlyLight.infoSquare),
            onTap: (){},
          ),
          ListTile(
            title: const Text("Privacy"),
            leading: const Icon(IconlyLight.infoSquare),
            onTap: (){},
          ),
          ListTile(
            title: const Text("Logout"),
            leading: const Icon(IconlyLight.logout),
            onTap: (){},
          ),
        ],
      ),
    );
  }
}
