// ignore_for_file: avoid_redundant_argument_values
import 'package:test/test.dart';
import 'package:todos_data_source/todos_data_source.dart';

void main() {
  group('Todo', () {
    Todo createSubject({
      String? id = 'id',
      String title = 'title',
      String description = 'description',
      bool isCompleted = true,
    }) {
      return Todo(
        id: id,
        title: title,
        description: description,
        isCompleted: isCompleted,
      );
    }

    group('constructor', () {
      test('works correctly', () {
        expect(
          createSubject,
          returnsNormally,
        );
      });

      test('throws AssertionError when id is empty', () {
        expect(
          () => createSubject(id: ''),
          throwsA(isA<AssertionError>()),
        );
      });
    });

    test('supports value equality', () {
      expect(
        createSubject(),
        equals(createSubject()),
      );
    });

    test('props are correct', () {
      expect(
        createSubject().props,
        equals([
          'id', // id
          'title', // title
          'description', // description
          true, // isCompleted
        ]),
      );
    });

    group('copyWith', () {
      test('returns the same object if not arguments are provided', () {
        expect(
          createSubject().copyWith(),
          equals(createSubject()),
        );
      });

      test('retains the old value for every parameter if null is provided', () {
        expect(
          createSubject().copyWith(
            id: null,
            title: null,
            description: null,
            isCompleted: null,
          ),
          equals(createSubject()),
        );
      });

      test('replaces every non-null parameter', () {
        expect(
          createSubject().copyWith(
            id: 'new id',
            title: 'new title',
            description: 'new description',
            isCompleted: false,
          ),
          equals(
            createSubject(
              id: 'new id',
              title: 'new title',
              description: 'new description',
              isCompleted: false,
            ),
          ),
        );
      });
    });

    group('fromJson', () {
      test('works correctly', () {
        expect(
          Todo.fromJson(<String, dynamic>{
            'id': 'id',
            'title': 'title',
            'description': 'description',
            'isCompleted': true,
          }),
          equals(createSubject()),
        );
      });
    });

    group('toJson', () {
      test('works correctly', () {
        expect(
          createSubject().toJson(),
          equals(<String, dynamic>{
            'id': 'id',
            'title': 'title',
            'description': 'description',
            'isCompleted': true,
          }),
        );
      });
    });
  });
}