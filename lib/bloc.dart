import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

// Events
abstract class DropdownEvent extends Equatable {}

class DropdownChanged extends DropdownEvent {
  final String selectedValue;

  DropdownChanged(this.selectedValue);

  @override
  List<Object?> get props => [selectedValue];
}

// States
abstract class DropdownState extends Equatable {}

class DropdownInitialState extends DropdownState {
  @override
  List<Object?> get props => [];
}

class DropdownChangedState extends DropdownState {
  final String selectedValue;

  DropdownChangedState(this.selectedValue);

  @override
  List<Object?> get props => [selectedValue];
}

// BLoC
class DropdownBloc extends Bloc<DropdownEvent, DropdownState> {
  String selectedValue = "Option 1"; // Initial value

  DropdownBloc() : super(DropdownInitialState()) {
    on<DropdownChanged>((event, emit) {
      if (event is DropdownChanged) {
        selectedValue = event.selectedValue;
        emit(DropdownChangedState(selectedValue));
      }
    });
  }

  @override
  Stream<DropdownState> mapEventToState(DropdownEvent event) async* {
    // Your existing event mapping logic goes here (if needed)
  }
}
