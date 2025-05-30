SELECT
  _adlsplatformapac.customerID AS member_id,
  CONCAT(_adlsplatformapac.firstName, ' ', _adlsplatformapac.lastName) AS full_name,
  _adlsplatformapac.emailAddress AS email,
  _adlsplatformapac.loyaltyTier AS tier,
  _adlsplatformapac.loyaltyJoinDate AS join_date,
  _adlsplatformapac.totalPointsEarned AS lifetime_points,
  _adlsplatformapac.phoneNumber AS phone
FROM
  SanD_ShopStream_Loyalty_Historical
LIMIT 50
