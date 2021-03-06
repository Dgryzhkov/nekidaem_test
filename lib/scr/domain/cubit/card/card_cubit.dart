import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nekidaem_test/scr/domain/reposytory/card_reposotory.dart';
import 'package:nekidaem_test/scr/model/card_model.dart';

import 'card_state.dart';

class CardCubit extends Cubit<CardState> {
  final CardRepository cardRepository;
  final String token;

  CardCubit(this.cardRepository, this.token) : super(CardLoadingState());

  Future<void> fetchCards() async {
    try {
      final List<CardModel> _loadedCardList =
      await cardRepository.getAllCards(token);
      List<CardModel> _approvedCard = [];
      List<CardModel> _inProgressCard = [];
      List<CardModel> _needsReviewCard = [];
      List<CardModel> _onHoldCard = [];

      for (var i = 0; i < _loadedCardList.length; i++) {
        if (_loadedCardList[i].row == '0') _onHoldCard.add(_loadedCardList[i]);
        if (_loadedCardList[i].row == '1')
          _inProgressCard.add(_loadedCardList[i]);
        if (_loadedCardList[i].row == '2')
          _needsReviewCard.add(_loadedCardList[i]);
        if (_loadedCardList[i].row == '3')
          _approvedCard.add(_loadedCardList[i]);
      }

      emit(
        CardLoadedState(
          loadedCard: _loadedCardList,
          approvedCard: _approvedCard,
          inProgressCard: _inProgressCard,
          needsReviewCard: _needsReviewCard,
          onHoldCard: _onHoldCard,
        ),
      );
    } catch (_) {
      emit(CardErrorState());
    }
  }
}
