# Assignment 6: School timetable

**Структура на базата данни**

Базата има пет таблици: classes, subjects, teachers, rooms и lessons. Първите четири
индивидуално отговарят за съхранението на всяка от компонентите на програмата, така че
ако примерно прекръстим учител променяме само една колона. Всяка таблица оперира със
собствено id като PRIMARY KEY и lessons сочи към останалите четири като FOREIGN KEYs,
така че lesson не може да използва несъществуващи teacher или room. За да се отказват
невърможни програми използваме три UNIQUE constraints на lessons: (class, weekday, period),
(teacher, weekday, period) и (room, weekday, period), така че базата сама да спира двойна
информация. Дните се пазят като INT, а не като DATE, защото програмата оперира в постоянен
цикъл от дни от седмицата (1 - 7), което улеснява операциите с информацията.

**Какво базата би отговорила при втори час за същия клас, ден и час (period):**

    ERROR: duplicate key value violates unique constraint "lessons_class_slot_key"
    Key (class_id, weekday, period)=(1, 1, 1) already exists.