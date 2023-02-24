select f.film_id, title,
c.name as 'Categoria',
i.store_id,
s.address_id,
sf.first_name,
sf.last_name,
ad.address,
ad.city_id,
 concat(a.first_name, a.last_name) AS "Nombre Completo",
f.length 'Duracion', (select avg(length) from film) 'Promedio'
FROM film_actor fa
INNER JOIN film f ON fa.film_id = f.film_id
INNER JOIN actor a ON fa.actor_id = a.actor_id
INNER JOIN film_category as fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
INNER JOIN inventory i ON i.film_id = f.film_id
INNER JOIN store s ON i.store_id = s.store_id
INNER JOIN staff sf ON sf.staff_id = s.manager_staff_id
INNER JOIN address ad ON ad.address_id = f.film_id

ORDER BY 2;
