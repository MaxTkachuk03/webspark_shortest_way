part of 'save_url_bloc.dart';

abstract class URLEvent extends Equatable {}

class SaveUrlEvent extends URLEvent {
  SaveUrlEvent({required this.url});

  final String url;
  @override
  List<Object> get props => [url];
}

class GetUrlEvent extends URLEvent {
  GetUrlEvent();

  @override
  List<Object> get props => [];
}
