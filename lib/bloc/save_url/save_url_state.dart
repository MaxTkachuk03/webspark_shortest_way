// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'save_url_bloc.dart';

class SaveUrlState extends Equatable {
  const SaveUrlState({
    this.url = "",
  });

  final String url;

  @override
  List<Object> get props => [url];

  SaveUrlState copyWith({
    String? url,
  }) {
    return SaveUrlState(
      url: url ?? this.url,
    );
  }
}
