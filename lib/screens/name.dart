import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameCubit extends Cubit<String>{
  NameCubit(String name) : super(name);

  void change(String name) => emit(name);
  
}

class NameContainer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return NameView(); //name cubit sendo criado no dashboardContainer
  }
}

class NameView extends StatelessWidget{

  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    // nao precisa de rebuild ao alterar o estado
    _nameController.text = context.bloc<NameCubit>().state;

    return Scaffold(
      appBar: AppBar(title: Text("Change Name"),),
      body:  Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Desired Name: ',
            ),
            style: TextStyle(fontSize: 24.0),
          ),

          Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.maxFinite,
              child: RaisedButton(
                child: Text('change'),
                onPressed: (){

                  final name = _nameController.text;
                  // ignore: deprecated_member_use
                  context.bloc<NameCubit>().change(name);
                  Navigator.pop(context);

              }),
            ),
          ),
        ],
      )
    );
  }
}
