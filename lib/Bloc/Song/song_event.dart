part of 'song_bloc.dart';

abstract class SongEvent extends Equatable {}

class FetchSong extends SongEvent {
  int songid;
  FetchSong({@required this.songid});
  @override
  List<Object> get props => null;
}
