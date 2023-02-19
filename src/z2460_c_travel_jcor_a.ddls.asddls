@EndUserText.label: 'Travel Projection'
@AccessControl.authorizationCheck: #NOT_REQUIRED

@Metadata.allowExtensions: true

define root view entity Z2460_C_TRAVEL_JCOR_A
  provider contract transactional_query
  as projection on Z2460_I_TRAVEL_JCOR
{
  key TravelId,
      AgencyId,
      _Agency.Name       as AgencyName,
      CustomerId,
      _Customer.LastName as CustomerName,
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
      _Booking : redirected to composition child Z2460_C_BOOKING_JCOR_A,
      _Customer
}
