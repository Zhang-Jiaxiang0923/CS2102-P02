SELECT y.code AS yard_code, y.category_type AS yard_type, p.bay AS bay_number, p.row AS row_number, p.tier as tier_number
FROM position p, yard y
WHERE y.code = p.code
    AND NOT EXISTS(
        SELECT 1 
        FROM container c
        WHERE c.bay = p.bay
            AND c.row = p.row
            AND c.tier = p.tier
            AND c.code = p.code
    )
ORDER BY y.code ASC, p.bay ASC, p.row ASC, p.tier ASC; 