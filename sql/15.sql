/*
 * Compute the total revenue for each film.
 */

SELECT
    f.title AS "title",
    CAST(COALESCE(SUM(p.amount), 0) AS DECIMAL(10,2)) AS "revenue"
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
LEFT JOIN payment p ON r.rental_id = p.rental_id
GROUP BY f.title
ORDER BY "revenue" DESC, "title" ASC;
