-- How many customers are registered in the database?
SELECT COUNT(*) AS total_customers
FROM customer;

-- Which films generate the highest revenue?
SELECT f.title, 
    ROUND(SUM(p.amount), 2) AS total_revenue
FROM payment p
JOIN rental r
    ON p.rental_id = r.rental_id
JOIN inventory i
    ON r.inventory_id = i.inventory_id
JOIN film f
    ON i.film_id = f.film_id
GROUP BY f.title
ORDER BY total_revenue DESC
LIMIT 10;
-- Which customers spent the most money?
SELECT c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    ROUND(SUM(p.amount), 2) AS total_spent
FROM customer c
JOIN payment p
    ON c.customer_id = p.customer_id
GROUP BY c.customer_id, customer_name
ORDER BY total_spent DESC
LIMIT 10;

-- Which film categories are the most popular?
SELECT c.name AS category,
    COUNT(r.rental_id) AS total_rentals
FROM category c
JOIN film_category fc
    ON c.category_id = fc.category_id
JOIN film f
    ON fc.film_id = f.film_id
JOIN inventory i
    ON f.film_id = i.film_id
JOIN rental r
    ON i.inventory_id = r.inventory_id
GROUP BY category
ORDER BY total_rentals DESC;

-- Which store performs better?
SELECT s.store_id,
    ROUND(SUM(p.amount), 2) AS total_revenue,
    COUNT(r.rental_id) AS total_rentals
FROM store s
JOIN customer c
    ON s.store_id = c.store_id
JOIN payment p
    ON c.customer_id = p.customer_id
JOIN rental r
    ON p.rental_id = r.rental_id
GROUP BY s.store_id;