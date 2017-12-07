CREATE PROCEDURE [ref].[GetDomainList]
AS
	SELECT d.DomainName
	FROM ref.Domain d
	ORDER BY 1
RETURN 0
