// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$actorNotifierHash() => r'010f8f8e9fe19f8a171ee0054e5665fa7bd18895';

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

abstract class _$ActorNotifier
    extends BuildlessAutoDisposeAsyncNotifier<List<ActorData>> {
  late final int movieId;

  FutureOr<List<ActorData>> build(int movieId);
}

/// See also [ActorNotifier].
@ProviderFor(ActorNotifier)
const actorNotifierProvider = ActorNotifierFamily();

/// See also [ActorNotifier].
class ActorNotifierFamily extends Family<AsyncValue<List<ActorData>>> {
  /// See also [ActorNotifier].
  const ActorNotifierFamily();

  /// See also [ActorNotifier].
  ActorNotifierProvider call(int movieId) {
    return ActorNotifierProvider(movieId);
  }

  @override
  ActorNotifierProvider getProviderOverride(
    covariant ActorNotifierProvider provider,
  ) {
    return call(provider.movieId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'actorNotifierProvider';
}

/// See also [ActorNotifier].
class ActorNotifierProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<ActorNotifier, List<ActorData>> {
  /// See also [ActorNotifier].
  ActorNotifierProvider(int movieId)
    : this._internal(
        () => ActorNotifier()..movieId = movieId,
        from: actorNotifierProvider,
        name: r'actorNotifierProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$actorNotifierHash,
        dependencies: ActorNotifierFamily._dependencies,
        allTransitiveDependencies:
            ActorNotifierFamily._allTransitiveDependencies,
        movieId: movieId,
      );

  ActorNotifierProvider._internal(
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
  FutureOr<List<ActorData>> runNotifierBuild(covariant ActorNotifier notifier) {
    return notifier.build(movieId);
  }

  @override
  Override overrideWith(ActorNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ActorNotifierProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<ActorNotifier, List<ActorData>>
  createElement() {
    return _ActorNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ActorNotifierProvider && other.movieId == movieId;
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
mixin ActorNotifierRef on AutoDisposeAsyncNotifierProviderRef<List<ActorData>> {
  /// The parameter `movieId` of this provider.
  int get movieId;
}

class _ActorNotifierProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<ActorNotifier, List<ActorData>>
    with ActorNotifierRef {
  _ActorNotifierProviderElement(super.provider);

  @override
  int get movieId => (origin as ActorNotifierProvider).movieId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
