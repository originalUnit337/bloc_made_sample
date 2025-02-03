import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../bloc/rate/rate_bloc.dart';
import '../../../repositories/rate_repository.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  void initState() {
    super.initState();
    context.read<RateBloc>().add(FetchRateEvent());
  }

  final int curIdUSD = 431;

  final int curIdEUR = 451;

  final int curIdRUB = 456;

  @override
  Widget build(BuildContext context) {
    const double paddingAll = 16;
    return Padding(
      padding: const EdgeInsets.all(paddingAll),
      //child: BlocProvider(
      //create: (context) => RateBloc(RateRepository()),
      child: BlocBuilder<RateBloc, RateState>(builder: (context, state) {
        switch (state) {
          case RateLoading():
            return Column(
              children: [
                Table(
                  children: [
                    const TableRow(
                      children: [
                        Text('Currency'),
                        Text('Buy'),
                        Text('Sell'),
                      ],
                    ),
                    TableRow(
                      children: [
                        ListTile(
                          leading:
                              Image.asset('assets/images/united-states.png'),
                          title: const Text('1 USD'),
                        ),
                        _buildShimmerLoading(),
                        _buildShimmerLoading(),
                      ],
                    ),
                    TableRow(
                      children: [
                        ListTile(
                          leading:
                              Image.asset('assets/images/european-union.png'),
                          title: const Text('1 EUR'),
                        ),
                        _buildShimmerLoading(),
                        _buildShimmerLoading(),
                      ],
                    ),
                    TableRow(
                      children: [
                        ListTile(
                          leading: Image.asset('assets/images/russia.png'),
                          title: const Text('100 RUB'),
                        ),
                        _buildShimmerLoading(),
                        _buildShimmerLoading(),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 150,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/ratePage');
                    },
                    child: const Text('Get Currency Rate'),
                  ),
                ),
              ],
            );
          case RateLoaded():
            final rateMap = state.rateMap;
            //num diff = Random().nextInt(4) / 10;
            num diff = 0;
            return Column(
              children: [
                Table(
                  children: [
                    const TableRow(
                      children: [
                        Text('Currency'),
                        Text('Buy'),
                        Text('Sell'),
                      ],
                    ),
                    TableRow(
                      children: [
                        ListTile(
                          leading:
                              Image.asset('assets/images/united-states.png'),
                          title: const Text('1 USD'),
                        ),
                        Text((rateMap!['USD']!.curOfficialRate + diff)
                            .toString()),
                        Text((rateMap['USD']!.curOfficialRate + diff)
                            .toString()),
                      ],
                    ),
                    TableRow(
                      children: [
                        ListTile(
                          leading:
                              Image.asset('assets/images/european-union.png'),
                          title: const Text('1 EUR'),
                        ),
                        Text((rateMap['EUR']!.curOfficialRate + diff)
                            .toString()),
                        Text((rateMap['EUR']!.curOfficialRate + diff)
                            .toString()),
                      ],
                    ),
                    TableRow(
                      children: [
                        ListTile(
                          leading: Image.asset('assets/images/russia.png'),
                          title: const Text('100 RUB'),
                        ),
                        Text((rateMap['RUB']!.curOfficialRate + diff)
                            .toString()),
                        Text((rateMap['RUB']!.curOfficialRate + diff)
                            .toString()),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 150,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/ratePage');
                    },
                    child: const Text('Get Currency Rate'),
                  ),
                ),
              ],
            );
          case RateError():
            return Text('Error loading currency rate: ${state.message}');
          default:
            return Column(
              children: [
                Table(
                  children: [
                    const TableRow(
                      children: [
                        Text('Currency'),
                        Text('Buy'),
                        Text('Sell'),
                      ],
                    ),
                    TableRow(
                      children: [
                        ListTile(
                          leading:
                              Image.asset('assets/images/united-states.png'),
                          title: const Text('1 USD'),
                        ),
                        _buildShimmerLoading(),
                        _buildShimmerLoading(),
                      ],
                    ),
                    TableRow(
                      children: [
                        ListTile(
                          leading:
                              Image.asset('assets/images/european-union.png'),
                          title: const Text('1 EUR'),
                        ),
                        _buildShimmerLoading(),
                        _buildShimmerLoading(),
                      ],
                    ),
                    TableRow(
                      children: [
                        ListTile(
                          leading: Image.asset('assets/images/russia.png'),
                          title: const Text('100 RUB'),
                        ),
                        _buildShimmerLoading(),
                        _buildShimmerLoading(),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: 150,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/ratePage');
                    },
                    child: const Text('Get Currency Rate'),
                  ),
                ),
              ],
            );
        }
      }),
      //),
    );
  }

  Widget _buildShimmerLoading() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: 100,
        height: 20,
        color: Colors.white,
      ),
    );
  }
}
