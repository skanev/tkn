LEFT_     = -> p { p[-> x { -> y { x } }] }
RIGHT_    = -> p { p[-> x { -> y { y } }] }
IS_EMPTY_ = LEFT_
FIRST_    = -> l { LEFT_[RIGHT_[l]] }
REST_     = -> l { RIGHT_[RIGHT_[l]] }

def to_integer(number)
  number[-> n { n + 1 }][0]
end

def to_boolean(bool)
  bool[true][false]
end

def to_array(list)
  array = []

  until to_boolean(IS_EMPTY_[list])
    array.push(FIRST_[list])

    list = REST_[list]
  end

  array
end

def to_char(c)
  '0123456789FBiuz'.slice(to_integer(c))
end

def to_string(s)
  to_array(s).map { |c| to_char(c) }.join
end
