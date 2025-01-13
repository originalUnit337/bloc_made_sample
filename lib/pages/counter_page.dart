import 'dart:math';

import 'package:bloc_made_sample/bloc/counter_event.dart';
import 'package:bloc_made_sample/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ha-ha prikol'),
      ),
      body: Center(
        child:
            BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
          return Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              for (int index = 0; index < state.count; index++)
                Positioned(
                    left: Random().nextInt(250).toDouble(),
                    top: Random().nextInt(400).toDouble(),
                    child: SizedBox(
                      height: 150,
                      width: 150,
                      child: Image.asset('images/img_1.png'),
                    )),
            ],
          );
        }),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterIncrementPressed());
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            height: 10.0,
          ),
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterDecrementPressed());
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
