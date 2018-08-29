import 'package:flutter/material.dart';
import 'module/contacts/contact_view.dart';
import 'injection/dependency_injection.dart';

void main() {
  Injector.config(Flavor.PRO);
  runApp(MaterialApp(
    theme: ThemeData(primaryColor:Colors.green),
    title: "Contacts",
    home: ContactsPage(),
  ));
}


