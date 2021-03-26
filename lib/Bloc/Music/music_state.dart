part of 'music_bloc.dart';

abstract class MusicState extends Equatable {
  const MusicState();
}

class MusicInitial extends MusicState {
  @override
  List<Object> get props => [];
}

class MusicLoding extends MusicState {
  @override
  List<Object> get props => [];
}

class MusicLoded extends MusicState {
  final Music responseUsers;

  //This will initialise object direactly
  const MusicLoded({@required this.responseUsers})
      : assert(responseUsers != null);

  @override
  List<Object> get props => [];
}

class MusicError extends MusicState {
  String message;
  MusicError({@required this.message});
  @override
  List<Object> get props => [message];
}
