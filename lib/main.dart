import 'package:flutter/material.dart';
import 'module/contacts/contact_view.dart';
import 'injection/dependency_injection.dart';

void main() {
  Injector.config(Flavor.PRO);
  runApp(MaterialApp(
    title: "Contacts",
    home: ContactsPage(),
  ));
}


