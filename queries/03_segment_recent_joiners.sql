SELECT
  _adlsplatformapac.customerID AS member_id,
  CONCAT(_adlsplatformapac.firstName, ' ', _adlsplatformapac.lastName) AS full_name,
  _adlsplatformapac.emailAddress AS email,
  _adlsplatformapac.loyaltyTier AS tier,
  _adlsplatformapac.totalPointsEarned AS lifetime_points,
  _adlsplatformapac.loyaltyJoinDate AS join_date
FROM
  SanD_ShopStream_Loyalty_Historical
WHERE
  _adlsplatformapac.totalPointsEarned > 3000
  AND _adlsplatformapac.loyaltyTier IN ('gold', 'platinum')
