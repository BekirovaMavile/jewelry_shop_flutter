part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent {
  JewCategory get category;
}

class CategoryTap extends CategoryEvent{
  final JewCategory category;

  @override
  List<Object?> get props => [category];

  CategoryTap({required this.category});
}
