// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seat_layout_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$seatLayoutHash() => r'b2d1252d0e3e84c5fa21821036fded4b037a1208';

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

abstract class _$SeatLayout
    extends BuildlessAutoDisposeAsyncNotifier<List<IsleLayoutData>> {
  late final MovieAiringInfo airingInfo;

  FutureOr<List<IsleLayoutData>> build(MovieAiringInfo airingInfo);
}

/// See also [SeatLayout].
@ProviderFor(SeatLayout)
const seatLayoutProvider = SeatLayoutFamily();

/// See also [SeatLayout].
class SeatLayoutFamily extends Family<AsyncValue<List<IsleLayoutData>>> {
  /// See also [SeatLayout].
  const SeatLayoutFamily();

  /// See also [SeatLayout].
  SeatLayoutProvider call(MovieAiringInfo airingInfo) {
    return SeatLayoutProvider(airingInfo);
  }

  @override
  SeatLayoutProvider getProviderOverride(
    covariant SeatLayoutProvider provider,
  ) {
    return call(provider.airingInfo);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'seatLayoutProvider';
}

/// See also [SeatLayout].
class SeatLayoutProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<SeatLayout, List<IsleLayoutData>> {
  /// See also [SeatLayout].
  SeatLayoutProvider(MovieAiringInfo airingInfo)
    : this._internal(
        () => SeatLayout()..airingInfo = airingInfo,
        from: seatLayoutProvider,
        name: r'seatLayoutProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$seatLayoutHash,
        dependencies: SeatLayoutFamily._dependencies,
        allTransitiveDependencies: SeatLayoutFamily._allTransitiveDependencies,
        airingInfo: airingInfo,
      );

  SeatLayoutProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.airingInfo,
  }) : super.internal();

  final MovieAiringInfo airingInfo;

  @override
  FutureOr<List<IsleLayoutData>> runNotifierBuild(
    covariant SeatLayout notifier,
  ) {
    return notifier.build(airingInfo);
  }

  @override
  Override overrideWith(SeatLayout Function() create) {
    return ProviderOverride(
      origin: this,
      override: SeatLayoutProvider._internal(
        () => create()..airingInfo = airingInfo,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        airingInfo: airingInfo,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<SeatLayout, List<IsleLayoutData>>
  createElement() {
    return _SeatLayoutProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SeatLayoutProvider && other.airingInfo == airingInfo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, airingInfo.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SeatLayoutRef
    on AutoDisposeAsyncNotifierProviderRef<List<IsleLayoutData>> {
  /// The parameter `airingInfo` of this provider.
  MovieAiringInfo get airingInfo;
}

class _SeatLayoutProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          SeatLayout,
          List<IsleLayoutData>
        >
    with SeatLayoutRef {
  _SeatLayoutProviderElement(super.provider);

  @override
  MovieAiringInfo get airingInfo => (origin as SeatLayoutProvider).airingInfo;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
