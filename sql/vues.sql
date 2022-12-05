-- ========================================
--      Vue : CommentStat
-- ========================================
CREATE OR REPLACE VIEW bd.commentStats AS (
    SELECT bd.avis.numero_avis, bd.avis.note, 
    CASE
        WHEN classement.nbUp IS NOT NULL 
        THEN classement.nbUp
        ELSE 0
    END AS nb_appreciations , 
        CASE 
        WHEN classement.indice IS NOT NULL 
        THEN classement.indice
        ELSE 0
    END AS indice,bd.avis.date_avis, bd.avis.commentaire FROM bd.avis 
    LEFT JOIN ( 
        WITH c_table AS ( 
            SELECT numero_avis,
            CASE 
            WHEN sum(pertinence)>=1 THEN sum(pertinence)
            ELSE 0
            END AS c FROM bd.appreciation
            GROUP BY numero_avis), 
        d_table AS (
            SELECT numero_avis,
            CASE 
            WHEN sum(pertinence)<=-1 
            THEN sum(pertinence)*-1
            ELSE 0
            END AS d
            FROM bd.appreciation
            GROUP BY numero_avis)
        SELECT c_table.numero_avis, c_table.c+d_table.d AS nbUp, (1+c_table.c)/(1+d_table.d) AS indice
        FROM c_table
        INNER JOIN d_table ON c_table.numero_avis=d_table.numero_avis
        GROUP BY c_table.numero_avis)
    AS classement ON bd.avis.numero_avis=classement.numero_avis);