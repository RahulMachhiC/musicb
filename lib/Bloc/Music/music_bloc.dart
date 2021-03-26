import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:musicb/Models/Music.dart';
import 'package:musicb/Repository/LyricsRepo.dart';
import 'package:musicb/Repository/SongRepo.dart';

part 'music_event.dart';
part 'music_state.dart';

class MusicBloc extends Bloc<MusicEvent, MusicState> {
  LyricsRepo lyricsRepo;
  SongRepo songRepo;
  MusicBloc({this.lyricsRepo}) : super(MusicInitial());

  @override
  Stream<MusicState> mapEventToState(
    MusicEvent event,
  ) async* {
    if (event is Fetchmusic) {
      yield MusicLoding();
      try {
        final Music responseUsers = await lyricsRepo.gettrack();
        yield MusicLoded(responseUsers: responseUsers);
      } catch (e) {
        print(e);
      }
    }
  }
}
