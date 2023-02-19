@EndUserText.label: 'Suplementos'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true

define view entity Z2460_C_BOOKSUP_JCOR
  //provider contract transactional_query
  as projection on Z2460_I_BOOKSUP_JCOR
{
  key TravelId,
  key BookingId,
  key BookingSupplementId,
      SupplementId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      CurrencyCode,
      LastChangedAt,
      /* Associations */
      _Travel  : redirected to Z2460_C_TRAVEL_JCOR,
      _Booking : redirected to parent Z2460_C_BOOKING_JCOR,
      _Product,
      _SupplementText

}
