---
## Front matter
title: "Лабораторная работа №10"
subtitle: "Работа с файлами средствами NASM"
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
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы
Приобретение навыков написания программ для работы с файлами.


# Задание
1. Задание лабораторной работы
2. Задание для самостоятельной работы


# Выполнение лабораторной работы

## Задание лабораторной работы

Создаю каталог для программ лабораторной работы №10, перехожу в него и создаю файлы: lab10-1.asm,readme-1.txt,readme-2.txt (рис. @fig:001).

![Создание рабочего пространства](image/1.png){#fig:001 width=70%}

Перемещаю файл in_out.asm, так как он понадобится для дальнейшей работы (рис. @fig:002).

![Копирование файла](image/2.png){#fig:002 width=70%}

Ввожу в файл lab10-1.asm текст программы из листинга 10.1. Чтобы программа работала, изменяю название файла,в котором будет отображаться моё сообщение (меняю readme.txt на readme-1.txt) (рис. @fig:003).

![Редактирование программы](image/3.png){#fig:003 width=70%}

Создаю исполняемый файл,ввожу с клавиатуры сообщение,которое переместится в файл readme-1.txt, после чего распаковываю данный файл и убеждаюсь,что мое сообщение находится именно там (рис. @fig:004).

![Запуск кода программы](image/4.png){#fig:004 width=70%}

С помощью команды chmod изменяю права доступа к исполняемому файлу lab10-1, запрещая его выполнение во всех трех группах (пользователю,члену команды пользователя и всем остальным) и проверяю команду с помощью ls (рис. @fig:005).

![Изменение прав доступа](image/5.png){#fig:005 width=70%}

Пробую запустить исполняемый файл, но мне отказывают в доступе (рис. @fig:006).

![Проверка изменений](image/6.png){#fig:006 width=70%}

С помощью команды chmod изменяю права доступа к файлу lab10-1.asm с исходным текстом программы, добавляя права на исполнение для всех пользователей (рис. @fig:007).

![Изменение прав доступа](image/7.png){#fig:007 width=70%}

Совершаю проверку (рис. @fig:008). Так как исполняется просто файл с текстом,невозможно распознать команды,которые там прописаны.

![Проверка изменений](image/8.png){#fig:008 width=70%}

В соответствии с 12 вариантом из таблицы (--x -wx r-x; 001 011 101) предоставляю права доступа к файлу readme-1.txt в символьном виде, а к readme-2.asm в численном (рис. @fig:009).

![Предоставление прав доступа к readme-1.txt и readme-2.txt](image/9.png){#fig:009 width=70%}

С помощью команды ls и ключа -l проверяю права у 1 файла И у 2 (рис. @fig:010).

![Проверка изменений для readme-1.txt и readme-2.txt](image/10.png){#fig:010 width=70%}

!
## Задание для самостоятельной работы

Создаю новый файл lab10-2.asm для написание кода программы (рис. @fig:011).

![Создание файла](image/11.png){#fig:011 width=70%}

Пишу код программы,который работает по следующему алгоритму:
• Вывод приглашения “Как Вас зовут?”
• ввести с клавиатуры свои фамилию и имя
• создать файл с именем name.txt
• записать в файл сообщение “Меня зовут”
• дописать в файл строку введенную с клавиатуры
• закрыть файл
(рис. @fig:013)

```NASM
%include 'in_out.asm'
section .data
    nameRequest: db "Как вас зовут? - ", 0
    filename: db "name.txt", 0
    iam: db "Меня зовут "
    iamLength: equ $-iam
section .bss
    name: resb 255
section .text
    global _start
_start:
    mov eax, nameRequest
    call sprint
    mov ecx, name
    mov edx,255
    call sread
    mov ecx, 0777o
    mov ebx, filename
    mov eax, 8
    int 80h
    call _openfile
    mov edx, iamLength
    mov ecx, iam
    mov ebx, eax
    mov eax, 4
    int 80h
    call _closefile
    call _openfile
    mov edx, 2
    mov ecx, 0
    mov ebx, eax
    mov eax, 19
    int 80h
    mov esi, eax
    mov eax, name
    call slen
    mov edi, eax
    mov eax, esi
    mov edx, edi
    mov ecx, name
    mov eax, 4
    int 80h
    call _closefile
_end:
    call quit
_openfile:
    mov ecx, 2 
    mov ebx, filename
    mov eax, 5
    int 80h
    ret
_closefile:
    mov ebx, eax
    mov eax, 6
    int 80h
    ret
```
![Код программы](image/12.png){#fig:012 width=70%}

Запускаю программу и убеждаюсь,что она работает исправно (рис. @fig:013).

![Запуск кода программы](image/13.png){#fig:013 width=70%}


# Выводы

В данной лабораторной работе я научился приобрёл навыки написания программ для работы с файлами.

# Список литературы{.unnumbered}

Лабораторная работа №10
