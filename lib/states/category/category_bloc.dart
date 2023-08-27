import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/_data.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc()
      : super(CategoryState.initial(AppData.jewItems, AppData.categories),
  ) {
    on<CategoryTap>(_onCategoryTab);
  }

  _onCategoryTab(CategoryEvent event, Emitter<CategoryState> emit) {
    final List<JewCategory> categories = state.jewCategories.map((element){
      if (element == event.category) {
        return event.category.copyWith(isSelected: true);
      }
      return element.copyWith(isSelected: false);
    }).toList();

    if (event.category.type == JewType.all) {
      emit(CategoryState(
          jewCategories: categories, jews: AppData.jewItems));
    } else {
      final List<Jew> jews = AppData.jewItems
          .where((item) => item.type == event.category.type)
          .toList();
      emit(CategoryState(jews: jews, jewCategories: categories));
    }
  }

}
