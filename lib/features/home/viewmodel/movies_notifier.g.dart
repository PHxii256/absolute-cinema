// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$moviesHash() => r'f1efe0bb602c47ff30789f0f7cd220bc2b4862e9';

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

abstract class _$Movies extends BuildlessAsyncNotifier<List<MovieData>> {
  late final InitMovieData initData;

  FutureOr<List<MovieData>> build(InitMovieData initData);
}

/// See also [Movies].
@ProviderFor(Movies)
const moviesProvider = MoviesFamily();

/// See also [Movies].
class MoviesFamily extends Family<AsyncValue<List<MovieData>>> {
  /// See also [Movies].
  const MoviesFamily();

  /// See also [Movies].
  MoviesProvider call(InitMovieData initData) {
    return MoviesProvider(initData);
  }

  @override
  MoviesProvider getProviderOverride(covariant MoviesProvider provider) {
    return call(provider.initData);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'moviesProvider';
}

/// See also [Movies].
class MoviesProvider
    extends AsyncNotifierProviderImpl<Movies, List<MovieData>> {
  /// See also [Movies].
  MoviesProvider(InitMovieData initData)
    : this._internal(
        () => Movies()..initData = initData,
        from: moviesProvider,
        name: r'moviesProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product') ? null : _$moviesHash,
        dependencies: MoviesFamily._dependencies,
        allTransitiveDependencies: MoviesFamily._allTransitiveDependencies,
        initData: initData,
      );

  MoviesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.initData,
  }) : super.internal();

  final InitMovieData initData;

  @override
  FutureOr<List<MovieData>> runNotifierBuild(covariant Movies notifier) {
    return notifier.build(initData);
  }

  @override
  Override overrideWith(Movies Function() create) {
    return ProviderOverride(
      origin: this,
      override: MoviesProvider._internal(
        () => create()..initData = initData,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        initData: initData,
      ),
    );
  }

  @override
  AsyncNotifierProviderElement<Movies, List<MovieData>> createElement() {
    return _MoviesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MoviesProvider && other.initData == initData;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, initData.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MoviesRef on AsyncNotifierProviderRef<List<MovieData>> {
  /// The parameter `initData` of this provider.
  InitMovieData get initData;
}

class _MoviesProviderElement
    extends AsyncNotifierProviderElement<Movies, List<MovieData>>
    with MoviesRef {
  _MoviesProviderElement(super.provider);

  @override
  InitMovieData get initData => (origin as MoviesProvider).initData;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
