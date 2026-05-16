-- =====================================================
-- Procedure Name : bottom_3_ratio_domestic_to_foreign
-- Description:
-- Returns the bottom 3 districts with the
-- lowest domestic-to-foreign visitor ratio.
-- =====================================================

DELIMITER //

CREATE PROCEDURE bottom_3_ratio_domestic_to_foreign()

BEGIN

    SELECT
        d.district,
        d.total_domestic_visitors,
        f.total_foreign_visitors,

        ROUND(
            (
                d.total_domestic_visitors * 1.0 /
                NULLIF(f.total_foreign_visitors, 0)
            ),
            1
        ) AS ratio

    FROM total_domestic_table AS d

    JOIN total_foreign_table AS f
    ON f.district = d.district

    WHERE f.total_foreign_visitors > 0

    ORDER BY ratio ASC

    LIMIT 3;

END //

DELIMITER ;


-- =====================================================
-- Procedure Name : top_3_ratio_domestic_to_foreign
-- Description:
-- Returns the top 3 districts with the
-- highest domestic-to-foreign visitor ratio.
-- =====================================================

DELIMITER //

CREATE PROCEDURE top_3_ratio_domestic_to_foreign()

BEGIN

    SELECT
        d.district,
        d.total_domestic_visitors,
        f.total_foreign_visitors,

        ROUND(
            (
                d.total_domestic_visitors * 1.0 /
                NULLIF(f.total_foreign_visitors, 0)
            ),
            1
        ) AS ratio

    FROM total_domestic_table AS d

    JOIN total_foreign_table AS f
    ON f.district = d.district

    WHERE f.total_foreign_visitors > 0

    ORDER BY ratio DESC

    LIMIT 3;

END //

DELIMITER ;


-- =====================================================
-- Procedure Name : estimate_domistic_visitors_growth
-- Description:
-- Estimates future domestic visitor growth
-- for a selected district using CAGR-based
-- forecasting logic.
--
-- Also estimates average projected revenue
-- based on estimated visitor count.
-- =====================================================

DELIMITER //

CREATE PROCEDURE estimate_domistic_visitors_growth(

    IN in_district VARCHAR(50),
    IN in_yr INT

)

BEGIN

    DECLARE n INT;

    -- Validation Check
    IF in_yr < 2019 THEN

        SELECT
            'Year should be greater than or equal to 2019'
            AS message;

    ELSE

        -- Number of years after 2019
        SET n = in_yr - 2019;

        WITH cte1 AS (

            SELECT
                t.district,

                ROUND(
                    t.total_visitors *

                    POWER(
                        (
                            1 + (c.domestic_CAGR / 100)
                        ),

                        n
                    ),

                    0
                ) AS estimate_domestic_visitors

            FROM total_do_vis_year t

            JOIN cagr_domestic c
            ON c.district = t.district

            WHERE t.year = 2019
            AND t.district = in_district
        )

        SELECT
            *,

            (
                estimate_domestic_visitors * 1200
            ) AS avg_estimate_revenue

        FROM cte1;

    END IF;

END //

DELIMITER ;


-- =====================================================
-- Procedure Name : estimate_foreign_visitors_growth
-- Description:
-- Estimates future foreign visitor growth
-- for a selected district using CAGR-based
-- forecasting logic.
--
-- Also estimates average projected revenue
-- based on estimated foreign visitor count.
-- =====================================================

DELIMITER //

CREATE PROCEDURE estimate_foreign_visitors_growth(

    IN in_district VARCHAR(50),
    IN in_yr INT

)

BEGIN

    DECLARE n INT;

    -- Validation Check
    IF in_yr < 2019 THEN

        SELECT
            'Year should be greater than or equal to 2019'
            AS message;

    ELSE

        -- Number of years after 2019
        SET n = in_yr - 2019;

        WITH cte1 AS (

            SELECT
                t.district,

                ROUND(
                    t.total_visitors *

                    POWER(
                        (
                            1 + (c.foreign_CAGR / 100)
                        ),

                        n
                    ),

                    0
                ) AS estimate_foreign_visitors

            FROM total_fo_vis_year t

            JOIN cagr_foreign c
            ON c.district = t.district

            WHERE t.year = 2019
            AND t.district = in_district
        )

        SELECT
            *,

            (
                estimate_foreign_visitors * 5600
            ) AS avg_estimate_revenue

        FROM cte1;

    END IF;

END //

DELIMITER ;


-- =====================================================
-- Procedure Name : touist_to_population_footfall_ratio
-- Description:
-- Returns district-wise tourist-to-population
-- footfall ratio for a selected year.
--
-- Supports:
-- - Dynamic year input
-- - Dynamic sorting order
-- - Dynamic result limit
-- =====================================================

DELIMITER //

CREATE PROCEDURE touist_to_population_footfall_ratio(

    IN in_yr INT,
    IN in_limit INT,
    IN in_order VARCHAR(10)

)

BEGIN

    -- Default Year
    IF in_yr IS NULL THEN
        SET in_yr = 2019;
    END IF;

    -- Default Limit
    IF in_limit IS NULL THEN
        SET in_limit = 5;
    END IF;

    -- Default Sort Order
    IF in_order IS NULL THEN
        SET in_order = 'DESC';
    END IF;

    -- Dynamic Query
    SET @query = CONCAT(

        'SELECT

            v.district,
            v.year,
            v.total_visitors,
            t.population_2011,

            (
                v.total_visitors * 1.0 /
                t.population_2011
            ) AS visitors_ratio

        FROM total_visitors v

        JOIN telangana_33_districts_population_2011 t
        ON t.district = v.district

        WHERE v.year = ', in_yr, '

        ORDER BY visitors_ratio ', in_order, '

        LIMIT ', in_limit

    );

    -- Execute Dynamic Query
    PREPARE stmt FROM @query;

    EXECUTE stmt;

    DEALLOCATE PREPARE stmt;

END //

DELIMITER ;