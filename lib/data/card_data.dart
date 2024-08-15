import 'package:tokio_test/model/card_model.dart';

class CardData {
  final CardDataData = const [
    CardModel(icon: 'assets/images/policy-icon-car.png', title: "Automovel"),
    CardModel(
        icon: 'assets/images/policy-icon-residential.png', title: "Residencia"),
    CardModel(icon: 'assets/images/policy-icon-life.png', title: "Vida"),
    CardModel(
        icon: 'assets/images/policy-icon-personal-accident.png',
        title: "Acidentes"),
    CardModel(icon: 'assets/images/policy-icon-moto.png', title: "Moto"),
    CardModel(
        icon: 'assets/images/policy-icon-enterprise.png', title: "Empresa"),
  ];
}
