import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webspark_shortest_way/repository/repository.dart';

part 'save_url_event.dart';
part 'save_url_state.dart';

class SaveUrlBloc extends Bloc<URLEvent, SaveUrlState> {
  final AbstractLocal saveUrlLocal;
  SaveUrlBloc(this.saveUrlLocal) : super(const SaveUrlState()) {
    on<SaveUrlEvent>((event, emit) {
      saveUrlLocal.saveURL(event.url);
      state.copyWith(url: event.url);
    });

    on<GetUrlEvent>((event, emit) {
      saveUrlLocal.getURL();
    });
  }
}
