import 'package:e_commerce/UI/extensions/text_style.dart';
import 'package:e_commerce/UI/widgets/history_list_widget.dart';
import 'package:e_commerce/logic/bloc/main_bloc/main_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key, required this.user});
  final User? user;
  @override
  Widget build(BuildContext context) {
    final orderHistories = context.watch<MainBloc>().state.orderHistories;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: 'History View'.textHeadline2,
      ),
      body: SingleChildScrollView(
        child: HistoryListWidget(orderHistories: orderHistories),
      ),
    );
  }
}
