import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicb/Bloc/Song/song_bloc.dart';
import 'package:musicb/Models/Music.dart';

class LyricsScreen extends StatefulWidget {
  TrackList user;
  LyricsScreen(this.user);
  @override
  _LyricsScreenState createState() => _LyricsScreenState();
}

class _LyricsScreenState extends State<LyricsScreen> {
  SongBloc songBloc;

  @override
  void initState() {
    songBloc = BlocProvider.of<SongBloc>(context);
    songBloc.add(FetchSong(songid: widget.user.track.trackId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongBloc, SongState>(
      builder: (context, state) {
        if (state is SongLoded) {
          print(SongLoded());
          var lyriclist = state.responcesong;
          Container(
            child: Text(lyriclist.lyricsBody),
          );
        }
        return Container(
          color: Colors.white,
        );
      },
    );
  }
}
