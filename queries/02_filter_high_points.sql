SELECT
  _adlsplatformapac.customerID AS member_id,
  CONCAT(_adlsplatformapac.firstName, ' ', _adlsplatformapac.lastName) AS full_name,
  _adlsplatformapac.loyaltyTier AS tier,
  _adlsplatformapac.totalPointsEarned AS lifetime_points
FROM
  SanD_ShopStream_Loyalty_Historical
WHERE
  _adlsplatformapac.loyaltyTier = 'platinum'
