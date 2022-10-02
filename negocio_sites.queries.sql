SELECT * FROM lead_gen_business.sites;

SELECT clients.client_id, domain_name AS 'websites' FROM sites
JOIN clients ON sites.client_id = clients.client_id
WHERE clients.client_id = 10;

SELECT clients.client_id, COUNT(domain_name) AS 'number_of_websites', DATE_FORMAT(created_datetime, '%M') AS 'month_created', DATE_FORMAT(created_datetime, '%Y') AS 'year_created' FROM sites
JOIN clients ON sites.client_id = clients.client_id
WHERE clients.client_id = 1 OR clients.client_id = 20
GROUP BY created_datetime ORDER BY clients.client_id;

SELECT clients.first_name, clients.last_name, GROUP_CONCAT(domain_name) AS 'sites' FROM sites
JOIN clients ON sites.client_id = clients.client_id
GROUP BY sites.client_id;