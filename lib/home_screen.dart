import 'package:bloc_fi/blocs/internet_blocs/internet_bloc.dart';
import 'package:bloc_fi/blocs/internet_blocs/internet_state.dart';
import 'package:bloc_fi/cubits/internet_cubits/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //==========================================================================
    //   return Scaffold(
    //     body: Center(
    //       child: BlocConsumer<InternetBloc, InternetState>(
    //         listener: (context, state) {
    //           if (state is InternetGainedState) {
    //             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //               content: Text("Internet Connected"),
    //               backgroundColor: Colors.green,
    //             ));
    //           } else {
    //             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //               content: Text("Internet not Connected"),
    //               backgroundColor: Colors.red,
    //             ));
    //           }
    //         },
    //         builder: (context, state) {
    //           if (state is InternetGainedState) {
    //             return Text("connected");
    //           } else if (state is InternetLostState) {
    //             return Text("Not Connected");
    //           } else {
    //             return Text("Loading");
    //           }
    //         },
    //       ),
    //       //bloc builder is used for some display on Screen
    //       // where as listneer is used for some background task
    //       // we can use bloc consumer if want to use a mixture of builder and listener
    //       // child: BlocBuilder<InternetBloc, InternetState>(
    //       // builder: (context, state) {
    //       //   if (state is InternetGainedState) {
    //       //     return Text("connected");
    //       //   } else if (state is InternetLostState) {
    //       //     return Text("Not Connected");
    //       //   } else {
    //       //     return Text("Loading");
    //       //   }
    //       // },
    //       // ),
    //     ),
    //   );
    // }

    //============================================================================

    return Scaffold(
      body: Center(
          child: BlocConsumer<InternetCubit, InternetSateCubit>(
        builder: (context, state) {
          if (state == InternetSateCubit.gained) {
            return Text("conneceted");
          } else {
            return Text('not Connected');
          }
        },
        listener: (context, state) {
          if (state == InternetSateCubit.gained) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Connected"),
              backgroundColor: Colors.green,
            ));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(" not Connected"),
              backgroundColor: Colors.red,
            ));
          }
        },
      )),
    );
  }
}
