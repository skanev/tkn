$VERBOSE = nil

def to_integer(number)
  number[-> n { n + 1 }][0]
end

ZERO  = -> p { -> x {       x    } }
ONE   = -> p { -> x {     p[x]   } }
TWO   = -> p { -> x {   p[p[x]]  } }
THREE = -> p { -> x { p[p[p[x]]] } }

FIVE    = -> p { -> x { p[p[p[p[p[x]]]]] } }
FIFTEEN = -> p { -> x { p[p[p[p[p[p[p[p[p[p[
  p[p[p[p[p[x]]]]]]]]]]]]]]] } }
HUNDRED = -> p { -> x { p[p[p[p[p[p[p[p[p[p[
  p[p[p[p[p[p[p[p[p[p[p[p[p[p[p[p[p[p[p[p[p[
  p[p[p[p[p[p[p[p[p[p[p[p[p[p[p[p[p[p[p[p[p[
  p[p[p[p[p[p[p[p[p[p[p[p[p[p[p[p[p[p[p[p[p[
  p[p[p[p[p[p[p[p[p[p[p[p[p[p[p[p[p[p[p[p[p[
  p[p[p[p[p[p[x]]]]]]]]]]]]]]]]]]]]]]]]]]]]]
  ]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]
  ]]]]]]]]]]]]]]]]]]]]]]]]]]]]] } }

THREE[-> v { '!' + v }]['']
TWO[-> n { n + 1 }][0]

p to_integer(ZERO)
p to_integer(ONE)
p to_integer(TWO)
p to_integer(FIVE)
p to_integer(FIFTEEN)
p to_integer(HUNDRED)

=begin
(ONE..HUNDRED).map do |n|
  if (n % FIFTEEN).zero?
    'FizzBuzz'
  elsif (n % THREE).zero?
    'Fizz'
  elsif (n % FIVE).zero?
    'Buzz'
  else
    n.to_s
  end
end
=end

=begin
def true(x, y)
  x
end

def false(x, y)
  y
end

def if(boolean, x, y)
  boolean[x][y]
end
=end

def to_boolean(bool)
  bool[true][false]
end

TRUE  = -> x { -> y { x } }
FALSE = -> x { -> y { y } }

=begin
Simplification:

-> a { -> b { a[b] } }
-> a { a }
=end

IF = -> b { -> x { -> y { b[x][y] } } }
IF = -> b { -> x { b[x] } }
IF = -> b { b }

p IF[TRUE]['Yes :)']['No ;(']
p IF[FALSE]['Yes :)']['No ;(']

=begin
(ONE..HUNDRED).map do |n|
  IF[(n % FIFTEEN).zero?][
    'FizzBuzz'
  ][IF[(n % THREE).zero?][
    'Fizz'
  ][IF[(n % FIVE).zero?][
    'Buzz'
  ][
    n.to_s
  ]]]
end
=end

def zero?(number)
  number[-> x { FALSE }][TRUE]
end

IS_ZERO = -> n { n[-> x { FALSE }][TRUE] }

=begin
(ONE..HUNDRED).map do |n|
  IF[IS_ZERO[n % FIFTEEN]][
    'FizzBuzz'
  ][IF[IS_ZERO[n % THREE]]][
    'Fizz'
  ][IF[IF_ZERO[n % FIVE]]][
    'Buzz'
  ][
    n.to_s
  ]]]
end
=end

INCREMENT = -> n { -> p { -> x { p[n[p][x]] } } }

p to_integer(INCREMENT[INCREMENT[FIVE]])

PAIR  = -> x { -> y { -> f { f[x][y] } } }
LEFT  = -> p { p[-> x { -> y { x } }] }
RIGHT = -> p { p[-> x { -> y { y } }] }

p LEFT[PAIR[2][3]]
p RIGHT[PAIR[2][3]]

ADD      = -> m { -> n { n[INCREMENT][m] } }
MULTIPLY = -> m { -> n { n[ADD[m]][ZERO] } }
POWER    = -> m { -> n { n[MULTIPLY[m]][ONE] } }

p to_integer POWER[TWO][THREE]

SLIDE     = -> p { PAIR[RIGHT[p]][INCREMENT[RIGHT[p]]] }
DECREMENT = -> n { LEFT[n[SLIDE][PAIR[ZERO][ZERO]]] }

p to_integer DECREMENT[FIVE]

SUBTRACT = -> m { -> n { n[DECREMENT][m] } }

p to_integer SUBTRACT[FIVE][TWO]

IS_LESS_OR_EQUAL_TO = -> m { -> n { IS_ZERO[SUBTRACT[m][n]] } }

p to_boolean IS_LESS_OR_EQUAL_TO[FIVE][TWO]
p to_boolean IS_LESS_OR_EQUAL_TO[TWO][FIVE]

=begin
MOD = -> m {
   -> n {
     IF[IS_LESS_OR_EQUAL_TO[n][m]][
       MOD[SUBTRACT[m][n]][n]
     ][
       m
     ]
   }
}

def mod(m, n)
  IF[n < m][
    mod(m - n, n)
  ][
    m
  ]
end
=end

MOD2 = -> m {
   -> n {
     IF[IS_LESS_OR_EQUAL_TO[n][m]][
       MOD2[SUBTRACT[m][n]][n]
     ][
       m
     ]
   }
}

MOD = -> m {
   -> n {
     IF[IS_LESS_OR_EQUAL_TO[n][m]][
       -> x { MOD[SUBTRACT[m][n]][n][x] }
     ][
       m
     ]
   }
}

FOUR = INCREMENT[THREE]
p to_integer MOD[FIFTEEN][FOUR]

Y = -> f { -> x { f[x[x]] }[-> x { f[x[x]] }] }

Y = -> f {
  -> x {
    f[-> y { x[x][y] }]
  }[-> x { f[-> y { x[x][y] }] }]
}

MOD = Y[-> f {
  -> m {
    -> n {
      IF[IS_LESS_OR_EQUAL_TO[n][m]][
        -> x { f[SUBTRACT[m][n]][n][x] }
      ][
        m
      ]
    }
  }
}]

p to_integer MOD[FIFTEEN][FOUR]

def to_array(list)
  array = []

  until to_boolean(IS_EMPTY[list])
    array.push(FIRST[list])

    list = REST[list]
  end

  array
end

EMPTY    = PAIR[TRUE][TRUE]
UNSHIFT  = -> l { -> x {
             PAIR[FALSE][PAIR[x][l]]
           } }
IS_EMPTY = LEFT
FIRST    = -> l { LEFT[RIGHT[l]] }
REST     = -> l { RIGHT[RIGHT[l]] }

numbers = UNSHIFT[
  UNSHIFT[
    UNSHIFT[EMPTY][THREE]
  ][TWO]
][ONE]

p to_integer FIRST[numbers]
p to_integer FIRST[REST[numbers]]
p to_array(numbers).map { |n| to_integer n }

def range(m ,n)
  if m <= n
    range(m + 1, n).unshift(n)
  else
    []
  end
end

RANGE = Y[-> f {
  -> m { -> n {
    IF[IS_LESS_OR_EQUAL_TO[m][n]][
      -> x {
        UNSHIFT[f[INCREMENT[m]][n]][m][x]
      }
    ][
      EMPTY
    ]
  } }
}]

p to_array(RANGE[ONE][FIFTEEN]).map { |x| to_integer x }

def map(list, func)
  if list.empty?
    []
  else
    map(REST[list]).unshift(func[FIRST[list]])
  end
end

MAP = Y[-> m {
  -> l { -> f {
    IF[IS_EMPTY[l]][
      EMPTY
    ][
      UNSHIFT[-> x { m[REST[l]][f][x] }][f[FIRST[l]]]
    ]
  } }
}]

p to_array(MAP[RANGE[ONE][FIVE]][INCREMENT]).map { |x| to_integer x }

def to_char(c)
  '0123456789FBiuz'.slice(to_integer(c))
end

def to_string(s)
  to_array(s).map { |c| to_char(c) }.join
end

TEN = MULTIPLY[TWO][FIVE]
F   = TEN
B   = INCREMENT[F]
I   = INCREMENT[B]
U   = INCREMENT[I]
Z   = INCREMENT[U]

FIZZ     = UNSHIFT[UNSHIFT[UNSHIFT[UNSHIFT[EMPTY][Z]][Z]][I]][F]
BUZZ     = UNSHIFT[UNSHIFT[UNSHIFT[UNSHIFT[EMPTY][Z]][Z]][U]][B]
FIZZBUZZ = UNSHIFT[UNSHIFT[UNSHIFT[UNSHIFT[BUZZ][Z]][Z]][I]][F]

p to_string(FIZZBUZZ)

def to_digits(n)
  previous_digits =
    if n < 10
      []
    else
      to_digits(n / 10)
    end

  previous_digits.push(n % 10)
end

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
def to_digits(n)
  previous_digits =
    if n < 10
      []
    else
      to_digits(n / 10)
    end

  previous_digits.push(n % 10)
end

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


p to_array(MAP[RANGE[ONE][FIVE]][INCREMENT]).map { |x| to_integer x }

p to_integer(DIV[TEN][FOUR])

THIRTY = ADD[FIFTEEN][FIFTEEN]

solution = MAP[RANGE[ONE][THIRTY]][-> n {
  IF[IS_ZERO[MOD[n][FIFTEEN]]][
    FIZZBUZZ
  ][IF[IS_ZERO[MOD[n][THREE]][
    FIZZ
  ][IF[IS_ZERO[MOD[n][FIVE]]][
    BUZZ
  ][
    TO_DIGITS[n]
  ]]]]
}]


#p to_array(RANGE[ONE][HUNDRED]).map { |x| to_integer x }

to_array(solution).each do |p|
  puts to_string(p)
end
