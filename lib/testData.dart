import 'package:flutter_project/data/models/contact_model.dart';
import 'data/models/list_contacts_model.dart';

class TestData {
  static const List<ListContactsModel> listContactsModel = [
    ListContactsModel(
      country: 'United States',
      icon: 'assets/icons/flag.png',
      contacts: [
        ContactModel(
          phoneNumber: '+1 (234) 123 45 67',
          city: 'New Jersey',
          isVerificated: true
        ),
        ContactModel(
          phoneNumber: '+1 (222) 321 42 62',
          city: 'Washington',
          isVerificated: true
        ),
        ContactModel(
          phoneNumber: '+1 (111) 555 1 55',
          city: 'Dallas',
          isVerificated: false
        )
      ]
    ),
    ListContactsModel(
      country: 'Russia',
      icon: 'assets/icons/flag.png',
      contacts: [
        ContactModel(
          phoneNumber: '+7 (234) 123 45 67',
          city: 'Vladivostok',
          isVerificated: true
        ),
        ContactModel(
          phoneNumber: '+7 (222) 321 42 62',
          city: 'Yakutsk',
          isVerificated: false
        ),
        ContactModel(
          phoneNumber: '+7 (111) 555 1 55',
          city: 'Orel',
          isVerificated: false
        )
      ]
    ),
  ];
}
