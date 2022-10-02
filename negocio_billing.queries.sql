SELECT * FROM lead_gen_business.billing;

SELECT DATE_FORMAT(charged_datetime, '2012-03') AS 'Month', SUM(amount) AS 'amount' FROM billing;

SELECT clients.client_id, SUM(amount) AS 'total amount' FROM billing
JOIN clients ON billing.client_id = clients.client_id
WHERE clients.client_id = 2;

SELECT clients.first_name, clients.last_name, amount, DATE_FORMAT(charged_datetime, '%M') AS 'month_created', DATE_FORMAT(charged_datetime, '%Y') AS 'year_created' FROM billing
JOIN clients ON billing.client_id = clients.client_id
ORDER BY clients.client_id;