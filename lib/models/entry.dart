import 'package:dear_diary/models/models.dart';
import 'package:equatable/equatable.dart';

class Entry extends Equatable {
  final String title;
  final String description;
  final User user;

  const Entry({
    this.title,
    this.description,
    this.user,
  });

  @override
  List<Object> get props => [title, description];
}
