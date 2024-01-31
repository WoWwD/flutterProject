import 'contact_model.dart';

class ListContactsModel {
  final String country;
  final String icon;
  final List<ContactModel> contacts;

  const ListContactsModel({
    required this.country,
    required this.icon,
    required this.contacts,
  });
}
