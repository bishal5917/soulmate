import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:soulmate/src/core/development/console.dart';
import 'package:soulmate/src/features/Home/Repository/home_repository.dart';
import 'package:soulmate/src/features/Home/feed_request_model.dart';
import 'package:soulmate/src/services/local/secure_storage.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository;

  HomeCubit({required HomeRepository authRepository})
      : _homeRepository = authRepository,
        super(HomeState.initial());

  Future<void> loadFeed() async {
    emit(state.copyWith(status: HomeStatus.initial));
    try {
      final response =
          await _homeRepository.getFeed(AppSharedPreferences.getUserId);
      consolelog(response);
      emit(state.copyWith(status: HomeStatus.success, message: "Feed Loaded"));
    } catch (err) {
      consolelog(err.toString());
      emit(state.copyWith(status: HomeStatus.error, message: err.toString()));
    }
  }
}
