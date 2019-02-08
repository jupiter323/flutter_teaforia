import 'package:flutter/material.dart';
import 'package:myapp/modules/tabs/teatab/tealist/contact_list_item.dart';
import 'package:myapp/modules/tabs/teatab/tealist/modal/contact.dart';

class ContactsList extends StatelessWidget {
  final List<ContactModal> _contactModal;
  final brandItem;

  ContactsList(this._contactModal, this.brandItem);

  @override
  Widget build(BuildContext context) {
    return new ListView(
      padding: new EdgeInsets.symmetric(vertical: 8.0),
      children: _buildContactsList(),
    );
  }

  List<ContactListItem> _buildContactsList() {
    return _contactModal
        .map((contact) => new ContactListItem(contact, brandItem))
        .toList();
  }
}
