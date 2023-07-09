import 'package:hooks_riverpod/hooks_riverpod.dart';

enum Gender { Male, Female }

class RegisterState {
  late String? name;
  late Gender? gender;
  late DateTime? birth;
  late String? location;

  RegisterState(
      {required this.name,
      required this.gender,
      required this.birth,
      required this.location});

  clone() {
    return RegisterState(
        name: name, gender: gender, birth: birth, location: location);
  }
}

class RegisterStateNotifier extends StateNotifier<RegisterState> {
  RegisterStateNotifier()
      : super(RegisterState(
            name: "",
            gender: Gender.Male,
            birth: DateTime.now(),
            location: ""));

  void updateName(String name) {
    state = state.clone()..name = name;
  }

  void updateGender(Gender gender) {
    state = state.clone()..gender = gender;
  }

  void updateBirth(DateTime birth) {
    state = state.clone()..birth = birth;
  }

  void updateLocation(String location) {
    state = state.clone()..location = location;
  }
}

StateNotifierProvider<RegisterStateNotifier, RegisterState>
    registerStateProvider =
    StateNotifierProvider<RegisterStateNotifier, RegisterState>(
        (ref) => RegisterStateNotifier());

RegisterState getRegisterState(WidgetRef ref) =>
    ref.watch(registerStateProvider);

RegisterStateNotifier getRegisterStateProvider(WidgetRef ref) =>
    ref.read(registerStateProvider.notifier);
