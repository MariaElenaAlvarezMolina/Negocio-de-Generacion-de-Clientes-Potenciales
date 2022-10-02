SELECT * FROM lead_gen_business.leads;

SELECT sites.domain_name AS 'websites', COUNT(leads_id) AS 'number_of_leads' FROM leads
JOIN sites ON leads.site_id = sites.site_id
WHERE registered_datetime >= '2011-01-01' AND registered_datetime <= '2011-02-15'
GROUP BY websites;

SELECT clients.first_name, clients.last_name, COUNT(leads_id) AS 'number_of_leads' FROM leads
JOIN sites ON leads.site_id = sites.site_id
JOIN clients ON sites.client_id = clients.client_id
WHERE registered_datetime >= '2011-01-01' AND registered_datetime <= '2011-12-31'
GROUP BY clients.client_id;

SELECT clients.first_name, clients.last_name, COUNT(leads_id) AS 'number_of_leads', DATE_FORMAT(registered_datetime, '%M') AS 'month_created', DATE_FORMAT(registered_datetime, '%Y') AS 'year_created' FROM leads
JOIN sites ON leads.site_id = sites.site_id
JOIN clients ON sites.client_id = clients.client_id
WHERE registered_datetime >= '2011-01-01' AND registered_datetime <= '2011-06-30'
GROUP BY leads_id;

SELECT clients.first_name, clients.last_name, sites.domain_name AS 'website', COUNT(leads_id) AS 'number_of_leads', DATE_FORMAT(registered_datetime, '%M') AS 'month_created', DATE_FORMAT(registered_datetime, '%Y') AS 'year_created' FROM leads
JOIN sites ON leads.site_id = sites.site_id
JOIN clients ON sites.client_id = clients.client_id
GROUP BY domain_name ORDER BY clients.client_id;