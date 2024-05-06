select 'hello world' as nice

select version() as версия

select concat('nice', 'fine') as conc

select 'nice' || 'fine' as conc2

select right(version(), 20) as cut,
substring (version(), 17, 4) as cut_more

select CURRENT_DATE as segodnia

select CURRENT_TIMESTAMP as segodnia

select concat('хеллоу ', 'Андрей Александрович, в ', date_part('year', current_date), ' году') as nice



select version() as Full_Version,
substring (version(), 1, 10) as base,
substring (version(), 12, 4 ) as Num_Version, 
substring (version(), 30, 10) as compiled_by,
substring (version(), 47, 4) as build,
substring (version(), 53, 2) as bitt

select concat('Здравствуйте, меня зовут', ' Педор Педорович.', ' Я родился в ', extract('year' from current_date), ' году.', ' Я родился в месяце ', TO_CHAR(current_date, 'Month'), ', а число то было ', date_part('day', current_date), ', а вот день недели - ', extract(DOW from current_date), ', говоря по-русски - ', TO_CHAR(current_date, 'Day'),  '. По времени я родился примерно в ', localtime)

SELECT TIMESTAMP '2023-11-09 16:41:15'::time ;

select * from "Recipe author" 

insert into "Recipe author" ("ID_author", "Surname", "Name", "Father name", "Sex", "DOB")
	values (1, 'Шамигов', 'Педор', 'Педорович', '-', '2000-11-23')
	
	
select * from "Categories"

insert into "Categories"
	values ('Суп', 'Ну такая жидкая жрачка, похлебать чисто червяка заморить, хотя тут как наварят: коль нажористо, то можно и коней двинуть от удовлетворения и насыщения')


select * from "Recipes" 

select "Recipe_name" from "Recipes"

insert into "Recipes" ("Recipe_name", "year created", "Description", "Category name", "ID_author")
	values ('Борщевский', '1435', 'Вкусный борщевский, всем зайдет на славу, зуб даю! Кому не понравится - тот лошпед и нерусский.', 'Суп', '1')

	
select * from "Ingredients" 

insert into "Ingredients" ("Ingredient name")
	values('Че-то')
 
DELETE FROM "Ingredients" 
WHERE "Ingredient name" = 'Че-то'
RETURNING *;

insert into "Ingredients" ("Ingredient name")
	values('Свекла'), ('Картопля'), ('Капиздочка'), ('Говяжка'), ('Вода'), ('Маркоша'), ('Лук'), ('Соль'), ('Лаврушка'), ('Перец')
	
select * from "Measurement units" 

insert into "Measurement units" ("Measurement unit name" , "abbr")
	values('Граммы', 'гр')
	
select * from "Amount of ingredients in recipe" aoiir 

insert into "Amount of ingredients in recipe" ("Value", "Recipe name" , "Ingredient name" , "Measurement unit name")
	values(500, 'Борщевский', 'Свекла', 'Граммы')


-- На 23.04.2024
select * from "Ingredients" i 

select * from "Ingredients" i order by "Ingredient name" desc

select * from "Ingredients" i order by "Ingredient name" asc limit 5 

select * from "Ingredients" i order by "Ingredient name" desc fetch first 5 rows only

select distinct * from "Ingredients" i 



select "Ingredient name" from "Ingredients" as P



GO

SELECT
  Р."Ingredient name"
FROM
  "Ingredients" AS Р


  
GO

SELECT
  
FROM
  "Ingredients" 


select * from "Recipe author" ra 

update "Recipe author" set "Sex" = 'M' where "ID_author" = 1 

select * from "Автор рецепта"

insert into "Автор рецепта" values ('1', 'Шамигов', 'Федор', 'Федорович', 'М', '23-11-2000'), ('2', 'Степаненко', 'Андрей', 'Александрович', 'М', '11-11-1111')

insert into "Автор рецепта" values ('2', 'Степаненко', 'Андрей', 'Александрович', 'М', '11-11-1111')

select * from "Рецепты"

select * from "Категории"

insert into "Категории" values ('Вкусное', 'реально вкусная жрачка для всех')

insert into "Рецепты" values ('Хрючево', '2024', 'Сытная жрачка для настоящих сигма', 'Вкусное', '1')

insert into "Рецепты" values ('Бешбармак', '2020', 'Олус учуей уонна минньигэс ас', 'Вкусное', '1')





select * from "Recipes" r  

insert into "Categories" values ('Вкусное', 'Ну чисто вкусное')

insert into "Recipes"  values ('Бешбармак', '2020', 'Олус учуей уонна минньигэс ас', 'Вкусное', '1')

insert into "Recipe author"  values ('2', 'Степаненко', 'Андрей', 'Александрович', 'М', '11-11-1111')

select * from "Amount of ingredients in recipe" aoiir 

insert into "Measurement units"  values ('Килограммы', 'кг'), ('Жменя', 'жм'), ('Щепотка', 'щеп')



