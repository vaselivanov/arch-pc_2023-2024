---
## Front matter
title: "Лабораторная работа#3"
subtitle: "Язык разметки markdown"
author: "Селиванов Вячеслав Алексеевич"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Целью работы является освоение процедуры оформления отчетов с помощью легковесного
языка разметки Markdown.

# Задание

Здесь приводится описание задания в соответствии с рекомендациями
методического пособия и выданным вариантом.

#  Теоретическое введение

Markdown — облегчённый язык разметки, созданный с целью обозначения форматирования в простом тексте, с максимальным сохранением его читаемости человеком, и пригодный для машинного преобразования в языки для продвинутых публикаций.

#  Выполнение лабораторной работы

После установки необходимых пакетов перехожу в каталог курса, созданный при выполнении прошлой лабораторной работы  (рис. @fig:001).

![Перемещение по директориям](image/1.png){#fig:001 width=70%}

Обновляю локальный репозиторий, используя команду команду "git pull" (рис. @fig:002).

![Обновление локального репозитория](image/2.png){#fig:002 width=70%}

Перехожу в папку report третьей лабораторной работы, используя утилиту "cd" (рис. @fig:003).

![Перемещение в папку report](image/3.png){#fig:003 width=70%}

Компилирую шаблон, с помощью утилиты "make" создаю документ doxc и pdf (рис. @fig:004).

![файл doxc и pdf](image/4.png){#fig:004 width=70%}



Проверяю сгенерированный doxc и pdf файлы (рис. -@fig:005).

![шаблон в doxc и pdf](image/5.png){#fig:005 width=70%}


Удаляю полученные файлы с помощью команды "make clean" (рис. @fig:006).

![Удаление файлов](image/6.png){#fig:006 width=70%}

Проверяю правильность удаления(рис. @fig:007).

![Проверка правильности действий](image/7.png){#fig:007Ы width=70%}

Перемещаюсь в report.md и начинаю заполнять отчет(рис. @fig:008).

![Файл markdown](image/8.png){#fig:008 width=70%}

Сохраняю изменения и отправляю в github (рис. @fig:11).

![Отправка отчёта на github](image/11.png){#fig:11 width=70%}

#  Задания для самостоятельной работы
 Создаю отчёт второй лабораторной работы в markdown (рис. @fig:12).
 
 ![Создание отчёта 2 лабораторной работы](image/12.png){#fig:12 width=70%}

# Выводы
В данной лабораторной работе я научился пользоваться  языком разметки markdown и создавать отчёты в нескольких видах.
