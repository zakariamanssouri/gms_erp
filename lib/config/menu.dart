// ignore_for_file: unnecessary_const

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
    const ButtonOption(route: "/crm", text: 'CRM', iconData: Icons.cases_sharp),
    const ButtonOption(
        route: "/inventory", text: 'Inventaire', iconData: Icons.inventory_2),
    const ButtonOption(
        route: "/identity", text: 'Incidents', iconData: Icons.settings),
    const ButtonOption(route: "", text: 'BI', iconData: Icons.poll_sharp),
  ];

  static List<ButtonOption> IdentityOptions = const <ButtonOption>[
    const ButtonOption(
        route: "/identityAdminAddUsers",
        text: 'Ajouter Utilisateur',
        iconData: Icons.person_add),
    const ButtonOption(
        route: "/identityUsersList",
        text: 'Utilisateurs',
        iconData: Icons.people_alt),
    const ButtonOption(
        route: "", text: 'Roles', iconData: Icons.person_pin_rounded),
    const ButtonOption(
        route: "", text: "Droit d'Accées", iconData: Icons.lock_person),
  ];

  static List<ButtonOption> CrmOptions = const <ButtonOption>[
    const ButtonOption(
        route: "/Activity", text: 'Activités', iconData: Icons.dashboard),
    const ButtonOption(
        route: "/CustomerInvoices",
        text: 'Factures',
        iconData: Icons.file_copy),
    const ButtonOption(
        route: "/Client", text: 'Clients', iconData: Icons.account_box),
    const ButtonOption(
        route: "/CustomerOrder",
        text: 'Commandes',
        iconData: Icons.contact_page),
    const ButtonOption(
        route: "/Activity", text: 'Opportunités', iconData: Icons.copy),
    const ButtonOption(
        route: "/Activity", text: 'Devis', iconData: Icons.file_download),
    const ButtonOption(
        route: "/CustomerDelivery",
        text: 'Livraisons',
        iconData: Icons.keyboard_command_key),
    const ButtonOption(
        route: "/Activity", text: '.', iconData: Icons.inventory),
    const ButtonOption(
        route: "/Product",
        text: 'Produits',
        iconData: Icons.production_quantity_limits),
    const ButtonOption(
        route: "/Vendors",
        text: 'Fournisseurs',
        iconData: Icons.account_balance_wallet),
    const ButtonOption(
        route: "/PurchasedOrders",
        text: 'Réceptions',
        iconData: Icons.shopping_cart),
    const ButtonOption(
        route: "/CustomerDeliveryOrders",
        text: 'Livraison / Commandes',
        iconData: Icons.shopping_cart),
  ];

  static List<ButtonOption> InventoryOptions = const <ButtonOption>[
    const ButtonOption(
        route: "/products",
        text: 'Produits',
        iconData: Icons.grid_view_rounded),
    const ButtonOption(
        route: "/stock", text: 'Stock', iconData: Icons.warehouse_rounded),
    const ButtonOption(
        route: "/inventories", text: 'Inventaires', iconData: Icons.inventory),
  ];
}
