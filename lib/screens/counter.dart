import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


// Exemplo de contador usando BLoc
class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0); // valor inicial do contador

  //eventos
  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}

class CounterContainer extends StatelessWidget {
  //pode ser chamado de CounterPage
  @override
  Widget build(BuildContext context) {
    return BlocProvider( // cria 
      create: (_) => CounterCubit(),
      child: CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Contador usando BLoC'),
      ),
      body: Center(
        //eh notificado quando ele precisa ser rebuildado
        child: BlocBuilder<CounterCubit, int>(builder: (context, state) {
          return Text("$state",
            style: textTheme.headline2,
          );
        }),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            // ignore: deprecated_member_use
            onPressed: () => context.bloc<CounterCubit>().increment(),
          ),
          SizedBox(height: 8),
          FloatingActionButton(
            child: Icon(Icons.remove),
            // ignore: deprecated_member_use
            onPressed: () => context.bloc<CounterCubit>().decrement(),
          ),
        ],
      ),
    );
  }
}
