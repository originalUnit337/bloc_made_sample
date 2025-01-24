import 'package:flutter/material.dart';

class PaymentWidget extends StatelessWidget {
  const PaymentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const borderRadiusCircular = 19.0;
    const double paddingAll = 16;
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width - paddingAll * 2;
    final screenHeight = screenSize.height - paddingAll * 2;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(paddingAll),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Regular payments',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                    3,
                    (index) => Container(
                          height: screenHeight * 0.15,
                          width: screenWidth * 0.25,
                          margin: const EdgeInsets.only(
                            right: 15,
                            top: 20,
                            bottom: 20,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).canvasColor,
                            borderRadius: const BorderRadius.all(
                                Radius.circular(borderRadiusCircular)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.credit_card,
                                  size: screenWidth * 0.15,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'bla-bla',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium,
                                ),
                              ),
                            ],
                          ),
                        )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: paddingAll,
              ),
              child: Text(
                'Transfer to others',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Table(
              border: TableBorder.all(
                  borderRadius: const BorderRadius.all(
                Radius.circular(
                  borderRadiusCircular,
                ),
              )),
              children: [
                TableRow(
                    decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(
                          borderRadiusCircular,
                        ),
                        topRight: Radius.circular(
                          borderRadiusCircular,
                        ),
                      ),
                    ),
                    children: List.generate(
                      2,
                      (index) => SizedBox(
                        height: screenSize.height * 0.15,
                        child: Padding(
                          padding: const EdgeInsets.all(paddingAll),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                index == 0
                                    ? Icons.card_giftcard
                                    : Icons.card_membership,
                                size: screenWidth * 0.15,
                              ),
                              Text(
                                index == 0
                                    ? 'By card number to another bank'
                                    : 'By phone number to Alfa\'s client',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
                TableRow(
                    decoration: BoxDecoration(
                      color: Theme.of(context).canvasColor,
                    ),
                    children: List.generate(
                      2,
                      (index) => SizedBox(
                        height: screenSize.height * 0.15,
                        child: Padding(
                          padding: const EdgeInsets.all(paddingAll),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                index == 0
                                    ? Icons.account_balance
                                    : Icons.account_balance_wallet,
                                size: screenWidth * 0.15,
                              ),
                              Text(
                                index == 0
                                    ? 'By account number to another person'
                                    : 'By company\'s account number',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
                TableRow(
                    decoration: BoxDecoration(
                        color: Theme.of(context).canvasColor,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(borderRadiusCircular),
                          bottomRight: Radius.circular(borderRadiusCircular),
                        )),
                    children: List.generate(
                      2,
                      (index) => SizedBox(
                        height: screenSize.height * 0.15,
                        child: Padding(
                          padding: const EdgeInsets.all(paddingAll),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                index == 0
                                    ? Icons.transcribe
                                    : Icons.integration_instructions,
                                size: screenWidth * 0.15,
                              ),
                              Text(
                                index == 0
                                    ? 'Transfer by using ITS'
                                    : 'International Transfer',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: paddingAll,
                bottom: paddingAll,
              ),
              child: Text(
                'Transfer to yourself',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Table(
              border: TableBorder.all(
                  borderRadius: const BorderRadius.all(
                Radius.circular(
                  borderRadiusCircular,
                ),
              )),
              children: [
                TableRow(
                    decoration: BoxDecoration(
                        color: Theme.of(context).canvasColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(borderRadiusCircular),
                          topRight: Radius.circular(borderRadiusCircular),
                        )),
                    children: List.generate(
                      2,
                      (index) => SizedBox(
                        height: screenSize.height * 0.15,
                        child: Padding(
                          padding: const EdgeInsets.all(paddingAll),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                index == 0
                                    ? Icons.currency_exchange
                                    : Icons.computer_rounded,
                                size: screenWidth * 0.15,
                              ),
                              Text(
                                index == 0
                                    ? 'Currency exchange'
                                    : 'Between your accounts',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
                TableRow(
                    decoration: BoxDecoration(
                        color: Theme.of(context).canvasColor,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(borderRadiusCircular),
                          bottomRight: Radius.circular(borderRadiusCircular),
                        )),
                    children: List.generate(
                      2,
                      (index) => SizedBox(
                        height: screenSize.height * 0.15,
                        child: Padding(
                          padding: const EdgeInsets.all(paddingAll),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                index == 0 ? Icons.house : Icons.credit_card,
                                size: screenWidth * 0.15,
                              ),
                              Text(
                                index == 0
                                    ? 'From another bank card'
                                    : 'Request for replenishment.',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
