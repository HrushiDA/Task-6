SELECT * FROM vetoquinol.veto_june24;

-- Total revenue--
SELECT 
    round(SUM(Total_amount), 2) AS revenue
FROM
    veto_june24;

-- Total sales by day--
SELECT 
    STR_TO_DATE(Date, '%d-%m-%y') AS sale_date,
    round(SUM(Total_amount), 2) AS daily_sales
FROM
    veto_june24
GROUP BY sale_date;

-- Monthly sales trend --
SELECT 
    DATE_FORMAT(STR_TO_DATE(Date, '%d-%m-%y'), '%y-%m') AS sale_month,
	round(SUM(Total_amount), 2) AS monthly_sale
FROM
    veto_june24
GROUP BY sale_month
ORDER BY sale_month;

-- Top selling products--
SELECT 
    Product_Name, SUM(Quantity) AS qty,round(SUM(Total_amount), 2) as Total
FROM
    veto_june24
GROUP BY Product_Name
ORDER BY qty DESC
LIMIT 10;