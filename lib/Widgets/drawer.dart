import 'package:flutter/material.dart';

class DrawerWifget extends StatelessWidget {
  const DrawerWifget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.8,
      child: ListView(
        children: const [
          ListTile(
            title: Text(
              'Mr. Rakibull Hasan Ovi',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            // subtitle: Text('Mrs. Rakibull Hasan'),
            leading: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}
