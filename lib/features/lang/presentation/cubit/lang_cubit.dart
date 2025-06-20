import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'lang_state.dart';

class LangCubit extends HydratedCubit<LangState> {
  LangCubit() : super(LangInitial());

  @override
  LangState? fromJson(Map<String, dynamic> json) {
    return LangChanged(json['locale'] as String);
  }

  @override
  Map<String, dynamic>? toJson(LangState state) {
    return {'locale': state.locale};
  }

  void changeLocale(String newLocale) {
    emit(LangChanged(newLocale));
  }
}
