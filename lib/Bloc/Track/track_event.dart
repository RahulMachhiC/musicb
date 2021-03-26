part of 'track_bloc.dart';

abstract class TrackEvent extends Equatable {}

class Fetchtrack extends TrackEvent {
  int trackid;
  Fetchtrack({@required this.trackid});
  @override
  List<Object> get props => null;
}
