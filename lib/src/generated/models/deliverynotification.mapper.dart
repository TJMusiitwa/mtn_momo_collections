// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'deliverynotification.dart';

class DeliverynotificationMapper extends ClassMapperBase<Deliverynotification> {
  DeliverynotificationMapper._();

  static DeliverynotificationMapper? _instance;
  static DeliverynotificationMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DeliverynotificationMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Deliverynotification';

  static String? _$notificationMessage(Deliverynotification v) =>
      v.notificationMessage;
  static const Field<Deliverynotification, String> _f$notificationMessage =
      Field('notificationMessage', _$notificationMessage, opt: true);

  @override
  final MappableFields<Deliverynotification> fields = const {
    #notificationMessage: _f$notificationMessage,
  };

  static Deliverynotification _instantiate(DecodingData data) {
    return Deliverynotification(
      notificationMessage: data.dec(_f$notificationMessage),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Deliverynotification fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Deliverynotification>(map);
  }

  static Deliverynotification fromJson(String json) {
    return ensureInitialized().decodeJson<Deliverynotification>(json);
  }
}

mixin DeliverynotificationMappable {
  String toJson() {
    return DeliverynotificationMapper.ensureInitialized()
        .encodeJson<Deliverynotification>(this as Deliverynotification);
  }

  Map<String, dynamic> toMap() {
    return DeliverynotificationMapper.ensureInitialized()
        .encodeMap<Deliverynotification>(this as Deliverynotification);
  }

  DeliverynotificationCopyWith<
    Deliverynotification,
    Deliverynotification,
    Deliverynotification
  >
  get copyWith =>
      _DeliverynotificationCopyWithImpl<
        Deliverynotification,
        Deliverynotification
      >(this as Deliverynotification, $identity, $identity);
  @override
  String toString() {
    return DeliverynotificationMapper.ensureInitialized().stringifyValue(
      this as Deliverynotification,
    );
  }

  @override
  bool operator ==(Object other) {
    return DeliverynotificationMapper.ensureInitialized().equalsValue(
      this as Deliverynotification,
      other,
    );
  }

  @override
  int get hashCode {
    return DeliverynotificationMapper.ensureInitialized().hashValue(
      this as Deliverynotification,
    );
  }
}

extension DeliverynotificationValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Deliverynotification, $Out> {
  DeliverynotificationCopyWith<$R, Deliverynotification, $Out>
  get $asDeliverynotification => $base.as(
    (v, t, t2) => _DeliverynotificationCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class DeliverynotificationCopyWith<
  $R,
  $In extends Deliverynotification,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? notificationMessage});
  DeliverynotificationCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _DeliverynotificationCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Deliverynotification, $Out>
    implements DeliverynotificationCopyWith<$R, Deliverynotification, $Out> {
  _DeliverynotificationCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Deliverynotification> $mapper =
      DeliverynotificationMapper.ensureInitialized();
  @override
  $R call({Object? notificationMessage = $none}) => $apply(
    FieldCopyWithData({
      if (notificationMessage != $none)
        #notificationMessage: notificationMessage,
    }),
  );
  @override
  Deliverynotification $make(CopyWithData data) => Deliverynotification(
    notificationMessage: data.get(
      #notificationMessage,
      or: $value.notificationMessage,
    ),
  );

  @override
  DeliverynotificationCopyWith<$R2, Deliverynotification, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _DeliverynotificationCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

