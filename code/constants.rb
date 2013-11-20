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

TRUE  = -> x { -> y { x } }
FALSE = -> x { -> y { y } }
IF = -> b { b }

IS_ZERO = -> n { n[-> x { FALSE }][TRUE] }

INCREMENT = -> n { -> p { -> x { p[n[p][x]] } } }

PAIR  = -> x { -> y { -> f { f[x][y] } } }
LEFT  = -> p { p[-> x { -> y { x } }] }
RIGHT = -> p { p[-> x { -> y { y } }] }

ADD      = -> m { -> n { n[INCREMENT][m] } }
MULTIPLY = -> m { -> n { n[ADD[m]][ZERO] } }
POWER    = -> m { -> n { n[MULTIPLY[m]][ONE] } }

SLIDE     = -> p { PAIR[RIGHT[p]][INCREMENT[RIGHT[p]]] }
DECREMENT = -> n { LEFT[n[SLIDE][PAIR[ZERO][ZERO]]] }

SUBTRACT = -> m { -> n { n[DECREMENT][m] } }

IS_LESS_OR_EQUAL_TO = -> m { -> n { IS_ZERO[SUBTRACT[m][n]] } }

FOUR = INCREMENT[THREE]

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

EMPTY    = PAIR[TRUE][TRUE]
UNSHIFT  = -> l { -> x {
             PAIR[FALSE][PAIR[x][l]]
           } }
IS_EMPTY = LEFT
FIRST    = -> l { LEFT[RIGHT[l]] }
REST     = -> l { RIGHT[RIGHT[l]] }

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

MAP = Y[-> m {
  -> l { -> f {
    IF[IS_EMPTY[l]][
      EMPTY
    ][
      UNSHIFT[-> x { m[REST[l]][f][x] }][f[FIRST[l]]]
    ]
  } }
}]

TEN = MULTIPLY[TWO][FIVE]
F   = TEN
B   = INCREMENT[F]
I   = INCREMENT[B]
U   = INCREMENT[I]
Z   = INCREMENT[U]

FIZZ     = UNSHIFT[UNSHIFT[UNSHIFT[UNSHIFT[EMPTY][Z]][Z]][I]][F]
BUZZ     = UNSHIFT[UNSHIFT[UNSHIFT[UNSHIFT[EMPTY][Z]][Z]][U]][B]
FIZZBUZZ = UNSHIFT[UNSHIFT[UNSHIFT[UNSHIFT[BUZZ][Z]][Z]][I]][F]

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


THIRTY = ADD[FIFTEEN][FIFTEEN]

SOLUTION = MAP[RANGE[ONE][HUNDRED]][-> n {
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
