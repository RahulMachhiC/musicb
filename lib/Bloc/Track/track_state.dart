part of 'track_bloc.dart';

abstract class TrackState extends Equatable {
  const TrackState();
}

class TrackInitial extends TrackState {
  @override
  List<Object> get props => [];
}

class Trackloding extends TrackState {
  @override
  List<Object> get props => [];
}

class TrackLoded extends TrackState {
  final Trackdetail responcetrack;
  Lyrics responcesong;
  TrackLoded({this.responcetrack, this.responcesong});
  @override
  List<Object> get props => [];
}
