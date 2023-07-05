import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlockCounterScreen extends StatelessWidget {
  const BlockCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const _BlockCounterView(),
    );
  }
}

class _BlockCounterView extends StatelessWidget {
  const _BlockCounterView({
    super.key,
  });

  void increaseCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterBloc>().add(CounterIncreased(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterBloc value) =>
            Text('block counter: ${value.state.transactionCount}')),
        actions: [
          IconButton(
            onPressed: () {
              context.read<CounterBloc>().add(const CounterRestarted());
            },
            icon: const Icon(Icons.refresh_outlined),
          )
        ],
      ),
      body: Center(
          child: context.select((CounterBloc value) =>
              Text('Counter value: ${value.state.counter}'))),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => increaseCounterBy(context, 3),
            heroTag: '1',
            child: const Text("+3"),
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            onPressed: () => increaseCounterBy(context, 2),
            heroTag: '2',
            child: const Text("+2"),
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            onPressed: () => increaseCounterBy(context),
            heroTag: '3',
            child: const Text("+1"),
          ),
        ],
      ),
    );
  }
}
