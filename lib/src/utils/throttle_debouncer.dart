import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

EventTransformer<E> throttleConcurrent<E>(Duration duration) {
  return (events, mapper) {
    return concurrent<E>().call(events.throttle(duration), mapper);
  };
}

EventTransformer<E> throttleSequential<E>(Duration duration) {
  return (events, mapper) {
    return sequential<E>().call(events.throttle(duration), mapper);
  };
}

EventTransformer<E> throttleRestartable<E>(Duration duration) {
  return (events, mapper) {
    return restartable<E>().call(events.throttle(duration), mapper);
  };
}
