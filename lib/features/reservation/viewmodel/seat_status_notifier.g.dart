// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seat_status_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$seatStatusHash() => r'51051348d63fd761e56854406a4589248a26b63f';

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

abstract class _$SeatStatus
    extends BuildlessAutoDisposeStreamNotifier<List<SeatStatusData>> {
  late final int screeningId;

  Stream<List<SeatStatusData>> build(int screeningId);
}

/// See also [SeatStatus].
@ProviderFor(SeatStatus)
const seatStatusProvider = SeatStatusFamily();

/// See also [SeatStatus].
class SeatStatusFamily extends Family<AsyncValue<List<SeatStatusData>>> {
  /// See also [SeatStatus].
  const SeatStatusFamily();

  /// See also [SeatStatus].
  SeatStatusProvider call(int screeningId) {
    return SeatStatusProvider(screeningId);
  }

  @override
  SeatStatusProvider getProviderOverride(
    covariant SeatStatusProvider provider,
  ) {
    return call(provider.screeningId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'seatStatusProvider';
}

/// See also [SeatStatus].
class SeatStatusProvider
    extends
        AutoDisposeStreamNotifierProviderImpl<
          SeatStatus,
          List<SeatStatusData>
        > {
  /// See also [SeatStatus].
  SeatStatusProvider(int screeningId)
    : this._internal(
        () => SeatStatus()..screeningId = screeningId,
        from: seatStatusProvider,
        name: r'seatStatusProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$seatStatusHash,
        dependencies: SeatStatusFamily._dependencies,
        allTransitiveDependencies: SeatStatusFamily._allTransitiveDependencies,
        screeningId: screeningId,
      );

  SeatStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.screeningId,
  }) : super.internal();

  final int screeningId;

  @override
  Stream<List<SeatStatusData>> runNotifierBuild(covariant SeatStatus notifier) {
    return notifier.build(screeningId);
  }

  @override
  Override overrideWith(SeatStatus Function() create) {
    return ProviderOverride(
      origin: this,
      override: SeatStatusProvider._internal(
        () => create()..screeningId = screeningId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        screeningId: screeningId,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<SeatStatus, List<SeatStatusData>>
  createElement() {
    return _SeatStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SeatStatusProvider && other.screeningId == screeningId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, screeningId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SeatStatusRef
    on AutoDisposeStreamNotifierProviderRef<List<SeatStatusData>> {
  /// The parameter `screeningId` of this provider.
  int get screeningId;
}

class _SeatStatusProviderElement
    extends
        AutoDisposeStreamNotifierProviderElement<
          SeatStatus,
          List<SeatStatusData>
        >
    with SeatStatusRef {
  _SeatStatusProviderElement(super.provider);

  @override
  int get screeningId => (origin as SeatStatusProvider).screeningId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
