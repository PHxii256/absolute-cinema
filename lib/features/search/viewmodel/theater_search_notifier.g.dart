// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theater_search_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$theaterSearchHash() => r'cbc55ac8b2fd0417c7746db6cf8957806de6184b';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$TheaterSearch
    extends BuildlessAsyncNotifier<List<MovieAiringInfo>> {
  late final int movieId;

  FutureOr<List<MovieAiringInfo>> build({required int movieId});
}

/// See also [TheaterSearch].
@ProviderFor(TheaterSearch)
const theaterSearchProvider = TheaterSearchFamily();

/// See also [TheaterSearch].
class TheaterSearchFamily extends Family<AsyncValue<List<MovieAiringInfo>>> {
  /// See also [TheaterSearch].
  const TheaterSearchFamily();

  /// See also [TheaterSearch].
  TheaterSearchProvider call({required int movieId}) {
    return TheaterSearchProvider(movieId: movieId);
  }

  @override
  TheaterSearchProvider getProviderOverride(
    covariant TheaterSearchProvider provider,
  ) {
    return call(movieId: provider.movieId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'theaterSearchProvider';
}

/// See also [TheaterSearch].
class TheaterSearchProvider
    extends AsyncNotifierProviderImpl<TheaterSearch, List<MovieAiringInfo>> {
  /// See also [TheaterSearch].
  TheaterSearchProvider({required int movieId})
    : this._internal(
        () => TheaterSearch()..movieId = movieId,
        from: theaterSearchProvider,
        name: r'theaterSearchProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$theaterSearchHash,
        dependencies: TheaterSearchFamily._dependencies,
        allTransitiveDependencies:
            TheaterSearchFamily._allTransitiveDependencies,
        movieId: movieId,
      );

  TheaterSearchProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.movieId,
  }) : super.internal();

  final int movieId;

  @override
  FutureOr<List<MovieAiringInfo>> runNotifierBuild(
    covariant TheaterSearch notifier,
  ) {
    return notifier.build(movieId: movieId);
  }

  @override
  Override overrideWith(TheaterSearch Function() create) {
    return ProviderOverride(
      origin: this,
      override: TheaterSearchProvider._internal(
        () => create()..movieId = movieId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        movieId: movieId,
      ),
    );
  }

  @override
  AsyncNotifierProviderElement<TheaterSearch, List<MovieAiringInfo>>
  createElement() {
    return _TheaterSearchProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TheaterSearchProvider && other.movieId == movieId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movieId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TheaterSearchRef on AsyncNotifierProviderRef<List<MovieAiringInfo>> {
  /// The parameter `movieId` of this provider.
  int get movieId;
}

class _TheaterSearchProviderElement
    extends AsyncNotifierProviderElement<TheaterSearch, List<MovieAiringInfo>>
    with TheaterSearchRef {
  _TheaterSearchProviderElement(super.provider);

  @override
  int get movieId => (origin as TheaterSearchProvider).movieId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
