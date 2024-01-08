import 'package:dropdown_using_flutterbloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropdownWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DropdownBloc(),
      child: DropdownScreen(),
    );
  }
}

class DropdownScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<DropdownBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropdown with BLoC'),
      ),
      body: Center(
        child: BlocBuilder<DropdownBloc, DropdownState>(
          builder: (context, state) {
            return Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.045,
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: state is DropdownChangedState
                      ? state.selectedValue
                      : null,
                  icon: const Icon(Icons.keyboard_arrow_down, size: 30),
                  items:
                      ['Option 1', 'Option 2', 'Option 3'].map((String item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    bloc.add(DropdownChanged(newValue!));
                  },
                  dropdownColor: Colors.black,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
