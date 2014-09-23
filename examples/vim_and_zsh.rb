# encoding: utf-8

def annotate(string, code = '4')
  string.gsub(/@(.*?)@/, "\e[#{code}m\\1\e[0m")
end

def colorize(string)
  string.gsub(/#(\d+)#/, "\e[\\1m").gsub(/##/, "\e[0m")
end

block colorize(<<-EOS)
┌───────────────── Dimension test ─────────────────┐
│                                                  │
│                                                  │
│                                                  │
│                                                  │
│    Color Test                                    │
│                                                  │
│    #90#█████ The quick brown fox jumps over the##      │
│    #31#█████ The quick brown fox jumps over the##      │
│    #1##31#█████ The quick brown fox jumps over the##      │
│    #32#█████ The quick brown fox jumps over the##      │
│    #36#█████ The quick brown fox jumps over the##      │
│    █████ The quick brown fox jumps over the##      │
│                                                  │
│                                                  │
│                                                  │
│                                                  │
└──────────────────────────────────────────────────┘
EOS

code colorize <<-EOS
                   o8o
                   `"'
      oooo    ooo oooo  ooo. .oo.  .oo.
       `88.  .8'  `888  `888P"Y88bP"Y88b
        `88..8'    888   888   888   888
         `888'     888   888   888   888
          `8'     o888o o888o o888o o888o

                             oooo
                             `888
           oooooooo  .oooo.o  888 .oo.
          d'""7d8P  d88(  "8  888P"Y88b
            .d8P'   `"Y88b.   888   888
          .d8P'  .P o.  )88b  888   888
         d8888888P  8""888P' o888o o888o

Стефан Кънев                      BlagoevgradConf
#36#\@skanev                          30 ноемврви 2013##
EOS

block colorize <<-EOS
  #1#\$ whoami##
  - програмист
    • сега: Ruby, уеб
    • преди: Java, Python, PHP, Perl
  - интереси
    • езици за програмиране
    • теоритични неща
    • прагматични неща
  - често адвокат на дявола
  - http://skanev.com/
  - @skanev
EOS

section 'За какво ще говоря?' do
  center <<-EOS
    Ще се опитам да отговоря

    на \e[1mедин въпрос\e[0m?
  EOS

  center <<-EOS
    Защо хората (вклч. аз)

    ползват Vim?
  EOS

  center <<-EOS
    Едно време си задавах същия въпрос

    В момента трудно отговарям на него
  EOS

  center 'Моята история'

  block <<-EOS
    Моята история:

      * Едно време пишех на Java (Eclipse)

      * Работех с Oscar и Marcus

      * Единия ползваше Emacs, другия Vim

      * Постоянно спореха

      * Въобще не схващах защо
  EOS

  block <<-EOS
    Моята история (2):

      * Дотогава: всеки език различно

      * VisualStudio, UltraEdit, DrScheme

      * Имах базови познания за shell
  EOS

  block <<-EOS
    Моята история (3):

      * През 2006 започнах нов проект на Python

      * Тогава нямаше добро IDE \e[90m(все още няма)\e[0m

      * Казах си: what the hell, ще уча Vim

      * Нямаше всички ресурси, които има сега
  EOS

  block <<-EOS

    Защо                                   Защо
  ползвате ←──────────────────────────→ разработвам
    Vim?             8 години             с Vim?

   \e[36m(2005)                                 (2013)\e[0m
  EOS

  block <<-EOS
                  Презентацията

    ┌───────────────────┬───────────────────┐
    │                   │                   │
    │   50% мотивация   │   50% vim & zsh   │
    │                   │                   │
    └───────────────────┴───────────────────┘
  EOS

  block <<-EOS
  editor:        vim       emacs     SublimeText
                  ←──────────────────────────────→
   shell:        zsh  bash                     fish





      Някои неща ще са специфични за vim & zsh

                    Повечето няма
  EOS

  block <<-EOS
    Защо аргумента е труден?
    ────────────────────────

      * дребните подобрения са по-малко
        забележими от големите

      * големите усложнеия изглеждат по-сериозни
        от дребните

      * tradeback: малко големи за много дребни

      * изплаща се, но не си личи без задълбочаване


  EOS
end

section 'Начинаещи и експерти' do
  block <<-EOS
    Начинаещият
    ───────────

      * има нужда от прости правила

      * не може да използват контекста

      * има много неща за откриване
  EOS

  block <<-EOS
    Експертът
    ─────────

      * има собствени подходи и процес

      * вижда и себе си и пробема като част от
        една система

      * работи предимно интуитивно
  EOS

  center "Можете ли да плувате?\n"

  block <<-EOS
    Умения при плувците
    ───────────────────

      * Един спортист прекарва голяма част от
        тренировката си в упражнения за техника

      * Добрата техника е важна за да можеш да се
        фокусираш върху по-трудните неща

      * Редакцията на текст и пускането на команди
        са "техниката" в разработването на софтуер
  EOS
end

section "IDE  vs.  vim" do
  block <<-EOS
    IDE's:

      * Дава рамки за работа

      * Документира езика и процеса

      * Страхотно е за начинаещи
  EOS

  block colorize <<-EOS
    IDE Features
    ────────────

    text editing
    file/code navigation
    syntax highlighting
    building & testing
    completion
    refactoring
    debugging
    high-level code understanding
    discoverability
  EOS

  block <<-EOS
    Колко важно е discoverability-то?

      * IDE: и за средата, и за езика

      * Много важно за начинаещи

      * Пренебрежимо за експерти
  EOS

  center <<-EOS
    Vim определено има UI проблем

    но това афектира само

    learning curve-а
  EOS

  center <<-EOS
    Отвъд това, как изглежда сравнението?
  EOS

  block colorize <<-EOS
    #32#text editing##
    #32#file/code navigation##
    #36#syntax highlighting##
    #36#building & testing##
    #36#completion##
    #33#refactoring##
    #33#debugging##
    #31#high-level code understanding##
    #1##31#discoverability##


    Vim е:   #32#по-добре   #36#сравнително
             #33#по-зле     #31#много по-зле
             #1##31#трагично##
  EOS

  center <<-EOS
    Не стана ясно, но дотук

    ставаше въпрос за \e[1mC и C++\e[0m
  EOS

  center <<-EOS
    Java (и C#) винаги ще има по-добри IDE-та

    Това е част от дизайна на езика
  EOS

  center <<-EOS
    При Ruby (и Python) не е така

    IDE-та се опитват, но не са същото
  EOS

  center <<-EOS
    Erlang, Clojure, Scala, Haskell,

    Elexir, JavaScript, Go?

    почти нищо
  EOS

  center <<-EOS
    А какви са слабостите

    на IDE-тата?
  EOS

  block colorize <<-EOS
    IDE Слабости
    ────────────

      * Customization
        #90#(невъзможно или поне много трудно)##

      * Uniformity
        #90#(ако имате проект на четири езика)##

      * Automation
        #90#(непредвидени неща)##

      * Adaptation
        #90#(my way or the highway)##

    Тези неща са #1#важни## за експерта
  EOS

  block colorize <<-EOS
    ─────────────────────────────────────────

    Vim и zsh жертват #1##31#discoverability## и малко

    #31#high-level code understanding## за

    #32#автоматизация##, #32#гъвкавост## и #32#персонализация##

    ─────────────────────────────────────────
  EOS

  block <<-EOS
    Реитерация
    ──────────

      * Един редактор, преносим навсякъде

      * Много повече автоматизация, гъвкавост
        и персонализация

      * Сериозен learning-curve

      * Още не сме говорили за community
  EOS

  block <<-EOS
    Експертите отново
    ─────────────────

      * Редактор/shell е ценен инструмент в репертоара
        на един експерт

      * Не е религиозен въпрос - Eclipse за Java,
        vim за (например) Clojure

      * Ако не искате да ставате експерти, може спокойно
        да си живеете само с Visual Studio

      * Не всеки Vim-аджия е експерт и не всеки експерт
        знае Vim (или Emacs)
  EOS
end

section 'vim & zsh' do
  block <<-EOS
    \e[1mDisclaimer\e[0m: и двете са перверзни
  EOS

  block <<-EOS
    Quirks
    ──────

      * Шантав, странен, оплетен, лошо дизайннат,
        криптичен и контра-интуитивен език

      * Обратното на практиките за добър код, на
        които съм върл привърженик

      * Кодя отдавна и обичам яки хакове като
        тези от едно време в C++

      * Това ми доставя удоволствие. Работа и OS -
        чист и подреден. В моите неща - юруш
  EOS

  block <<-EOS
    Community
    ─────────

      * Vim има плъгини за всичко. Повече човеко-
        часове, отколкото което и да е IDE

      * Видеа, блогове, IRC канали, книги

      * Training wheels: janus & oh-my-zsh
  EOS

  block <<-EOS
    20+ години
    ──────────

      * Vim е на 22 години (vi е по-старо)

      * Ще оцелее през цялата ви кариера

      * Хора търкалят конфигурация десетки години

      * OpenSource (Sun, Oracle и MySQL, anyone?)

      * Уверени ли сте, че вашата среда ще
        оцелее толкова?
  EOS
end

section 'Защо Vim?' do
  center <<-EOS
    insert vs. normal
  EOS

  block annotate <<-EOS, 1
    Местене
    ───────

      * @hjkl@ - ергономичност

      * @wb@, @()@, @[]@ - бърза навигация

      * @^@, @$@, @_@, @0@ - скачане

      * @fq;;@, @/bar@ - търсене
  EOS

  block annotate <<-EOS, 1
    Език от действия
    ────────────────

      * @d3w@ - изтрий три думи

      * @cf)@ - "промени" до затварящата скоба

      * @ya[@ - копирай обграждащия масив

      * @cit@ - промени съдържанието на <tag></tag>
  EOS

  block annotate <<-EOS, 1
    Разни дребни детайли
    ────────────────────

      * @ma@, @'a@ - marks

      * @ya@, @qa@ - регистри и макроси

      * @!@ - филтриране

      * @g-@, @g+@ - undo tree
  EOS

  center annotate <<-EOS, 1
    @Дотук@: немодифициран Vim

    @Следва@: добавки
  EOS

  block annotate <<-EOS, 1
    Файлова навигация
    ─────────────────

      * @NERDTree@ - дърво на проекта

      * @CtrlP@ - fuzzy find

      * @bufexplorer@ - отворени буфери

      * Всесъзможни @tag@ генератори
  EOS

  block annotate <<-EOS, 1
    Популярни
    ─────────

      * @snipMate@ - snippet-и като в TextMate

      * @fugitive@, @extradite@ - git интеграция

      * @syntastic@ - syntax checking

      * @SuperTab@ - забавен completion
  EOS

  block annotate <<-EOS, 1
    Party tricks
    ────────────

      * @EasyMotion@ - навигация

      * @Matrix@ - забавни ефекти

      * @afterimage@ - w00t
  EOS

  block annotate <<-EOS, 1
    Интеграции
    ──────────

      * @rails.vim@ - Best Rails Thing EVER

      * @fireplace@ - Clojure!

      * @Pyclewn@ - C/Python debugger

      * @eclim@ - Eclipse истории
  EOS

  block annotate <<-EOS, 1
    Персонализация
    ──────────────

      * @.vimrc@ - Extract Temp Variable

      * @digraphs.vim@ - разни символи

    \e[90m(прости примери с педагогическа цел)\e[0m
  EOS

end

section 'Защо zsh?' do
  center <<-EOS
    Почти bash-compatible

    Има разлики, но малки
  EOS

  center <<-EOS
    Много благинки за интерактивен режим

    Няколко благинки за скриптиране
  EOS

  block annotate <<-EOS, 1
    Дреболийки
    ──────────

      * @rprompt@ - prompt отдясно

      * @global/suffix aliases@

      * @shared history@ - опционално

      * @pattern expansion@ - и подходящо undo

      * @remote completion@ - bling bling
  EOS

  center annotate <<-EOS, 1
    Любим feature
    ──────────────────────────

    @rm -rf *@ иска потвърждение

    @rm * .log@ anyone?
  EOS

  block annotate <<-EOS, 1
    Други благинки
    ──────────────

      * @zle, widgets@ - M-q, M-h, M-e

      * @completion@ - enterprise ready

      * @autocorrection@ - понякога дразни

      * @extended globbing@ - **/(@:e)

      * @по-мощен език@ - разни яки неща
  EOS

  block annotate <<-EOS, 1
    Персоналицазия
    ──────────────

      * @figlet-browse-fonts@

      * @select-emacs@

      * @pre-commit-msg@

    \e[90m(прости примери с педагогическа цел)\e[0m
  EOS
end

section 'Learning curves' do
  block <<-EOS
    There is no Royal Road to geometry

                              ─ Euclid
  EOS

  block annotate <<-EOS, 1
    Трикове
    ───────

    1. @Перверзността@ помага - добре е да е забавно

    2. Прочетете @цялата@ документация (поне) веднъж

    3. Създайте @cheatsheat@ и го сложете подръка

    4. Нови клавиши/команди - @по един на ден@

    5. @Golfing@ - може ли по-кратко/по-добре?
  EOS

  block annotate <<-EOS, 1
    Training wheels
    ───────────────

    Vim: @janus@, @spf13@

    zsh: @oh-my-zsh@

    all: просто вземете нечии dotfiles
  EOS

  block annotate <<-EOS, 1
    Ресурси
    ───────

      * Practical Vim, vimcasts.org

      * zsh user guide

      * Destroy all Software, Play by Play

      * Нечии dotfiles
  EOS
end

section 'Благодаря ви!'
