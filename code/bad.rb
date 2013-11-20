MOD2 = -> m {
  -> n {
    IF[IS_LESS_OR_EQUAL_TO[n][m]][
      MOD2[SUBTRACT[m][n]][n]
    ][
      m
    ]
  }
}
