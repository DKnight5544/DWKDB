CREATE PROCEDURE [ss].[PartnershipDancer_SelectByPartnershipID]
	@PartnerShipID int
AS

	select *
	from ss.PartnershipDancer pd
	where pd.PartnershipID = @PartnerShipID
	;

RETURN 0
