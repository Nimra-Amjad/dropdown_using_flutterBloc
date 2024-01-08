import 'package:dropdown_using_flutterbloc/bloc.dart';
import 'package:dropdown_using_flutterbloc/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DropdownBloc>(
          create: (context) => DropdownBloc(),
        ),
      ],
      child: MaterialApp(
        home: DropdownWidget(),
      ),
    );
  }
}
