-- =====================================================
-- View Name : cagr_domestic
-- Description:
-- Calculates district-wise CAGR (Compound Annual
-- Growth Rate) for domestic visitors between
-- the minimum and maximum available years.
-- =====================================================

CREATE VIEW cagr_domestic AS

WITH cte1 AS (

    SELECT
        district,
        year,
        SUM(visitors) AS Total_visitors_2019

    FROM domestic_visitors

    WHERE year = (
        SELECT MAX(year)
        FROM domestic_visitors
    )

    GROUP BY district, year
),

cte2 AS (

    SELECT
        district,
        year,
        SUM(visitors) AS Total_visitors_2016

    FROM domestic_visitors

    WHERE year = (
        SELECT MIN(year)
        FROM domestic_visitors
    )

    GROUP BY district, year
)

SELECT
    cte1.district,
    cte1.Total_visitors_2019,
    cte2.Total_visitors_2016,

    IF(
        cte2.Total_visitors_2016 = 0,

        0,

        ROUND(
            (
                POWER(
                    cte1.Total_visitors_2019 /
                    cte2.Total_visitors_2016,

                    1.0 / 3
                ) - 1
            ) * 100,

            2
        )
    ) AS domestic_CAGR

FROM cte1

JOIN cte2
ON cte1.district = cte2.district

ORDER BY domestic_CAGR DESC;





-- =====================================================
-- View Name : cagr_foreign
-- Description:
-- Calculates district-wise CAGR (Compound Annual
-- Growth Rate) for foreign visitors between
-- the minimum and maximum available years.
-- =====================================================

CREATE VIEW `cagr_foreign` AS
WITH cte1 AS (

    SELECT
        district,
        year,
        SUM(visitors) AS Total_visitors_2019

    FROM foreign_visitors

    WHERE year = (
        SELECT MAX(year)
        FROM foreign_visitors
    )

    GROUP BY district, year
),

cte2 AS (

    SELECT
        district,
        year,
        SUM(visitors) AS Total_visitors_2016

    FROM foreign_visitors

    WHERE year = (
        SELECT MIN(year)
        FROM foreign_visitors
    )

    GROUP BY district, year
)

SELECT
    cte1.district,
    cte1.Total_visitors_2019,
    cte2.Total_visitors_2016,

    IF(
        cte2.Total_visitors_2016 = 0,

        0,

        ROUND(
            (
                POWER(
                    cte1.Total_visitors_2019 /
                    cte2.Total_visitors_2016,

                    1.0 / 3
                ) - 1
            ) * 100,

            2
        )
    ) AS foreign_CAGR

FROM cte1

JOIN cte2
ON cte1.district = cte2.district

ORDER BY foreign_CAGR DESC;


-- =====================================================
-- View Name : total_do_vis_year
-- Description:
-- Calculates total domestic visitors grouped
-- by district and year.
-- =====================================================

CREATE VIEW total_do_vis_year AS

SELECT
    district,
    year,
    SUM(visitors) AS total_visitors

FROM domestic_visitors

GROUP BY
    district,
    year;


-- =====================================================
-- View Name : total_domestic_table
-- Description:
-- Calculates total domestic visitors grouped
-- by district.
-- =====================================================

CREATE VIEW total_domestic_table AS

SELECT
    district,
    SUM(visitors) AS total_domestic_visitors

FROM domestic_visitors

GROUP BY district

ORDER BY total_domestic_visitors DESC;


-- =====================================================
-- View Name : total_fo_vis_year
-- Description:
-- Calculates total foreign visitors grouped
-- by district and year.
-- =====================================================

CREATE VIEW total_fo_vis_year AS

SELECT
    district,
    year,
    SUM(visitors) AS total_visitors

FROM foreign_visitors

GROUP BY
    district,
    year;



-- =====================================================
-- View Name : total_foreign_table
-- Description:
-- Calculates total foreign visitors grouped
-- by district.
-- =====================================================

CREATE VIEW total_foreign_table AS

SELECT
    district,
    SUM(visitors) AS total_foreign_visitors

FROM foreign_visitors

GROUP BY district

ORDER BY total_foreign_visitors DESC;



-- =====================================================
-- View Name : total_visitors
-- Description:
-- Calculates total visitors by combining
-- domestic and foreign visitors grouped
-- by district and year.
-- =====================================================

CREATE VIEW total_visitors AS

SELECT
    d.district,
    d.year,

    (
        d.total_visitors +
        f.total_visitors
    ) AS total_visitors

FROM total_do_vis_year d

JOIN total_fo_vis_year f
ON
    f.district = d.district
    AND f.year = d.year

ORDER BY total_visitors DESC;