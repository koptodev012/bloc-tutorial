import 'package:bloc_tutorial/bloc/Internet_bloc/internet_bloc.dart';
import 'package:bloc_tutorial/bloc/Internet_bloc/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<InternetBloc, InternetState>(
          listener: (context, state) {
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("You are online!"),
                backgroundColor: Colors.green,
              ));
            } else if (state is InternetLostState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("You are offline!"),
                backgroundColor: Colors.red,
              ));
            }
          },
          builder: (context, state) {
            // is keyword is used for to check datatype
            if (state is InternetGainedState) {
              return Text("You are online!");
            } else if (state is InternetLostState) {
              return Text("Your are offline!");
            } else {
              return Text("Loading...");
            }
          },
        ),
      ),
    );
  }
}
