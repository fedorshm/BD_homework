/*Created: 19.03.2024
Modified: 19.03.2024Model: PostgreSQL 12
Database: PostgreSQL 12*/
-- Create tables section -------------------------------------------------
-- Table Категории
CREATE TABLE "Категории"
(  "Название категории" Character varying(124) NOT NULL,
  "Описание" Character varying)
WITH (  autovacuum_enabled=true)
;
ALTER TABLE "Категории" ADD CONSTRAINT "PK_Категории" PRIMARY KEY ("Название категории");
-- Table Рецепты
CREATE TABLE "Рецепты"
(  "Название рецепта" Character varying(200) NOT NULL,
  "Год создания" Smallint,  "Описание" Text NOT NULL,
  "Название категории" Character varying(124),  "ID_автора" Integer
)WITH (
  autovacuum_enabled=true);
CREATE INDEX "IX_Relationship1" ON "Рецепты" ("Название категории")
;
CREATE INDEX "IX_Relationship2" ON "Рецепты" ("ID_автора");
ALTER TABLE "Рецепты" ADD CONSTRAINT "PK_Рецепты" PRIMARY KEY ("Название рецепта")
;
-- Table Автор рецепта
CREATE TABLE "Автор рецепта"(
  "ID_автора" Serial NOT NULL,  "Фамилия" Character varying(50) NOT NULL,
  "Имя" Character varying(50) NOT NULL,  "Отчество" Character varying(50),
  "Пол" Character(1) NOT NULL,  "Дата рождения" Date
)WITH (
  autovacuum_enabled=true);
ALTER TABLE "Автор рецепта" ADD CONSTRAINT "PK_Автор рецепта" PRIMARY KEY ("ID_автора")
;
-- Table Индигриенты
CREATE TABLE "Индигриенты"
(  "Название индигриента" Character varying(100) NOT NULL,
  "Описание" Text)
WITH (  autovacuum_enabled=true)
;
ALTER TABLE "Индигриенты" ADD CONSTRAINT "PK_Индигриенты" PRIMARY KEY ("Название индигриента");
-- Table Количество ингредиентов в рецептах
CREATE TABLE "Количество ингредиентов в рецептах"
(  "Значение" Real NOT NULL,
  "Название рецепта" Character varying(200) NOT NULL,  "Название индигриента" Character varying(100) NOT NULL,
  "Название ЕИ" Character varying(50))
WITH (  autovacuum_enabled=true)
;
CREATE INDEX "IX_Relationship5" ON "Количество ингредиентов в рецептах" ("Название ЕИ");
ALTER TABLE "Количество ингредиентов в рецептах" ADD CONSTRAINT "PK_Количество ингредиентов в рецептах" PRIMARY KEY ("Название рецепта","Название индигриента")
;
-- Table Единицы измерения
CREATE TABLE "Единицы измерения"(
  "Название ЕИ" Character varying(50) NOT NULL,  "Обозначение" Character varying(10) NOT NULL
)WITH (
  autovacuum_enabled=true);
ALTER TABLE "Единицы измерения" ADD CONSTRAINT "PK_Единицы измерения" PRIMARY KEY ("Название ЕИ")
;
-- Create foreign keys (relationships) section -------------------------------------------------
ALTER TABLE "Рецепты"  ADD CONSTRAINT "Категория-рецепт"
    FOREIGN KEY ("Название категории")    REFERENCES "Категории" ("Название категории")
      ON DELETE NO ACTION      ON UPDATE NO ACTION
;
ALTER TABLE "Рецепты"  ADD CONSTRAINT "Автор-рецепт"
    FOREIGN KEY ("ID_автора")    REFERENCES "Автор рецепта" ("ID_автора")
      ON DELETE NO ACTION      ON UPDATE NO ACTION
;
ALTER TABLE "Количество ингредиентов в рецептах"  ADD CONSTRAINT "рецепт-колв"
    FOREIGN KEY ("Название рецепта")    REFERENCES "Рецепты" ("Название рецепта")
      ON DELETE NO ACTION      ON UPDATE NO ACTION
;
ALTER TABLE "Количество ингредиентов в рецептах"  ADD CONSTRAINT "ингридиент-колво"
    FOREIGN KEY ("Название индигриента")    REFERENCES "Индигриенты" ("Название индигриента")
      ON DELETE NO ACTION      ON UPDATE NO ACTION
;
ALTER TABLE "Количество ингредиентов в рецептах"  ADD CONSTRAINT "еи-колво"
    FOREIGN KEY ("Название ЕИ")    REFERENCES "Единицы измерения" ("Название ЕИ")
      ON DELETE NO ACTION      ON UPDATE NO ACTION
;