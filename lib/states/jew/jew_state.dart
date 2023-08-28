part of 'jew_cubit.dart';

@immutable
class JewState {
  final List<Jew> jewList;

  const JewState({required this.jewList});

  const JewState.initial(List<Jew> jewList) : this(jewList: jewList);

  @override
  List<Object?> get props => [jewList];

  JewState copyWith({List<Jew>? jewList}) {
    return JewState(jewList: jewList ?? this.jewList);
  }
}
