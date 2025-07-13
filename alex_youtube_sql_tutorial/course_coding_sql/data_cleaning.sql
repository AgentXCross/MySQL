#DATA-CLEANING PROJECT
USE world_layoffs;

SELECT *
FROM layoffs;

-- 1. Remove Duplicates
-- 2. Standardize Data
-- 3. Null Values or Blank Values
-- 4. Remove any columns or rows that are unneccesary

-- Remove Duplicates

CREATE TABLE layoffs_staging #Duplicate the layoffs table but only the headers
LIKE layoffs;

INSERT INTO layoffs_staging
SELECT *
FROM layoffs;

#Remove duplicates
WITH duplicate_cte AS
(
	SELECT *,
	ROW_NUMBER() OVER(
		PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
	FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;


CREATE TABLE `layoffs_staging_2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

SELECT *
FROM layoffs_staging_2
WHERE row_num > 1;

INSERT INTO layoffs_staging_2
SELECT *,
	ROW_NUMBER() OVER(
		PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging;

DELETE 
FROM layoffs_staging_2
WHERE row_num > 1;

SET SQL_SAFE_UPDATES = 0;

-- Standardizing Data

SELECT company, TRIM(company)
FROM layoffs_staging_2;

UPDATE layoffs_staging_2
SET company = TRIM(company);

SELECT DISTINCT industry
FROM layoffs_staging_2
WHERE industry LIKE 'Crypto%';

UPDATE layoffs_staging_2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%';

SELECT DISTINCT location
FROM layoffs_staging_2
ORDER BY 1;

SELECT DISTINCT country
FROM layoffs_staging_2
ORDER BY 1;

UPDATE layoffs_staging_2
SET country = 'United States'
WHERE country like 'United S%';

SELECT `date`, #Reformat date into the date data type
STR_TO_DATE(`date`, '%m/%d/%Y')
FROM layoffs_staging_2;

UPDATE layoffs_staging_2
SET `date` = STR_TO_DATE(`date`,'%m/%d/%Y');

ALTER TABLE layoffs_staging_2
MODIFY COLUMN `date` DATE;

DESCRIBE layoffs_staging_2;

-- NULLS
SELECT *
FROM layoffs_staging_2
WHERE total_laid_off IS NULL AND percentage_laid_off IS NULL;

SELECT *
FROM layoffs_staging_2
WHERE industry IS NULL OR industry = '';

SELECT DISTINCT industry
FROM layoffs_staging_2;

SELECT *
FROM layoffs_staging_2
WHERE company = 'Airbnb';

UPDATE layoffs_staging_2
SET industry = 'Travel'
WHERE company = 'Airbnb';

SELECT *
FROM layoffs_staging_2
WHERE company = 'Bally\'s Interactive';

UPDATE layoffs_staging_2
SET industry = 'Consumer'
WHERE company = 'Bally\'s Interactive';

-- Deleting Useless Columns or Rows
SELECT *
FROM layoffs_staging_2
WHERE 
	(total_laid_off IS NULL OR total_laid_off = '')
AND 
	(percentage_laid_off IS NULL OR percentage_laid_off = '');
    
DELETE 
FROM layoffs_staging_2
WHERE 
	(total_laid_off IS NULL OR total_laid_off = '')
AND 
	(percentage_laid_off IS NULL OR percentage_laid_off = '');
    
SELECT *
FROM layoffs_staging_2;

ALTER TABLE layoffs_staging_2
DROP COLUMN row_num;



















