import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huruapp/src/bloc/bloc_files.dart';
import 'package:huruapp/src/model/model_files.dart';
import 'package:huruapp/src/repository/repository_files.dart';

class ServiceBloc extends Bloc<ServiceEvents, ServiceStates> {
  ServiceBloc() : super(ServiceLoading());

  @override
  Stream<ServiceStates> mapEventToState(ServiceEvents event) async* {
    try {
      final List<Service> _service = await ServiceApiClient().getServiceData();

      yield ServiceSuccess(
        services: _service,
      );
    } catch (_) {
      yield ServiceError();
    }
  }
}
