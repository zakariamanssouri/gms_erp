
import 'package:flutter/material.dart';

class ButtonOption {
  const ButtonOption(
      {this.color = const Color(0x31cdff),
      this.iconData = Icons.ac_unit_sharp,
      required this.text,
      required this.route});
  final Color color;
  final String text;
  final IconData iconData;
  final String route;

  static List<ButtonOption> Options = const <ButtonOption>[
    const ButtonOption(route: "/crm", text: 'CRM', iconData: Icons.dashboard),
    const ButtonOption(
        route: "/inventory", text: 'Inventory', iconData: Icons.person_add),
    const ButtonOption(
        route: "/identity",
        text: 'identity',
        iconData: Icons.person_pin_circle_outlined),
    const ButtonOption(
        route: "",
        text: 'BI',
        iconData: Icons.production_quantity_limits_rounded),
  ];

  static List<ButtonOption> IdentityOptions = const <ButtonOption>[
    const ButtonOption(route: "user", text: '', iconData: Icons.home),
    const ButtonOption(route: "product", text: '', iconData: Icons.person_add),
    const ButtonOption(
        route: "contact", text: '', iconData: Icons.person_pin_circle_outlined),
    const ButtonOption(
        route: "",
        text: '',
        iconData: Icons.production_quantity_limits_rounded),
  ];


   static List<ButtonOption> CrmOptions = const <ButtonOption>[
    const ButtonOption(route: "/Activity", text: 'Activités',iconData: Icons.dashboard),
    const ButtonOption(route: "/Activity",text: 'Plan de visite',iconData: Icons.calendar_month),
    const ButtonOption(route: "/Client",text: 'Clients' ,iconData: Icons.account_box),
    const ButtonOption(route: "/Activity",text: 'Contacts', iconData:Icons.contact_page),
    
    const ButtonOption(route: "/Activity", text: 'Opportunités',iconData: Icons.file_copy),
    const ButtonOption(route: "/Activity",text: 'Devis',iconData: Icons.file_download),
    const ButtonOption(route: "/Activity",text: 'Commandes' ,iconData: Icons.keyboard_command_key),
    const ButtonOption(route: "/Activity",text: 'Factures', iconData:Icons.inventory),
    const ButtonOption(route: "/Product",text: 'Produits', iconData:Icons.production_quantity_limits),
    
  ];


  static List<ButtonOption> InventoryOptions = const <ButtonOption>[
    const ButtonOption(route: "/inventories", text: 'Inventories',iconData: Icons.dashboard),
    const ButtonOption(route: "/Products",text: 'Products', iconData:Icons.contact_page),
    
  ];
}
