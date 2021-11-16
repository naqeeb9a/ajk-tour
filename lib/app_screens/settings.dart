import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5,
            child: const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text("Settings",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ),
          ),
          const Text("Account"),
          const ListTile(
            leading: Icon(Icons.person),
            title: Text("Naqeeb Ur Rehman"),
            subtitle: Text("Personal Info"),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          const Text("Settings"),
          tiles(
              Icons.language, "Language", Icons.arrow_forward_ios_outlined, 20),
          tiles(Icons.notifications, "Notification",
              Icons.arrow_forward_ios_outlined, 20),
          tiles(Icons.help, "Help", Icons.arrow_forward_ios_outlined, 20),
          tiles(Icons.contact_mail, "Naqeeb9a@gmail.com",
              Icons.arrow_forward_ios_outlined, 20),
        ],
      ),
    ));
  }
}

Widget tiles(icons1, text, icons2, radius) {
  return ListTile(
    leading: CircleAvatar(radius: 20, child: Icon(icons1)),
    title: Text(text),
    trailing: Icon(icons2),
  );
}
