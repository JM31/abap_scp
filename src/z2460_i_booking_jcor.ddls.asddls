@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z2460_I_BOOKING_JCOR
  as select from z2460_boo_jcor as Booking
  composition [0..*] of Z2460_I_BOOKSUP_JCOR as _BookingSupplement
  association to parent Z2460_I_TRAVEL_JCOR  as _Travel on $projection.TravelId = _Travel.TravelId
  association [1..1] to /DMO/I_Customer    as _Customer     on $projection.CustomerId = _Customer.CustomerID
  association [1..1] to /DMO/I_Carrier     as _Carrier      on $projection.CarrierId = _Carrier.AirlineID
  association [1..*] to /DMO/I_Connection  as _Connection   on $projection.ConnectionId = _Connection.ConnectionID
  
{
  key travel_id       as TravelId,
  key booking_id      as BookingId,
      booking_date    as BookingDate,
      customer_id     as CustomerId,
      carrier_id      as CarrierId,
      connection_id   as ConnectionId,
      flight_date     as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      flight_price    as FlightPrice,
      currency_code   as CurrencyCode,
      booking_status  as BookingStatus,
      last_changed_at as LastChangedAt,
      _Travel,
      _BookingSupplement,
      _Customer,
      _Carrier,
      _Connection
}
