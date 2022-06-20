import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    const name = 'Rizoct';
    const email = 'rizoctdev@gmail.com';
    const urlImage = "assets/1.png";
    return Drawer(
      child: Material(
        color: Colors.indigo,
        child: ListView(
          padding: padding,
          children: <Widget>[
            const SizedBox(
              height: 40,
            ),
            buildHeader(
              urlImage: urlImage,
              name: name,
              email: email,
              onClicked: () {},
            ),
            const SizedBox(
              height: 24,
            ),
            const Divider(color: Colors.white70),
            const SizedBox(
              height: 24,
            ),
            buildMenuItem(text: 'People', icon: Icons.people, navigate: () {}),
            buildMenuItem(
                text: 'Favorites',
                icon: Icons.favorite_border,
                navigate: () {}),
            buildMenuItem(
                text: 'Workflow',
                icon: Icons.workspaces_outline,
                navigate: () {}),
            buildMenuItem(text: 'Updates', icon: Icons.update, navigate: () {}),
            const SizedBox(
              height: 24,
            ),
            const Divider(color: Colors.white70),
            const SizedBox(
              height: 24,
            ),
            buildMenuItem(
                text: 'Settings', icon: Icons.settings, navigate: () {}),
            buildMenuItem(
                text: 'Logout',
                icon: Icons.logout,
                navigate: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    required VoidCallback navigate,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        style: TextStyle(color: color),
      ),
      hoverColor: hoverColor,
      onTap: navigate,
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          child: Row(
            children: [
              CircleAvatar(radius: 50, backgroundImage: AssetImage(urlImage)),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
