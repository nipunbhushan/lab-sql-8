-- Write a query to display for each store its store ID, city, and country.

SELECT 
    s.store_id, ci.city, co.country
FROM
    store s
        INNER JOIN
    address a USING (address_id)
        INNER JOIN
    city ci USING (city_id)
        INNER JOIN
    country co USING (country_id);

-- Write a query to display how much business, in dollars, each store brought in.

SELECT 
    sto.store_id AS store, SUM(p.amount) AS total_revenue
FROM
    payment p
        INNER JOIN
    staff st USING (staff_id)
        INNER JOIN
    store sto USING (store_id)
GROUP BY sto.store_id;

-- Which film categories are longest?

SELECT 
    c.name AS Genre
FROM
    film_category fc
        INNER JOIN
    film f USING (film_id)
        INNER JOIN
    category c USING (category_id)
GROUP BY category_id
ORDER BY AVG(f.length) DESC
LIMIT 1;

-- Display the most frequently rented movies in descending order.

SELECT 
    f.title AS film_name, COUNT(r.rental_id) AS num_rentals
FROM
    rental r
        INNER JOIN
    inventory i USING (inventory_id)
        INNER JOIN
    film f USING (film_id)
GROUP BY film_id
ORDER BY num_rentals DESC;

-- List the top five genres in gross revenue in descending order.

select * FROM category; -- category_id
select * FROM film_category; -- film_id
select * FROM inventory; -- inventory_id
select * FROM rental; -- rental_id
SELECT * FROM payment;
SELECT 
    c.name AS Genre, SUM(p.amount) AS Gross_Revenue
FROM
    payment p
        INNER JOIN
    rental r USING (rental_id)
        INNER JOIN
    inventory i USING (inventory_id)
        INNER JOIN
    film_category fc USING (film_id)
        INNER JOIN
    category c USING (category_id)
GROUP BY category_id
ORDER BY Gross_Revenue DESC
LIMIT 5;

-- Is "Academy Dinosaur" available for rent from Store 1?

SELECT 
    f.title AS film_name, store_id, inventory_id
FROM
    inventory i
        INNER JOIN
    store s USING (store_id)
        INNER JOIN
    film f USING (film_id)
WHERE
    store_id = 1
        AND f.title = 'Academy Dinosaur';


-- Get all pairs of actors that worked together.

SELECT 
    fa1.actor_id AS actor_1, fa2.actor_id AS actor_2, film_id
FROM
    film_actor fa1
        INNER JOIN
    film_actor fa2 USING (film_id)
WHERE
    fa1.actor_id < fa2.actor_id;

-- Get all pairs of customers that have rented the same film more than 3 times.

-- yet to try today, didn't get enough time. 

-- For each film, list actor that has acted in more films.

-- yet to try today, didn't get enough time.