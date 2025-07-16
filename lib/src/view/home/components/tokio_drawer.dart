import 'package:flutter/material.dart';
import 'package:tokio_teste/src/shared/colors.dart';

import '../../../core/domain/entity/tokio_user.dart';

class TokioDrawer extends StatelessWidget {
  final TokioUser tokioUser;
  const TokioDrawer({super.key, required this.tokioUser});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: darkGrey,
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height*0.15,
              padding: EdgeInsets.all(16),
              color: darkBlue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Olá!",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                      ),
                      SizedBox(width: 8,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width:210,
                            child: Text(
                              tokioUser.name,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 24, color: Colors.white),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Minha Conta",
                                style: TextStyle(color: tokioGreen),
                              ),
                              Icon(Icons.keyboard_arrow_down, color: Colors.white,)
                            ],
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings, color: tokioGreen,),
              title: const Text('Home/Seguros', style: TextStyle(color: Colors.white),),
              onTap: () {
                // Update the UI based on the selected item
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: tokioGreen,),
              title: const Text('Minhas Contratações', style: TextStyle(color: Colors.white),),
              onTap: () {
                // Update the UI based on the selected item
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: tokioGreen,),
              title: const Text('Meus Sinistros', style: TextStyle(color: Colors.white),),
              onTap: () {
                // Update the UI based on the selected item
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: tokioGreen,),
              title: const Text('Minha Familia', style: TextStyle(color: Colors.white),),
              onTap: () {
                // Update the UI based on the selected item
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: tokioGreen,),
              title: const Text('Meus Bens', style: TextStyle(color: Colors.white),),
              onTap: () {
                // Update the UI based on the selected item
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: tokioGreen,),
              title: const Text('Pagamentos', style: TextStyle(color: Colors.white),),
              onTap: () {
                // Update the UI based on the selected item
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: tokioGreen,),
              title: const Text('Coberturas', style: TextStyle(color: Colors.white),),
              onTap: () {
                // Update the UI based on the selected item
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: tokioGreen,),
              title: const Text('Validar Boletos', style: TextStyle(color: Colors.white),),
              onTap: () {
                // Update the UI based on the selected item
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: tokioGreen,),
              title: const Text('Telefones Importantes', style: TextStyle(color: Colors.white),),
              onTap: () {
                // Update the UI based on the selected item
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: tokioGreen,),
              title: const Text('Configurações', style: TextStyle(color: Colors.white),),
              onTap: () {
                // Update the UI based on the selected item
                Navigator.pop(context); // Close the drawer
              },
            ),
            // ... more items
          ],
        ),
      ),
    );
  }
}
