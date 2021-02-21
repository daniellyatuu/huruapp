import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huruapp/src/bloc/bloc_files.dart';
import 'package:huruapp/src/model/model_files.dart';
import 'package:huruapp/src/repository/repository_files.dart';

class InformationBloc extends Bloc<InformationEvents, InformationStates> {
  InformationBloc() : super(InfoLoading());

  @override
  Stream<InformationStates> mapEventToState(InformationEvents event) async* {
    try {
      final List<Article> _article = await InformationApiClient().getInfoData();

      yield InfoSuccess(
        articles: _article,
      );
    } catch (_) {
      yield InfoError();
    }
  }
}
