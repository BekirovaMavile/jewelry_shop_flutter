import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/_data.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit()
      : super(CategoryState.initial(AppData.jewItems, AppData.categories),
  );

  onCategoryTab(JewCategory category) {
    final List<JewCategory> categories = state.jewCategories.map((element){
      if (element == category) {
        return category.copyWith(isSelected: true);
      }
      return element.copyWith(isSelected: false);
    }).toList();

    if (category.type == JewType.all) {
      emit(CategoryState(
          jewCategories: categories, jews: AppData.jewItems));
    } else {
      final List<Jew> jews = AppData.jewItems
          .where((item) => item.type == category.type)
          .toList();
      emit(CategoryState(jews: jews, jewCategories: categories));
    }
  }

}
