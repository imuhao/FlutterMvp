import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../data/contact_data.dart';
import 'contact_presenter.dart';

class ContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text("Contacts")),
      body: ContactList(),
    );
  }
}

class ContactList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ContactListState();
  }
}

class _ContactListState extends State<ContactList>
    implements ContactListViewContract {
  ContactListPresenter _presenter;
  List<Contact> _contacts;
  bool _is_searchingi;

  _ContactListState() {
    _presenter = new ContactListPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _is_searchingi = true;
    _presenter.loadContacts();
  }

  @override
  Widget build(BuildContext context) {
    Widget widget;

    if (_is_searchingi) {
      widget = Center(
          child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: CircularProgressIndicator(),
      ));
    } else {
      widget = new ListView(
          padding: new EdgeInsets.symmetric(vertical: 8.0),
          children: _buildContactList());
    }

    return widget;
  }

  @override
  void onLoadContactsComplete(List<Contact> items) {
    setState(() {
      _contacts = items;
      _is_searchingi = false;
    });
  }

  @override
  void onLoadContactsError() {
    // TODO: implement onLoadContactsError
  }

  List<_ContactListItem> _buildContactList() {
    return _contacts.map((contact) => new _ContactListItem(contact)).toList();
  }
}

class _ContactListItem extends ListTile {
  _ContactListItem(Contact contact)
      : super(
            title: new Text(contact.fullName),
            subtitle: new Text(contact.email),
            leading: new CircleAvatar(child: new Text(contact.fullName[0]),backgroundColor: Colors.green,));
}
