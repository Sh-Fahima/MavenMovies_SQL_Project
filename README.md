🎬 Maven Movies SQL Case Study
📌 Solution
1. How many customers are registered in the database?
   
SELECT COUNT(*) AS total_customers
FROM customer;
Answer: The total Customer Number-599.

<img width="146" height="53" alt="Screenshot 2026-05-18 125646" src="https://github.com/user-attachments/assets/f67804ca-abce-4c1d-a16e-709ef56429cc" />

2. Which films generate the highest revenue?
   
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
Answer: According to top 10 reveneue table the film GOODFELLAS SALUTE generates the highest revenue.

<img width="258" height="243" alt="Screenshot 2026-05-18 130150" src="https://github.com/user-attachments/assets/9ccf7855-c8eb-484f-9adc-c1ce53b590ea" />

3. Which customers spent the most money?
   
SELECT c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    ROUND(SUM(p.amount), 2) AS total_spent
FROM customer c
JOIN payment p
    ON c.customer_id = p.customer_id
GROUP BY c.customer_id, customer_name
ORDER BY total_spent DESC
LIMIT 10;
Answer:According to  top values from the total spent table KARL SEAL spent most money.

<img width="352" height="246" alt="Screenshot 2026-05-18 130301" src="https://github.com/user-attachments/assets/9bf020ee-4416-4c4a-8e2d-a9301e09ac65" />


4. Which film categories are the most popular?
   
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
Answer:The most popular film categories are-

<img width="217" height="370" alt="Screenshot 2026-05-18 130527" src="https://github.com/user-attachments/assets/295af97e-9611-46d1-be34-8d2dbe542346" />

5.Which store performs better?

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
Answer: According to the tbale Store id 1 generates highest total revenue and total rentals ,so the store id 1 performs better.

<img width="271" height="68" alt="Screenshot 2026-05-18 130615" src="https://github.com/user-attachments/assets/0904fe13-ba87-4c47-adb2-b96c17cfbeb8" />

