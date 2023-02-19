@EndUserText.label: 'Travel Projection'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@Metadata.allowExtensions: true

define root view entity Z2460_C_TRAVEL_JCOR
provider contract transactional_query
  as projection on Z2460_I_TRAVEL_JCOR
{
  key TravelId,
      AgencyId,
      CustomerId,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      CurrencyCode,
      Description,
      OverallStatus,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      /* Associations */
      _Agency,
      _Booking: redirected to composition child Z2460_C_BOOKING_JCOR,
      _Currency,
      _Customer
}
