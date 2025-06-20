part of 'lang_cubit.dart';

abstract class LangState extends Equatable {
  final String locale;
  const LangState(this.locale);

  @override
  List<Object> get props => [];
}

class LangInitial extends LangState {
  const LangInitial() : super('en');
}

class LangChanged extends LangState {
  const LangChanged(super.locale);

  @override
  List<Object> get props => [locale];
}
