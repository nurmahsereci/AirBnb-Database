-- amenities test case: Analyzing amenity profitability and demand
SELECT
    a.name AS amenity_name,
    AVG(p.price_per_night) AS average_nightly_price,
    COUNT(r.id) AS total_reservations
FROM
    amenities a
JOIN amenity_listing al ON a.id = al.amenity_id
JOIN place p ON al.place_id = p.id
LEFT JOIN reservation r ON p.id = r.listing_id
GROUP BY
    a.name;
    
-- amenity_listing test case: Retrieving amenities for a specific place
SELECT 
    a.name, 
    a.description
FROM 
    amenity_listing al
JOIN amenities a ON al.amenity_id = a.id
WHERE 
    al.place_id = 1;

-- complaint test case: Displaying host complaints
SELECT
    CONCAT(u.first_name, ' ', u.last_name) AS host_name,
    u.contact_number AS host_contact_number,
    c.explanations AS complaint_description
FROM
    complaint c
JOIN user u ON c.related_host_id = u.id
WHERE
    c.related_host_id IS NOT NULL;

-- employee test case: Calculating the average age of employees
SELECT ROUND
	(AVG(YEAR(CURRENT_DATE) - YEAR(birthdate) - (RIGHT(CURRENT_DATE, 5) < RIGHT(birthdate, 5)))) 
    AS average_age
FROM airbnb_database.employee;

-- guest test case: Displaying guest and booked place countries
SELECT
    l_guest.country AS guest_country,
    l_place.country AS booked_place_country
FROM
    guest_booked_place gbp
JOIN guest g ON gbp.guest_id = g.id
JOIN location l_guest ON g.guest_billing_address_id = l_guest.id
JOIN place p ON gbp.booked_place_id = p.id
JOIN location l_place ON p.place_location_id = l_place.id
ORDER BY guest_country;

-- guest_booked_place test case: Displaying guest information and payment status
SELECT
    u.first_name,
    u.last_name,
    gbp.reservation_id,
    p.payment_status
FROM
    airbnb_database.guest_booked_place AS gbp
JOIN
    airbnb_database.guest AS g ON gbp.guest_id = g.id
JOIN
    airbnb_database.user AS u ON g.guest_user_id = u.id
LEFT JOIN
    airbnb_database.payment AS p ON gbp.reservation_id = p.id;

-- host test case: Average income of hosts
SELECT
    h.id AS host_id,
    AVG(i.amount) AS average_income
FROM
    airbnb_database.host AS h
JOIN
    airbnb_database.host_offered_place AS hop ON h.id = hop.host_id
JOIN
    airbnb_database.income AS i ON hop.yearly_income_id = i.id
GROUP BY
    h.id
ORDER BY
    average_income DESC;

-- host_offered_place test case: Maximum yearly income among hosts
SELECT MAX(amount) AS max_income
FROM income 
WHERE place_id IN (SELECT offered_place_id FROM host_offered_place);

-- income test case: Analyzing the effect of discounts on host income
SELECT
    h.id AS host_id,
    SUM(DATEDIFF(r.check_out, r.check_in)) AS total_days_booked,
    SUM(p.amount) AS total_income,
    SUM(p.discount) AS total_discount
FROM
    airbnb_database.host AS h
JOIN
    airbnb_database.host_offered_place AS hop ON h.id = hop.host_id
JOIN
    airbnb_database.reservation AS r ON hop.reservation_id = r.id
JOIN
    airbnb_database.payment AS p ON r.rez_payment_id = p.id
GROUP BY h.id
ORDER BY total_income DESC;

-- language test case: Grouping reservations based on hosts’ language ability
SELECT
    CASE WHEN h.lang_speaking_id = (SELECT id 
									FROM language 
									WHERE name = 'English') 
		THEN 'English Speaking'
        ELSE 'Non-English Speaking' END AS language_group,
    COUNT(r.id) AS number_of_reservations
FROM
    host h
JOIN host_offered_place hop ON h.id = hop.host_id
JOIN place p ON hop.offered_place_id = p.id
LEFT JOIN reservation r ON p.id = r.listing_id
GROUP BY
    language_group;

-- listing test case: Displaying listing description and price per night
SELECT
    l.description AS listing_description,
    p.price_per_night
FROM
    listing l
JOIN place p ON l.listed_place_id = p.id
ORDER BY
    p.price_per_night ASC;

-- location test case: Analysis of cities and number of hosts
SELECT
    l.city,
    COUNT(h.id) AS number_of_hosts
FROM
    host h
JOIN user u ON h.host_user_id = u.id
JOIN location l ON u.location_id = l.id
GROUP BY
    l.city;
    
-- media test case: Retrieval of guest profile pictures
SELECT
    m.id AS media_id,
    u.id AS user_id,
    CONCAT(u.first_name, ' ', u.last_name) AS guest_name
FROM
    media m
JOIN user u ON m.id = u.profile_img_id
JOIN role r ON u.role_id = r.id
WHERE
    m.type = 'profilepic' AND r.role_name = 'guest';

-- notification test case: Retrieving notifications for a specific user
SELECT 
	n.id, n.message, n.date, u.first_name, u.last_name
FROM 
	airbnb_database.notification n
JOIN airbnb_database.user u ON n.user_id = u.id
WHERE u.id = 49;

-- payment test case: Displaying payments by currency and country
SELECT
    p.currency,
    COUNT(p.id) AS number_of_payments,
    l.country
FROM
    payment p
JOIN user u ON p.id = u.id
JOIN location l ON u.location_id = l.id
GROUP BY
    p.currency, l.country;
    
-- place test case: Evaluating price per night for accommodations by location
SELECT
    p.price_per_night,
    l.country,
    l.region,
    l.city
FROM
    place p
JOIN listing li ON p.id = li.listed_place_id
JOIN location l ON p.place_location_id = l.id
ORDER BY
    p.price_per_night ASC;  
    
-- reservation test case: Calculating reservation duration
SELECT
    id AS reservation_id,
    check_in,
    check_out,
    DATEDIFF(check_out, check_in) 
	AS reservation_duration_days
FROM reservation;

-- review test case: Rating comparison with average
SELECT CASE 
		WHEN rating > avg_rating THEN 'Higher than average'
        WHEN rating < avg_rating THEN 'Lower than average'
        ELSE 'Equal' END AS rating_comparison,
    COUNT(*) AS review_count
FROM
    review,
    (SELECT AVG(rating) AS avg_rating FROM review) 
    AS avg_table
GROUP BY
    rating_comparison; 
    
-- role test case: Calculation of the number of people in the guest and host roles
SELECT
    r.role_name,
    COUNT(u.id) AS number_of_people
FROM
    user u
JOIN role r ON u.role_id = r.id
WHERE
    r.role_name IN ('guest', 'host')
GROUP BY
    r.role_name;
    
-- user test case: Grouping users by role and displaying counts
SELECT
    r.role_name,
    COUNT(u.id) AS number_of_users
FROM
    user u
JOIN role r ON u.role_id = r.id
GROUP BY
    r.role_name;