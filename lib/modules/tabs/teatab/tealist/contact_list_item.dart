import 'package:flutter/material.dart';
import 'package:myapp/modules/tabs/teatab/tealist/modal/contact.dart';
import 'package:myapp/modules/tabs/teatab/tealist/teadetailtab/teadetailtab.dart';

class ContactListItem extends StatelessWidget {
  final ContactModal _contactModal;
  final brandItem;
  ContactListItem(this._contactModal, this.brandItem);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
        leading: new Image.asset(
          _contactModal.imgurl,
          fit: BoxFit.cover,
          width: 50,
        ),
        title: new Text(_contactModal.fullName),
        subtitle: new Text(_contactModal.recipes + " Recipse"),
        onTap: () => onTapped(context));
  }

  void onTapped(BuildContext context) {
    Navigator.of(context).push(
      new MaterialPageRoute<void>(
          // Add 20 lines from here...
          builder: (context) =>
              new TeaDetailTab(_contactModal, brandItem)), // ... to here.
    );
  }
}
