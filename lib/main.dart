import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: Colors.amber),
                accountName: const Text('Muaz Hussain', style: TextStyle(color: Colors.black),),
                accountEmail: const Text('muazhussain@gmail.com', style: TextStyle(color: Colors.black),),
                currentAccountPicture: Image.network('https://img.icons8.com/external-victoruler-linear-colour-victoruler/344/external-doctor-medical-staff-characters-victoruler-linear-colour-victoruler-7.png'),
                onDetailsPressed: () {},
              ),
            ),
            ListTile(
              title: const Text('Dashboard'),
              leading: const Icon(Icons.dashboard),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Settings'),
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Profile'),
              leading: const Icon(Icons.person),
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Assignment 02'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(15),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Full name'
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            child: TextField(
              controller: ageController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Age'
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15),
            child: ElevatedButton(
              onPressed: () {
                showDialog(context: context, builder: (context){
                  if(nameController.text == "" || ageController.text == "") {
                    return AlertDialog(
                      title: const Text('Invalid'),
                      content: const Text('Fields can\'t be empty!'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Ok!'),
                        ),
                      ],
                    );
                  } else {
                    return AlertDialog(
                      title: const Text('Alert!'),
                      content: Text('Your name: ${nameController.text}\nYour age: ${ageController.text}'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(content: Text('Submitted..')));
                            Navigator.pop(context);
                          },
                          child: const Text('Ok'),
                        )
                      ],
                    );
                  }
                });
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

