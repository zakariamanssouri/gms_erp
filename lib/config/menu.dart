
// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

class ButtonOption 
{
  const ButtonOption({
      this.color = const Color(0x31cdff),
      this.iconData = Icons.ac_unit_sharp,
      required this.text,
      required this.route});
  final Color color;
  final String text;
  final IconData iconData;
  final String route;

  static List<ButtonOption> Options = const <ButtonOption>[
    const ButtonOption(route: "/crm", text: 'CRM', iconData: Icons.cases_sharp),
    const ButtonOption(route: "/inventory", text: 'Inventaire', iconData: Icons.inventory_2),
    const ButtonOption(route: "/identity",text: 'identité',iconData: Icons.person),
    const ButtonOption(route: "",text: 'BI',iconData: Icons.poll_sharp),
  ];

  static List<ButtonOption> IdentityOptions = const <ButtonOption>[
    const ButtonOption(route: "/identityAddUsers", text: 'Ajouter Utilisateur', iconData: Icons.person_add),
    const ButtonOption(route: "/identityUsersList", text: 'Utilisateurs', iconData: Icons.people_alt),
    const ButtonOption(route: "", text: 'Roles', iconData: Icons.person_pin_rounded),
    const ButtonOption(route: "",text: "Droit d'Accées",iconData: Icons.lock_person),
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
