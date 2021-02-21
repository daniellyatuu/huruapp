import 'package:equatable/equatable.dart';
import 'package:huruapp/src/model/article.dart';

abstract class InformationStates extends Equatable {
  const InformationStates();

  @override
  List<Object> get props => [];
}

class InfoLoading extends InformationStates {}

class InfoSuccess extends InformationStates {
  final List<Article> articles;

  const InfoSuccess({this.articles});

  @override
  List<Object> get props => [articles];
}

class InfoError extends InformationStates {}
