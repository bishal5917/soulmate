import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'choose_hobbies_state.dart';

class ChooseHobbiesCubit extends Cubit<String> {
  ChooseHobbiesCubit() : super("initial");

  final List<String> _selectedInterests = [];

  bool isSelected(interest) {
    final isSelected = _selectedInterests.contains(interest);
    return isSelected;
  }

  void addOrRemoveInterest(String val) {
    if (isSelected(val)) {
      _selectedInterests.remove(val);
      emit("$val removed");
    } else {
      _selectedInterests.add(val);
      emit("$val added");
    }
  }

  List<String> get selectedInterests => _selectedInterests;
}
