# encoding: utf-8

def colorize(string)
  string.gsub(/#(.*?)#/, "\e[\\1m").gsub(/##/, "\e[0m")
end

def annotate(string, code = '4')
  string.gsub(/@(.*?)@/, "\e[#{code}m\\1\e[0m")
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

block colorize <<-EOS.chomp
##





    #1#П Р О Г Р А М И Р А Н Е   С   Н И Щ О##

 #38;5;241#-> f { -> x { f[x[x]] }[-> x { f[x[x]] }] }##






Стефан Кънев                   BlagoevgradConf
#36#\@skanev                        15 ноември 2014##
EOS

section 'За какво ще говоря?' do
  block <<-EOS
    За презентацията:

      * Непрактично, но забавно

      * Ламбда смятане, Y комбинатор, У-А!

      * Ще трябва да внимавате
  EOS

  center <<-EOS
    Презентацията е базирана на

    глава със същото име

    от една книга
  EOS

  image 'pics/uc.png'
end

section 'Fizz Buzz' do
  center <<-EOS
    FizzBuzz е въпрос за интервю
  EOS

  block <<-EOS
    Принтирайте числата от 1 до 100 като:

      * Вместо числата делими на 3: Fizz

      * Вместо числата делими на 5: Buzz

      * Вместо числата делими на 15: FizzBuzz
  EOS

  code <<-EOS
    (1..100).each do |n|
      if (n % 15).zero?
        puts 'FizzBuzz'
      elsif (n % 3).zero?
        puts 'Fizz'
      elsif (n % 5).zero?
        puts 'Buzz'
      else
        puts n
      end
    end
  EOS

  center <<-EOS
    Конвенционалната мъдрост:

    \e[1mDon't overthink FizzBuzz!\e[0m
  EOS

  center <<-EOS
    Какво ще напрвим днес?

    \e[1mТочно това!\e[0m
  EOS

  code <<-EOS, :perl
    \e[1mPerl:\e[0m

    map { print ((($_%3 ? "":"Fizz") .
                ($_%5 ? "":"Buzz") || $_) .  "\\n")
        } 1..100
  EOS

  code <<-EOS, :java
    \e[1mJava:\e[0m

    for (int i=1; i<=100; i++) {
        int a = ((528>>i%15-1)&1)*4;
        int b = ((-2128340926>>(i%15)*2)&3)*4;
        System.out.println("FizzBuzz".substring(a,b)
                      + (a==b?i:""));
    }
  EOS

  block <<-EOS
    \e[1mVim:\e[0m

    i<CR>puts 1<ESC>qqyyp<C-a>q98@q
    ggqq3jccputs 'Fizz'<ESC>q32@q
    ggqq5jccputs 'Buzz'<ESC>q19@q
    ggqq15jccputs 'FizzBuzz'<ESC>q5@q
    ggdd
  EOS

  code <<-EOS, :brainfuck
    Brainfuck:

    >++++++++++[<++++++++++>-]<[>+>[-]>++++++++++[<
    ++++++++++>-]<+<<[->>->+<<<]>>> [-<<<+>>>]<>>++
    +<<[->+>-[>+>>]>[+[-<+>]>+>>]<<<<<<]>[-<+>]+>[-
    ]>[<<->>[-]]>[-]<<<[[-]++++++++++[>++++++++++<-
    ]>++.+++.[-]<[-]+++++++++++[>+++++++++++<-]>+..
    [-]<[-]<<[-]>>]<>>+++++<<[->+>-[>+>>]>[+[-<+>]>
    +>>]<<<<<<]>[-<+>]+>[-]>[<<->>[-]]>[-]<<<[[-]++
    +++++++[>+++++++++++<-]>-.[-]<[-]+++++++++[>+++
    ++++++++++<-]>.+++++..[-]<[-]<<[-]>>]<<[[-]>>++
    ++++++++<[->-[>+>>]>[+[-<+>]>+>>]<<<<<]>[-]>>[>
    ++++++++[<++++++>-]<.[-]]<>++++++++[<++++++>-]<
    .[-]<<<]>[-]++++++++++.[-]<[-]<-]
  EOS

  block <<-EOS
    Нашата версия:

      * Леко модифициран проблем

      * Подмножество на Ruby

      * Яко анонимни функции
  EOS

  center <<-EOS
    Вместо да извеждаме числата

    ще ги събираме в масив
  EOS

  code <<-EOS
    (1..100).map do |n|
      if (n % 15).zero?
        'FizzBuzz'
      elsif (n % 3).zero?
        'Fizz'
      elsif (n % 5).zero?
        'Buzz'
      else
        n.to_s
      end
    end
  EOS
end

section 'Анонимни  функции' do
  code <<-EOS, :javascript
    twice = function(a) { return a + a; }

    twenty = twice(10)

    console.log(twenty)
  EOS

  code <<-EOS, :javascript
    odds = [1, 3, 5, 7, 9]

    evens = map(odds, function(a) { return a + a; })

    console.log(evens)

    // [2, 6, 10, 14, 18]
  EOS

  center <<-EOS
    Известни са още под името
    \e[1mламбда функции\e[0m
  EOS

  code <<-EOS
    twice = lambda { |a| a + a }

    twice = -> a { a + a }



    twice.call(2)

    twice.(2)

    twice[2]
  EOS

  center <<-EOS
    \e[1mНай-криптичен, но най-кратък:\e[0m

    -> a { a + a }[5]

    10
  EOS

  center <<-EOS
    Ламбди само с \e[1mедин\e[0m аргумент



    s = -> a, b { a * a + b * b }

    s[3, 4]



    s = -> a { -> b { a * a + b * b } }

    s[3][4]
  EOS

  block <<-EOS
    Изрази само със следната форма:



    I.     id

    II.    -> id { exp }

    III.   exp[exp]



    \e[1mid\e[0m е идентификатор, \e[1mexp\e[0m е израз
  EOS

  center <<-EOS
    \e[1mПримери:\e[0m

    a[b]

    -> x { x }

    a[b][-> x { x }]

    -> p { -> x { p[p[x]] } }

    -> a { -> b { -> c { a[b][c] } } }
  EOS

  code <<-EOS
    \e[1mДа си припомним решението\e[0m

    (1..100).map do |n|
      if (n % 15).zero?
        'FizzBuzz'
      elsif (n % 3).zero?
        'Fizz'
      elsif (n % 5).zero?
        'Buzz'
      else
        n.to_s
      end
    end
  EOS

  block <<-EOS
    \e[1mКакво трябва да имплементираме с ламбди?\e[0m

    Числа                Остатък при деление
    Булеви стойности     Списъци
    Текстови низове      1..100
    Условия              Map
    Сравнение с нула     Число → Низ
  EOS
end

section 'Числа чрез ламбди' do
  block <<-EOS
    Идея за представяне:

      * Всяко число е функция \e[1mn(p, x)\e[0m

      * Функцията прилага \e[1mn\e[0m пъти \e[1mp\e[0m върху \e[1mx\e[0m

      * 2 е \e[1mp[p[x]]\e[0m; 3 е \e[1mp[p[p[x]]]\e[0m

      * Може да използваме числата като функции
  EOS

  code <<-EOS
    ZERO  = -> p { -> x {       x    } }
    ONE   = -> p { -> x {     p[x]   } }
    TWO   = -> p { -> x {   p[p[x]]  } }
    THREE = -> p { -> x { p[p[p[x]]] } }
  EOS

  code <<-EOS
    exclaim = -> v { v + '!' }

    empty   = ''

    THREE[exclaim][empty]  # !!!



    add_1 = -> n { n + 1 }

    zero  = 0

    THREE[add_one][zero]   # 3
  EOS

  code <<-EOS
    Помощна функция:


    def to_integer(number)
      number[-> n { n + 1 }][0]
    end
  EOS

  center <<-EOS
    Можем ли да кажем, че

    -> p { -> x { p[p[p[p[p[x]]]]] } }

    всъщност е пет?
  EOS

  center <<-EOS
    Какво е пет?
  EOS

  center <<-EOS
    5

    V

    Пет

    0000 0101

    -> p { -> x { p[p[p[p[p[x]]]]] } }
  EOS

  center <<-EOS
    -> p { -> x { p[p[p[p[p[x]]]]] } }

    е "достатъчно" пет
  EOS

  center <<-EOS
    Върху това представяне също могат

    да се дефинират операции
  EOS

  center <<-EOS




    INCREMENT = -> n { -> p { -> x { p[n[p][x]] } } }



    \e[90m(по-късно: още операции)\e[0m
  EOS

  block <<-EOS
    \e[1mВнимание!\e[0m

    Въпреки че ползваме константи (\e[1mINCREMENT\e[0m),
    ще се постараем да за заменими с код,
    т.е. да няма цикли между тях.



    INCREMENT[TWO]

    -> n { -> p { -> x { p[n[p][x]] } } }[
      -> p { -> x { p[p[x]] } }
    ]
  EOS

  code annotate <<-EOS
    (@ONE@..@HUNDRED@).map do |n|
      if (n % @FIFTEEN@).zero?
        'FizzBuzz'
      elsif (n % @THREE@).zero?
        'Fizz'
      elsif (n % @FIVE@).zero?
        'Buzz'
      else
        n.to_s
      end
    end
  EOS
end

section 'Условия и булев тип' do
  code <<-EOS
    TRUE  = -> x { -> y { x } }

    FALSE = -> x { -> y { y } }
  EOS

  code <<-EOS
    def to_boolean(bool)
      bool[true][false]
    end
  EOS

  code <<-EOS
    IF = -> b { -> x { -> y { b[x][y] } } }



    IF[TRUE]['Yes']['No']

    IF[FALSE]['Yes']['No']
  EOS

  center <<-EOS
    Следните редове код са еквивалентни

    -> a { x[a] }

    x
  EOS

  code <<-EOS
    IF може да се опрости:



    IF = -> b { -> x { -> y { b[x][y] } } }

    IF = -> b { -> x { b[x] } }

    IF = -> b { b }
  EOS

  code annotate <<-EOS
    (ONE..HUNDRED).map do |n|
      @IF@[(n % FIFTEEN).zero?][
        'FizzBuzz'
      ][@IF@[(n % THREE).zero?][
        'Fizz'
      ][@IF@[(n % FIVE).zero?][
        'Buzz'
      ][
        n.to_s
      ]]]
    end
  EOS

  code <<-EOS
    IS_ZERO = -> n { n[-> x { FALSE }][TRUE] }
  EOS

  code annotate <<-EOS
    (ONE..HUNDRED).map do |n|
      IF[@IS_ZERO@[n % FIFTEEN]][
        'FizzBuzz'
      ][IF[@IS_ZERO@[n % THREE]][
        'Fizz'
      ][IF[@IF_ZERO@[n % FIVE]][
        'Buzz'
      ][
        n.to_s
      ]]]
    end
  EOS
end

section 'Двойки, списъци (1)' do
  center <<-EOS
    В Lisp има тип за двойка

    ┌─────┬─────┐
    │ car │ cdr │
    └─────┴─────┘
  EOS

  center <<-EOS
    С двойки може да се имплементира списък



    [1, 2, 3]

    pair(1, pair(2, pair(3, null)))
  EOS

  block <<-EOS
    ┌───┬───┐
    │ 1 │ ⦿ │
    └───┴───┘
          ↓
        ┌───┬───┐
        │ 2 │ ⦿ │
        └───┴───┘
              ↓
            ┌───┬───┐
            │ 3 │ ╳ │
            └───┴───┘
  EOS

  code <<-EOS
    PAIR  = -> x { -> y { -> f { f[x][y] } } }

    LEFT  = -> p { p[-> x { -> y { x } }] }

    RIGHT = -> p { p[-> x { -> y { y } }] }
  EOS

  code <<-EOS
    primes = PAIR[TWO][THREE]

    LEFT[primes]    # TWO

    RIGHT[primes]   # THREE
  EOS

  center <<-EOS
    Имплементация на списъци:

    по-късно
  EOS
end

section 'Аритметични операции' do
  code <<-EOS
    ADD      = -> m { -> n { n[INCREMENT][m] } }

    MULTIPLY = -> m { -> n { n[ADD[m]][ZERO] } }

    POWER    = -> m { -> n { n[MULTIPLY[m]][ONE] } }
  EOS

  center <<-EOS
    Но как да имплементираме

    изваждане и деление?
  EOS

  code <<-EOS
    def s(pair)
      [pair.last, pair.last + 1]
    end
    p = [0, 0]


    p                       # [0, 0]
    s(p)                    # [0, 1]
    s(s(p))                 # [1, 2]
    s(s(s(p)))              # [2, 3]
    s(s(s(s(p))))           # [3, 4]
    s(s(s(s(s(p)))))        # [4, 5]
  EOS

  center <<-EOS
    След n приложения:

    [n - 1, n]
  EOS

  code <<-EOS
    SLIDE = -> p {
      PAIR[RIGHT[p]][INCREMENT[RIGHT[p]]]
    }

    # [p.right, p.right + 1]



    DECREMENT = -> n {
      LEFT[n[SLIDE][PAIR[ZERO][ZERO]]]
    }

    # n[slide]([0, 0]).left
  EOS

  code <<-EOS
    ADD      = -> m { -> n { n[INCREMENT][m] } }

    SUBTRACT = -> m { -> n { n[DECREMENT][m] } }
  EOS

  center <<-EOS
    Добре, ами деление с остатък?

    Умножението е повторено събиране

    Делението е повторено изваждане
  EOS

  code <<-EOS
    def mod(m, n)
      if n <= m
        mod(m - n, n)
      else
        m
      end
    end
  EOS

  center <<-EOS
    \e[1m≤\e[0m
  EOS

  center <<-EOS
    m ≤ n     \e[1m⟺\e[0m       m - n ≤ 0
  EOS

  block <<-EOS
    to_integer SUBTRACT[TWO][FIVE]

    ⇒ 0

    \e[36mwhoops ;)\e[0m
  EOS

  code <<-EOS
    IS_LESS_OR_EQUAL_TO = -> m {
      -> n {
        IS_ZERO[SUBTRACT[m][n]]
      }
    }
  EOS

  code <<-EOS
    def mod(m, n)
      if n <= m
        mod(m - n, n)
      else
        m
      end
    end
  EOS

  code <<-EOS
    \e[1mКакво ще кажете за?:\e[0m

    MOD = -> m {
      -> n {
        IF[IS_LESS_OR_EQUAL_TO[n][m]][
          MOD[SUBTRACT[m][n]][n]
        ][
          m
        ]
      }
    }
  EOS

  center <<-EOS
    stack level too deep (\e[1mSystemStackError\e[0m)
  EOS

  code <<-EOS
    def mod(m, n)
      IF[n < m][
        mod(m - n, n)
      ][
        m
      ]
    end
  EOS

  code <<-EOS
    def mod(m, n)
      a = mod(m - n, n)

      IF[n < m][a][m]
    end
  EOS

  center <<-EOS
    Следните са еквивалентни:

    a

    -> x { a[x] }
  EOS

  code annotate(<<-EOS, 32)
    MOD = -> m {
      -> n {
        IF[IS_LESS_OR_EQUAL_TO[n][m]][
          @-> x {@ MOD[SUBTRACT[m][n]][n]@[x] }@
        ][
          m
        ]
      }
    }
  EOS

  center <<-EOS
    Всичко супер, но:

    Има цикъл ;(
  EOS

  code annotate <<-EOS
    @MOD@ = -> m {
      -> n {
        IF[IS_LESS_OR_EQUAL_TO[n][m]][
          -> x { @MOD@[SUBTRACT[m][n]][n][x] }
        ][
          m
        ]
      }
    }
  EOS

  center <<-EOS
    Как да направим рекурсивна функция,

    без да й даваме име?
  EOS

  code annotate <<-EOS
    def factorial(n)
      if n.zero?
        1
      else
        n * @factorial@(n - 1)
      end
    end
  EOS

  block <<-EOS
    \e[1m
    \\ /   _ _  _ _ |_ . _  _ _|_ _  _
     |   (_(_)| | ||_)|| |(_| | (_)|
    \e[0m
  EOS

  code annotate(<<-EOS, 36)
    factorial = Y[-> @f@ {
      -> n {
        if n.zero?
          1
        else
          n * @f@[n - 1]
        end
      }
    }]
  EOS

  center <<-EOS
    Ама как работи?

    \e[1mЛесно!\e[0m
  EOS

  center <<-EOS
    Y = -> f { -> x { f[x[x]] }[-> x { f[x[x]] }] }


    \e[90m(normal-order Y combinator)\e[0m
  EOS

  code <<-EOS
    Y = -> f {
      -> x {
        f[-> y { x[x][y] }]
      }[-> x {
        f[-> y { x[x][y] }]
      }]
    }


    \e[90m(applicative-order)\e[0m
  EOS

  code annotate(<<-EOS, '32')
    MOD = @Y[-> f {@
      -> m {
        -> n {
          IF[IS_LESS_OR_EQUAL_TO[n][m]][
            -> x { @f@[SUBTRACT[m][n]][n][x] }
          ][
            m
          ]
        }
      }
    @}]@
  EOS

  code annotate <<-EOS
    (ONE..HUNDRED).map do |n|
      IF[IS_ZERO[@MOD[n][FIFTEEN]@]][
        'FizzBuzz'
      ][IF[IS_ZERO[@MOD[n][THREE]@]][
        'Fizz'
      ][IF[IF_ZERO[@MOD[n][THREE]@]][
        'Buzz'
      ][
        n.to_s
      ]]]
    end
  EOS
end

section 'Списъци и операциите им' do
  center <<-EOS
    Ще ползваме

    PAIR[left][right]
  EOS

  block <<-EOS
    EMPTY    = PAIR[TRUE][TRUE]

    UNSHIFT  = -> l { -> x {
                 PAIR[FALSE][PAIR[x][l]]
               } }

    IS_EMPTY = LEFT

    FIRST    = -> l { LEFT[RIGHT[l]] }

    REST     = -> l { RIGHT[RIGHT[l]] }
  EOS

  block <<-EOS
    EMPTY    = PAIR[TRUE][TRUE]

             ┌───┬───┐
             │ ✔ │ ✔ │
             └───┴───┘
  EOS

  block <<-EOS
    UNSHIFT = -> l {
      -> e {
        PAIR[FALSE][PAIR[e][l]]
      }
    }

       ┌───┬───┐   ┌───┬───┐
       │ × │ ⦿ │ → │ e │ l │
       └───┴───┘   └───┴───┘
  EOS

  block <<-EOS
    FIRST    = -> l { LEFT[RIGHT[l]] }

    REST     = -> l { RIGHT[RIGHT[l]] }

    IS_EMPTY = LEFT



             ┌───┬───┐   ┌───┬───┐
    UNSHIFT: │ × │ ⦿ │ → │ e │ l │
             └───┴───┘   └───┴───┘

             ┌───┬───┐
      EMPTY: │ ✔ │ ✔ │
             └───┴───┘
  EOS


  block <<-EOS
                      [1, 2]

      UNSHIFT[ UNSHIFT[TWO][EMPTY] ][ ONE ]


    ┌───┬───┐   ┌───┬───┐
    │ × │ ⦿ │ → │ 1 │ ⦿ │
    └───┴───┘   └───┴───┘
                      ↓
                    ┌───┬───┐   ┌───┬───┐
                    │ × │ ⦿ │ → │ 2 │ ⦿ │
                    └───┴───┘   └───┴───┘
                                      ↓
                                    ┌───┬───┐
                                    │ ✔ │ ✔ │
                                    └───┴───┘
  EOS

  code <<-EOS
    def to_array(list)
      array = []

      until to_boolean(IS_EMPTY[list])
        array.push(FIRST[list])

        list = REST[list]
      end

      array
    end
  EOS

  code <<-EOS
    numbers = UNSHIFT[
      UNSHIFT[
        UNSHIFT[EMPTY][THREE]
      ][TWO]
    ][ONE]



    to_array(numbers).map { |n| to_integer n }

    # [1, 2, 3]
  EOS

  center <<-EOS
    1..100
  EOS

  code <<-EOS
    def range(m ,n)
      if m <= n
        range(m + 1, n).unshift(m)
      else
        []
      end
    end
  EOS

  code <<-EOS
    RANGE = Y[-> f {
      -> m { -> n {
        IF[IS_LESS_OR_EQUAL_TO[m][n]][
          -> x {
            UNSHIFT[ f[INCREMENT[m]][n] ][ m ][ x ]
          }
        ][
          EMPTY
        ]
      } }
    }]
  EOS

  code annotate <<-EOS
    @RANGE[ONE][HUNDRED]@.map do |n|
      IF[IS_ZERO[MOD[n][FIFTEEN]]][
        'FizzBuzz'
      ][IF[IS_ZERO[MOD[n][THREE]]][
        'Fizz'
      ][IF[IF_ZERO[MOD[n][THREE]]][
        'Buzz'
      ][
        n.to_s
      ]]]
    end
  EOS

  code <<-EOS
    def map(list, func)
      if list.empty?
        []
      else
        map(REST[list]).unshift(func[FIRST[list]])
      end
    end
  EOS

  code <<-EOS
    MAP = Y[-> m {
      -> l { -> f {
        IF[IS_EMPTY[l]][
          EMPTY
        ][
          UNSHIFT[
            -> x { m[ REST[l] ][ f ][ x ] }
          ][
            f[FIRST[l]]
          ]
        ]
      } }
    }]
  EOS


  code annotate(<<-EOS, 32)
    \e[1mРекурсивна функция:\e[0m

    MAP = @Y[-> m {@
      -> l { -> f {
        IF[IS_EMPTY[l]][
          EMPTY
        ][
          UNSHIFT[
            -> x { @m@[ REST[l] ][ f ][ x ] }
          ][
            f[FIRST[l]]
          ]
        ]
      } }
    @}]@
  EOS

  code annotate(<<-EOS, 32)
    \e[1mМързелив резултат:\e[0m

    MAP = Y[-> m {
      -> l { -> f {
        IF[IS_EMPTY[l]][
          EMPTY
        ][
          UNSHIFT[
            @-> x {@ m[ REST[l] ][ f ]@[ x ] }@
          ][
            f[FIRST[l]]
          ]
        ]
      } }
    }]
  EOS

  code annotate <<-EOS
    @MAP[@RANGE[ONE][HUNDRED]@][-> n {@
      IF[IS_ZERO[MOD[n][FIFTEEN]]][
        'FizzBuzz'
      ][IF[IS_ZERO[MOD[n][THREE]]][
        'Fizz'
      ][IF[IF_ZERO[MOD[n][THREE]]][
        'Buzz'
      ][
        n.to_s
      ]]]
    @}]@
  EOS
end

section 'Текстови низове' do
  center <<-EOS
    Простичко:

    измисляме си собствен \e[1mencoding\e[0m

    число → символ
  EOS

  code <<-EOS
    Число    Символ
    ────────────────
      0    →   '0'
      1    →   '1'
      2    →   '2'
      3    →   '3'
      4    →   '4'
      5    →   '5'
      6    →   '6'
      7    →   '7'
      8    →   '8'
      9    →   '9'
     10    →   'F'
     11    →   'B'
     12    →   'i'
     13    →   'u'
     14    →   'z'
  EOS

  block <<-EOS
                 Число    Символ
                 ────────────────
                  10    →   'F'
                  11    →   'B'
                  12    →   'i'
                  13    →   'u'
                  14    →   'z'




    FizzBuzz → [10, 12, 14, 14, 11, 13, 14, 14]
  EOS

  code <<-EOS
    TEN = MULTIPLY[TWO][FIVE]
    F   = TEN
    B   = INCREMENT[F]
    I   = INCREMENT[B]
    U   = INCREMENT[I]
    Z   = INCREMENT[U]

    UN = UNSHIFT

    FIZZ     = UN[UN[UN[UN[EMPTY][Z]][Z]][I]][F]
    BUZZ     = UN[UN[UN[UN[EMPTY][Z]][Z]][U]][B]
    FIZZBUZZ = UN[UN[UN[UN[BUZZ][Z]][Z]][I]][F]
  EOS

  code annotate <<-EOS
    MAP[RANGE[ONE][HUNDRED]][-> n {
      IF[IS_ZERO[MOD[n][FIFTEEN]]][
        @FIZZBUZZ@
      ][IF[IS_ZERO[MOD[n][THREE]]][
        @FIZZ@
      ][IF[IF_ZERO[MOD[n][THREE]]][
        @BUZZ@
      ][
        n.to_s
      ]]]
    }]
  EOS

  center <<-EOS
    n.to_s ?
  EOS

  code <<-EOS
    def to_digits(n)
      previous_digits =
        if n < 10
          []
        else
          to_digits(n / 10)
        end

      previous_digits.push(n % 10)
    end
  EOS

  center <<-EOS
    n / 10

    [].push(n)
  EOS

  code <<-EOS
    DIV =
      Y[-> f { -> m { -> n {
        IF[IS_LESS_OR_EQUAL_TO[n][m]][
          -> x {
            INCREMENT[f[SUBTRACT[m][n]][n]][x]
          }
        ][
          ZERO
        ]
    } } }]
  EOS

  code <<-EOS
    PUSH =
      Y[-> f {
          -> l {
            -> e {
              IF[IS_EMPTY[l]][
                UNSHIFT[EMPTY][e]
              ][
                UNSHIFT[
                  -> x { f[REST[l]][e][x] }
                ][
                  FIRST[l]
                ]
              ]
           }
        }
    }]
  EOS

  code <<-EOS
    TO_DIGITS =
      Y[-> f { -> n {
        PUSH[
          IF[IS_LESS_OR_EQUAL_TO[n][DECREMENT[TEN]]][
            EMPTY
          ][
            -> x { f[DIV[n][TEN]][x] }
          ]
        ][
          MOD[n][TEN]
        ]
    } }]
  EOS

  center <<-EOS
    ✨   ✨   ✨

    ... drumroll ...

    ✨   ✨   ✨
  EOS

  code annotate <<-EOS
    MAP[RANGE[ONE][HUNDRED]][-> n {
      IF[IS_ZERO[MOD[n][FIFTEEN]]][
        FIZZBUZZ
      ][IF[IS_ZERO[MOD[n][THREE]]][
        FIZZ
      ][IF[IS_ZERO[MOD[n][FIVE]]][
        BUZZ
      ][
        @TO_DIGITS[n]@
      ]]]]
    }]
  EOS
end

section 'Demonstration' do
end

section 'The big picture' do
  center <<-EOS
    \e[1mПолезно на практика?\e[0m

    Едва ли
  EOS

  center <<-EOS
    \e[1mПолезно някъде?\e[0m

    Дизайн и имплементация
    на езици
  EOS

  center <<-EOS
    \e[1mФилософски изводи\e[0m

    Ламбда смятането е Turing Complete
    Всяко изчисление (програма) може да
    се напише така
  EOS

  center <<-EOS
    \e[1mДруги универсални неща\e[0m

    SKI combinatorics
    Iota calculus
    (Cyclic) Tag systems
    Rule 110
  EOS
end

section 'Благодаря ви!' do
end
