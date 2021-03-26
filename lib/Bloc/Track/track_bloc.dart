import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:musicb/Models/Song.dart';
import 'package:musicb/Models/Trackdetail.dart';
import 'package:musicb/Repository/Trackdetailrepo.dart';
part 'track_event.dart';
part 'track_state.dart';

class TrackBloc extends Bloc<TrackEvent, TrackState> {
  TrackdetailRepo trackdetailRepo;

  TrackBloc({this.trackdetailRepo}) : super(TrackInitial());

  @override
  Stream<TrackState> mapEventToState(
    TrackEvent event,
  ) async* {
    if (event is Fetchtrack) {
      yield Trackloding();
      try {
        final Trackdetail responcetrack =
            await trackdetailRepo.gettrackdetail(event.trackid);
        yield TrackLoded(responcetrack: responcetrack);
        // final Lyrics responcesong = await songRepo.getsong(event.trackid);
        // yield TrackLoded(responcesong: responcesong);
      } catch (e) {}
    }
  }
}
