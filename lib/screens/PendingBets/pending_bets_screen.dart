import 'package:flutter/material.dart';
import 'package:news_app/Constants/device_parameters.dart';

import 'history_of_bets.dart';
import 'pending_bets_container.dart';
import 'token_appbar.dart';
import 'transactionCard.dart';

class PendingBetsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TokenAppBar.tokens("890765"),
      body: Container(
        height: Device.height,
        width: Device.width,
        child: Center(
          child: ListView(
            padding: EdgeInsets.only(top: 5),
            children: [
              PendingBetsContainer.container(),
              SizedBox(
                height: 50,
              ),
              HistoryOfBets.history(),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TransactionDart.card(
                    Icons.attach_money,
                    "Withdraw",
                  ),
                  TransactionDart.card(
                    Icons.add_business,
                    "Deposit",
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TransactionDart.card(
                    Icons.lock_clock,
                    "Transaction history",
                  ),
                  TransactionDart.card(
                    Icons.more,
                    "Bonus",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
