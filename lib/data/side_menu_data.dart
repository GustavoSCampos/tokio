import 'package:tokio_test/model/menu_model.dart';
import 'package:flutter/material.dart';

class SideMenuData {
  final menu = <MenuModel>[
    MenuModel(icon: Icons.settings, title: 'Home/Seguro'),
    MenuModel(icon: Icons.settings, title: 'Minhas Contratações'),
    MenuModel(icon: Icons.settings, title: 'Meus Sinistros'),
    MenuModel(icon: Icons.settings, title: 'Minha Família'),
    MenuModel(icon: Icons.settings, title: 'Meus Bens'),
    MenuModel(icon: Icons.settings, title: 'Pagamentos'),
    MenuModel(icon: Icons.settings, title: 'Corretores'),
    MenuModel(icon: Icons.settings, title: 'Validar Boleto'),
    MenuModel(icon: Icons.settings, title: 'Telefones Importantes'),
    MenuModel(icon: Icons.settings, title: 'Configurações')
  ];
}
