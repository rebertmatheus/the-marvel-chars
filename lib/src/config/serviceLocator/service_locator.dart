import 'package:get_it/get_it.dart';
import 'package:the_marvel_chars/src/data/datasources/interface/datasources.dart';
import 'package:the_marvel_chars/src/data/datasources/remote/api.dart';
import 'package:the_marvel_chars/src/features/characters/presentation/controllers/characters_view_controller.dart';
import 'package:the_marvel_chars/src/features/characters/presentation/controllers/characters_view_controller_imp.dart';
import 'package:the_marvel_chars/src/features/characters/repository/characters_repository.dart';
import 'package:the_marvel_chars/src/features/characters/repository/characters_repository_imp.dart';
import 'package:the_marvel_chars/src/features/characters/view_model/characters_view_model.dart';
import 'package:the_marvel_chars/src/features/characters/view_model/characters_view_model_imp.dart';

class ServiceLocator {
  static final GetIt _getIt = GetIt.I;

  static void setupServiceLocator() {
    _getIt.registerLazySingleton<IDataSources>(() => API());
    _getIt.registerLazySingleton<ICharactersRepository>(() => CharactersRepository(api: _getIt<IDataSources>()));
    _getIt.registerFactory<ICharactersViewModel>(
      () => CharactersViewModel(
        repository: _getIt<ICharactersRepository>(),
      ),
    );
    _getIt.registerFactory<ICharactersViewController>(
      () => CharactersViewController(
        viewModel: _getIt<ICharactersViewModel>(),
      ),
    );
  }

  static T get<T extends Object>() {
    return _getIt<T>();
  }
}
