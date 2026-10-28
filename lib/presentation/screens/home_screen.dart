import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static const String name = "home_screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hola Home Screen"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Cubits"),
            subtitle: const Text("Gestor de estado simple"),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => context.push("/cubits"),
          ),
          ListTile(
            title: const Text("Bloc"),
            subtitle: const Text("Gestor de estado con bloc"),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => context.push("/bloc"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(),
          )
        ],
      ),
    );
  }
}
