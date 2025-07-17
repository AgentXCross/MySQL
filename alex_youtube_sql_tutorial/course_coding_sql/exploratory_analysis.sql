-- Exploratory Data Analysis

SELECT *
FROM layoffs_staging_2;

SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging_2;

SELECT *
FROM layoffs_staging_2
WHERE percentage_laid_off > 0.95
ORDER BY total_laid_off DESC;

SELECT *
FROM layoffs_staging_2
WHERE percentage_laid_off > 0.95
ORDER BY funds_raised_millions DESC;

SELECT company, SUM(total_laid_off) AS `sum`
FROM layoffs_staging_2
GROUP BY company
ORDER BY `sum` DESC;

SELECT MIN(date), MAX(date)
FROM layoffs_staging_2;

SELECT industry, SUM(total_laid_off) AS `sum`
FROM layoffs_staging_2
GROUP BY industry
ORDER BY `sum` DESC;

SELECT country, SUM(total_laid_off), AVG(percentage_laid_off), AVG(funds_raised_millions)
FROM layoffs_staging_2
GROUP BY country
ORDER BY 2 DESC;

SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging_2
GROUP BY YEAR(`date`);

SELECT stage, SUM(total_laid_off)
FROM layoffs_staging_2
GROUP BY stage
ORDER BY SUM(total_laid_off) DESC;

SELECT `month`, total, SUM(total) OVER(ORDER BY `month` ASC)
FROM (
	SELECT SUBSTRING(`date`, 1, 7) AS `month`, SUM(total_laid_off) AS total
    FROM layoffs_staging_2
    GROUP BY `month`
    ) AS temp_table
ORDER BY `month`;

SELECT company 
FROM layoffs_staging_2;

SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging_2
GROUP BY company, YEAR(`date`)
ORDER BY company ASC;

WITH company_year (company, year, total_off, rank_within_company) AS 
(
	SELECT company, YEAR(`date`), SUM(total_laid_off),
    DENSE_RANK() OVER(PARTITION BY company ORDER BY SUM(total_laid_off) DESC)
	FROM layoffs_staging_2
	GROUP BY company, YEAR(`date`)
	ORDER BY company ASC
)
SELECT *
FROM company_year
WHERE total_off IS NOT NULL
ORDER BY rank_within_company DESC;



