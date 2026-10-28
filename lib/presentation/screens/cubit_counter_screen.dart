import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  static const String name = "cubit_counter_screen";

  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = context.read<CounterCubit>();

    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterCubit value) {
          return Text("Counter value: ${ value.state.transactionCount }");
        } ),
        actions: [
          IconButton(
              onPressed: () => counterCubit.reset(),
              icon: Icon(Icons.refresh_outlined)
          )
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          // buildWhen: ,
          builder: (context, state) {
            print("Counter cambió");
            return Text("Counter value: ${ state.counter }");
          },
        ),
      ),
      floatingActionButton: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            spacing: 15,
            children: [
              FloatingActionButton(
                heroTag: 3,
                onPressed: () => counterCubit.increaseBy(3),
                child: Text("+3"),
              ),
              FloatingActionButton(
                heroTag: 2,
                onPressed: () => counterCubit.increaseBy(2),
                child: Text("+2"),
              ),
              FloatingActionButton(
                heroTag: 1,
                onPressed: () => counterCubit.increaseBy(1),
                child: Text("+1"),
              ),
            ],
          );
        },
      ),
    );
  }
}
