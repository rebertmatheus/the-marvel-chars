// Mocks generated by Mockito 5.4.0 from annotations
// in the_marvel_chars/test/characters_view_model_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:result_dart/result_dart.dart' as _i2;
import 'package:the_marvel_chars/src/features/characters/model/character.dart'
    as _i5;
import 'package:the_marvel_chars/src/features/characters/repository/characters_repository.dart'
    as _i3;
import 'package:the_marvel_chars/src/utils/exceptions/characters_exception.dart'
    as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeResult_0<S extends Object, F extends Object> extends _i1.SmartFake
    implements _i2.Result<S, F> {
  _FakeResult_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [ICharactersRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockICharactersRepository extends _i1.Mock
    implements _i3.ICharactersRepository {
  @override
  _i4.Future<_i2.Result<List<_i5.Character>, _i6.CharactersException>> getAll(
          {required Map<String, dynamic>? params}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAll,
          [],
          {#params: params},
        ),
        returnValue: _i4.Future<
                _i2.Result<List<_i5.Character>, _i6.CharactersException>>.value(
            _FakeResult_0<List<_i5.Character>, _i6.CharactersException>(
          this,
          Invocation.method(
            #getAll,
            [],
            {#params: params},
          ),
        )),
        returnValueForMissingStub: _i4.Future<
                _i2.Result<List<_i5.Character>, _i6.CharactersException>>.value(
            _FakeResult_0<List<_i5.Character>, _i6.CharactersException>(
          this,
          Invocation.method(
            #getAll,
            [],
            {#params: params},
          ),
        )),
      ) as _i4
          .Future<_i2.Result<List<_i5.Character>, _i6.CharactersException>>);
}
