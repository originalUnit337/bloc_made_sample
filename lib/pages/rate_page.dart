
import 'package:bloc_made_sample/repositories/rate_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/rate/rate_bloc.dart';

class RatePage extends StatelessWidget {
  final int curId = 431;
  const RatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Rate')
      ),
      body: BlocProvider(
        create: (context) =>
        RateBloc(RateRepository()),//..add(FetchRateEvent(curId)),
        child: BlocBuilder<RateBloc, RateState>(
          builder: (context, state) {
            if (state is RateLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is RateLoaded) {
              final rate = state.rate;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Alfa online buy 1 USD: '),
                    Text('Alfa onlne sell 1 USD: '),
                    Text('Currency: ${rate.curName}',
                     style:TextStyle(fontSize: 24),
                     ),
                     Text('Rate: ${rate.curOfficialRate}',
                     style: TextStyle(fontSize: 24)),
                     Text('Date: ${rate.date}',
                     style: TextStyle(fontSize: 24)),
                  ],
                ),
              );
            } else if (state is RateError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            else {
              return ElevatedButton(onPressed: () {
                context.read<RateBloc>().add(FetchRateEvent(curId));
              }, child: Text('Load Rate'),);
            }
            return Center(child: Text('Select a currency to see the rate.'));
          },
        ),
      ),
    );
  }
}