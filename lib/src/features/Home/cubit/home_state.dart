// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

enum HomeStatus { initial, fetching, success, error }

class HomeState extends Equatable {
  final HomeStatus? status;
  final String? message;
  final List<FeedRequestModel>? feedReqModel;
  const HomeState(
      {this.status = HomeStatus.fetching, this.message, this.feedReqModel});

  @override
  List<Object?> get props => [status, message];

  HomeState copyWith({
    HomeStatus? status,
    String? message,
    List<FeedRequestModel>? feedReqModel,
  }) {
    return HomeState(
      status: status ?? this.status,
      message: message ?? this.message,
      feedReqModel: feedReqModel ?? this.feedReqModel,
    );
  }
}

class HomeInitial extends HomeState {}
