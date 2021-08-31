import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nekidaem_test/scr/domain/cubit/card/card_cubit.dart';
import 'package:nekidaem_test/scr/domain/reposytory/card_reposotory.dart';
import 'package:nekidaem_test/scr/pages/task/elements/task_body_widget.dart';


class OnHoldWidget extends StatelessWidget {
  OnHoldWidget({
    Key? key,
    required this.token,
  }) : super(key: key);

  final String token;
  final cardRepository = CardRepository();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CardCubit>(
      create: (context) => CardCubit(cardRepository, token),
      child: TaskBodyWidget(typeList: 0),
    );
  }
}
