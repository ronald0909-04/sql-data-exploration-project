# standarizing data

select distinct company
from layoffs_staging2;

select company, trim(company)
from layoffs_staging2;

update layoffs_staging2
set company = trim(company);

select *
from layoffs_staging2
where industry like 'crypto%';

update layoffs_staging2
set industry = 'crypto%'
where industry like 'crypto%';


select distinct country, trim(trailing '.' from country)
from layoffs_staging2
order by 1;

update layoffs_staging2
set country = trim(trailing '.' from country)
where country like 'United States%';

select `date`
from layoffs_staging2;


UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;

select *
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;
 
 update layoffs_staging2
 set industry = null 
 where industry = '';
 
 select *
 from layoffs_staging2
 where industry is null
 or industry = '';

 select *
 from layoffs_staging2
 where company = 'Airbnb';
 
 select t1.industry, t2.industry
 from layoffs_staging2 t1
 join layoffs_staging2 t2
	on t1.company = t2.company
    where (t1.industry is null or t1.industry = '')
    and t2.industry is not null;
    
    update layoffs_staging2 t1
    join layoffs_staging2 t2
    on t1.company = t2.company
    set t1.industry = t2.industry
    where t1.industry is null
    and t2.industry is not null;


select layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

delete 
from layoffs_staging2
where total_laid_off is null
and percentage_laid_off is null;

select *
from layoffs_staging2;

alter table layoffs_staging2
drop column row_num;
