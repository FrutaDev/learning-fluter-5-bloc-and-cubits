import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  static const String name = "bloc_counter_screen";

  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return _CubitCounterView();
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => CounterBloc(),
    child: _BlocCounterView());
  }
}

class _BlocCounterView extends StatelessWidget {
  const _BlocCounterView({super.key});

  void _increaseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterBloc>()
        .add( CounterIncreased(value: value) );
  }

  void _resetCounter(BuildContext context) {
    context.read<CounterBloc>()
        .add( CounterReset() );
  }

  @override
  Widget build(BuildContext context) {
    final CounterState counterState = context.select((CounterBloc counterBloc) => counterBloc.state);

    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc transaction count ${ counterState.transactionCount }"),
        actions: [
          IconButton(
              onPressed: () => _resetCounter(context),
              icon: Icon(Icons.refresh_outlined)
          )
        ],
      ),
      body: Center(
        child: Text("Bloc counter value: ${ counterState.counter }")),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 15,
        children: [
          FloatingActionButton(
            heroTag: 3,
            onPressed: () => _increaseCounterBy(context, 3),
            child: Text("+3"),
          ),
          FloatingActionButton(
            heroTag: 2,
            onPressed: () => _increaseCounterBy(context, 2),
            child: Text("+2"),
          ),
          FloatingActionButton(
            heroTag: 1,
            onPressed: () => _increaseCounterBy(context, 1),
            child: Text("+1"),
          ),
        ],
      ),
    );
  }
}
