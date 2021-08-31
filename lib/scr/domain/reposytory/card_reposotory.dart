import 'package:nekidaem_test/scr/domain/api/card_provider.dart';
import 'package:nekidaem_test/scr/model/card_model.dart';

class CardRepository {
  CardProvider _cardsProvider = CardProvider();

  Future<List<CardModel>> getAllCards(String token) =>
      _cardsProvider.getCard(token: token);
}
