

CREATE PROCEDURE [PRD].[CreateOtherColorsRelations]
AS
BEGIN
	MERGE PRD.RelatedProduct AS OtherColorsTarget
	USING (
		SELECT TOP 9223372036854775807 'O' AS RelationType
			,P.ID AS ProductID
			,P2.ID AS RelatedProductID
		FROM PRD.Product P
		INNER JOIN PRD.Product P2 ON LEFT(P.ExternalSystemCode, LEN(P.ExternalSystemCode)-4) = LEFT(P2.ExternalSystemCode, LEN(P2.ExternalSystemCode)-4)
		WHERE p.ID <> p2.ID
		ORDER BY P.ID
		) AS OtherColorsSource
		ON OtherColorsTarget.ProductID = OtherColorsSource.ProductID
			AND OtherColorsTarget.RelatedProductID = OtherColorsSource.RelatedProductID
			AND OtherColorsTarget.RelationType = 'O'
	WHEN NOT MATCHED BY TARGET
		THEN
			INSERT (
				RelationType
				,ProductID
				,RelatedProductID
				)
			VALUES (
				OtherColorsSource.RelationType
				,OtherColorsSource.ProductID
				,OtherColorsSource.RelatedProductID
				)
	WHEN NOT MATCHED BY SOURCE
		AND OtherColorsTarget.RelationType = 'O'
		THEN
			DELETE;
END