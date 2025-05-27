-- All Database
SELECT 
    SERVERPROPERTY('MachineName') AS server_name,
    @@SERVICENAME AS instance,
    d.name AS database_name,
    d.recovery_model_desc AS recovery_model,
    log_size_mb = CAST(SUM(CASE WHEN sm.type_desc = 'LOG' AND sm.size IS NOT NULL THEN sm.size ELSE 0 END) * 8. / 1024 AS DECIMAL(8,2)),
    row_size_mb = CAST(SUM(CASE WHEN sm.type_desc = 'ROWS' AND sm.size IS NOT NULL THEN sm.size ELSE 0 END) * 8. / 1024 AS DECIMAL(8,2)),
    total_size_mb = CAST(SUM(ISNULL(sm.size, 0)) * 8. / 1024 AS DECIMAL(8,2)),
    total_size_gb = CAST(SUM(ISNULL(sm.size, 0)) * 8. / 1024 / 1024 AS DECIMAL(8,2)),
    GETDATE() AS taken_date
FROM sys.master_files sm
JOIN sys.databases d ON sm.database_id = d.database_id
GROUP BY d.name, d.recovery_model_desc
ORDER BY d.name ASC;

-- Instance
SELECT
    ROUND(SUM(size * 8 / 1024.0 / 1024.0), 2) AS [Total Size (GB)]
FROM
    sys.master_files;
