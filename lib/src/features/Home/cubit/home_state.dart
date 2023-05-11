part of 'home_cubit.dart';

enum HomeStatus { initial, success, error }

class HomeState extends Equatable {
  final HomeStatus? status;
  final String? message;
  final FeedRequestModel? feedReqModel;
  const HomeState(
      {this.status = HomeStatus.initial, this.message, this.feedReqModel});

  factory HomeState.initial() {
    return const HomeState(status: HomeStatus.initial, message: "");
  }

  HomeState copyWith(
      {HomeStatus? status,
      String? message,
      List<FeedRequestModel>? feedItems}) {
    return HomeState(
        status: status ?? this.status,
        message: message ?? this.message,
        feedReqModel: feedReqModel ?? feedReqModel);
  }

  @override
  List<Object?> get props => [status, message];
}

class HomeInitial extends HomeState {}
