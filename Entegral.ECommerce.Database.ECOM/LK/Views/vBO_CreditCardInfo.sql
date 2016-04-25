CREATE VIEW LK.vBO_CreditCardInfo
AS
SELECT CB.BIN as Bin,  BC.Code AS BankCardTypeCode, B.SystemCode as BankCode
FROM     LK.CardBinNumber AS CB 
LEFT OUTER JOIN  LK.BankCardType AS BC ON CB.BankCardTypeID = BC.ID
LEFT OUTER JOIN LK.Bank AS B ON BC.BankID = B.ID