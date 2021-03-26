part of 'song_bloc.dart';

abstract class SongState extends Equatable {
  const SongState();
}

class SongInitial extends SongState {
  @override
  List<Object> get props => [];
}

class SongLoding extends SongState {
  @override
  List<Object> get props => [];
}

class SongLoded extends SongState {
  Lyrics responcesong;

  SongLoded({
    this.responcesong,
  }) : assert(responcesong != null);
  @override
  List<Object> get props => [];
}
