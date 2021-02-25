import 'package:bytebank/screens/counter.dart';
import 'package:bytebank/screens/dashboard.dart';
import 'package:bytebank/screens/name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'components/theme.dart';
void main() {
  runApp(BytebankApp());
}

class LogObserver extends BlocObserver { //BlocObserver -> observer geral
  @override
  void onChange(Cubit cubit, Change change){
    print('${cubit.runtimeType} > $change');
    super.onChange(cubit, change);
  }
}

class BytebankApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Bloc.observer = LogObserver(); // evitar na pratica para n vazar info

    return MaterialApp(
      theme: bytebankTheme,
      home: NameContainer(),//CounterContainer(),//Dashboard(),
    );
  }
}
