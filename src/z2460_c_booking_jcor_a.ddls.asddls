@EndUserText.label: 'Booking Projection'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true

define view entity Z2460_C_BOOKING_JCOR_A
//provider contract transactional_query
  as projection on Z2460_I_BOOKING_JCOR
{
  key TravelId,
  key BookingId,
      BookingDate,
      CustomerId,
      CarrierId,
      ConnectionId,
      FlightDate,
      FlightPrice,
      CurrencyCode,
      BookingStatus,
      LastChangedAt,
      /* Associations */    
       _Carrier,
      _Customer,
      _Travel : redirected to parent Z2460_C_TRAVEL_JCOR_A
}
