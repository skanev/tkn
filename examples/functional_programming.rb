# encoding: utf-8

def annotate(string, code = '4')
  string.gsub(/@(.*?)@/, "\e[#{code}m\\1\e[0m")
end

def colorize(string)
  string.gsub(/#(.*?)#/, "\e[\\1m").gsub(/##/, "\e[0m")
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



   #1#F U N C T I O N A L   P R O G R A M M I N G##

            What's the fuss all about?






Stefan Kanev                      WordCamp Europe
#36#\@skanev                         27 September 2014##
EOS

section 'Audience participation time' do
  block <<-EOS
    Who hates audience participation questions?
  EOS

  block <<-EOS
    That's it!
  EOS
end

block colorize <<-EOS
  #1#\$ whoami##
  \a
  - programmer
  \a
    • currently: Ruby, (Java|Coffee)Script
    \a• in the past: Java, PHP, Perl, Python









  \e[0m
EOS

image 'pics/proglangs.jpg'

block colorize <<-EOS
  #1#\$ whoami##

  - programmer

    • currently: Ruby, (Java|Coffee)Script
    • in the past: Java, PHP, Perl, Python

  - interests

    \a• programming languages
    \a• theoretical things
    \a• practical things

  \a- often playing the Devil's advocate

  \a- @skanev (twitter, github)
EOS

section 'Functional programming!' do
  center annotate <<-EOS, 90
    LISP
    @(the grandfather of FP)@

    Haskell
    @(the popular thing)@

    Scala
    @(the… not really sure what)@

    JavaScript
    @(occasionally)@
  EOS

  block annotate <<-EOS, 1
  @What@ is functional programming?
  EOS

  block colorize <<-EOS
            Functional programming is a

   _                                          _
  | |                                        | |
  | |__  _   _ __________      _____  _ __ __| |
  | '_ \\| | | |_  /_  /\\ \\ /\\ / / _ \\| '__/ _` |
  | |_) | |_| |/ / / /  \\ V  V / (_) | | | (_| |
  |_.__/ \\__,_/___/___|  \\_/\\_/ \\___/|_|  \\__,_|


                      #38;5;241#“Now: 50% more functional”##
  EOS

  center colorize <<-EOS
    Don't talk about

    #1#“functional programming”##



    Instead, talk about

    #1#specific language features##
  EOS

  center annotate <<-EOS, 1
    IMHO when they say "FP" they mean:



    @Immutable ＆ no side effects@

    @Higher-order functions@

    @Strong typing@
  EOS
end

def section_title(n)
  sections = [
    'Immutability ＆ no-side effects ',
    'Higher-order functions',
    'Strong typing',
  ]

  sections[n].upcase!.sub!(/\A.*\Z/, "\e[1m\\0\e[0m")
  sections.join("\n\n")
end

section section_title(2) do
  center <<-EOS
    I'm not into static/strong typing
    \a
    You probably aren't either
    \a
     But: Devil's advocate! 😈
      \a
    Let's pretend we are
  EOS

  block colorize <<-EOS
    ❯ If the only type systems I knew were C, C++,
      Java, or Go's, I'd be a Ruby programmer too.

    #90#twitter.com/sunahsuh/status/512666588361658369##
  EOS

  center colorize <<-EOS
    Type systems can be

    #1#P O W E R F U L##
  EOS

  block colorize <<-EOS
    TYPE SYSTEMS CAN
    ────────────────

    • detect a lot of errors at compile time

    • generate a lot more efficient code

    • be a useful documentation in some systems
  EOS
end

section section_title(0) do
  block colorize <<-EOS
    #define immutable
    ─────────────────

    • Creating copies instead of modifying

    • No (re-)assignment

    • Referential transparency
      #38;5;240#(same fn args → always same result)##
  EOS

  block annotate <<-EOS, '38;5;242'
    copy, don't modify
    ──────────────────

    @// mutable:@
    @// modifies array in place@

    sort( $items );



    @// immutable:@
    @// returns a copy@

    array_reverse( $items );
  EOS

  block annotate <<-EOS, '38;5;242'
    No re-assignment
    ────────────────

    @// reassignment:@

    $name = getName();

    if ( !$name ) {
        $name = 'N/A';
    }



    @// no reassingment:@

    $name = getName() ?: 'N/A';
  EOS

  block annotate <<-EOS, '38;5;242'
    Referential transparency
    ────────────────────────

    @// not referentially transparent:@

    $now = date( DATE_RFC2822 );
    $id  = mysqli_insert_id( $db );



    @// referentially transparent:@

    $say_it = array_reverse( $alphabet );



    @Also called "pure functions"@
  EOS

  center annotate <<-EOS, 1
    With those three, the code becomes


    @D E C L A R A T I V E@


    as opposed to


    @I M P E R A T I V E@
  EOS

  center annotate <<-EOS, 1
  We tell the computer

  @"what we want"@



  Instead of telling it

  @"how to do it"@
  EOS

  center annotate <<-EOS, 1
     Consider a metaphor…\a


    Declarative is like showing
     @a picture of a dish@\a

    Imperative is like giving
    @the recipe@
  EOS

  image 'pics/pancakes.jpg'

  block <<-EOS
    PANCAKES
    ────────

    1. Sift flour, b. powder, salt and sugar
    2. Make a well in the center
    3. Pour in milk, egg and melted butter
    4. Mix until smooth
    5. Heat an oiled griddle med. high heat
    6. Pour the batter for each
    7. Brown on both sides and serve hot
  EOS

  block <<-EOS
    ???? ????????
    ─────────────

    1. Preheat oven to 400°F
    2. Stir together flour, b. powder, salt & sugar
    3. Make a well in the center
    4. In a small bowl, beat egg with a fork
    5. Stir in milk and oil
    6. Pour all at once into the well
    7. Mix quickly & lightly with until moistened
    8. Pour the batter into forms
    9. Bake for 25 minutes, or until golden
  EOS

  image 'pics/muffins.jpg'

  block <<-EOS
    You have to pretend

    you're the computer
  EOS

  center <<-EOS
    Don't be a computer,

    you're a human ;-)
  EOS
end

section section_title(1) do
  block <<-EOS
    Higher-order functions
    ──────────────────────

    Funtions that take other

    functions as arguments

    or return functions.
  EOS

  center annotate <<-EOS, 1
    HOFs allow us to

    @say more with less@

    and give us

    @better abstractions@.
  EOS

  code <<-EOS, :php
    SORTING
    ───────

    // By length of name
    usort( $items, function( $a, $b ) {
        return strlen( $a ) - strlen( $b );
    } );

    usort( $items, function( $a, $b ) {
        return strcmp(
            explode( ' ',  $a )[1],
            explode( ' ',  $b )[1]
        );
    } );
  EOS
end

section 'Code examples' do
  image 'pics/gauss.jpg'

  block <<-EOS
    1 + 2 + 3 + … + 100 = ?
  EOS
end

section 'Summing up 1 to 100' do
  code <<-EOS, :php
    $sum = 0;

    for ( $i = 0; $i <= 100; $i++ ) {
        $sum += $i;
    }

    print $sum;
  EOS

  code <<-EOS, :php
    array_sum( range( 0, 100 ) )
  EOS

  center annotate <<-EOS, 1
    Second version is obviously better

    Let's dig into @why@
  EOS


  block annotate <<-EOS, 36
    @Declarative, not imperative@
    @───────────────────────────@

     @HOW@: $sum = 0;

          for ( $i = 0; $i <= 100; $i++ ) {
              $sum += $i;
          }



    @WHAT@: array_sum( range( 0, 100 ) );
  EOS

  center annotate <<-EOS, 1
    Another way to think about it:

    @E S S E N T I A L@

    vs.

    @A C C I D E N T A L@

    complexity
  EOS

  block annotate <<-EOS, 36
    @Essential vs. accidental@
    @────────────────────────@

     @ACCIDENTAL@: $sum = 0;

                 for ( $i = 0; $i < 100; $i++ ) {
                     $sum += $i;
                 }



      @ESSENTIAL@: array_sum( range( 0, 100 ) );
  EOS

  block annotate <<-EOS, 36
    @Side effects@
    @────────────@

    $sum = 0;

    for ( $i = 0; $i < 100; @$i++@ ) {
        $sum @+=@ $i;
    }
  EOS

  block 'By the way…'

  block annotate <<-EOS, 36
    The 2 hardest things in computer science
    ────────────────────────────────────────
    \a
    • Cache invalidation
    \a
    • Naming things
    \a
    • Off-by-one errors
  EOS

  block annotate <<-EOS, 36
    @Off-by-one risks@
    @────────────────@

    $sum = 0;

    for ( $i = 0; $i @<=@ 100; $i++ ) {
        $sum += $i;
    }
  EOS

  block annotate <<-EOS, 36
    @Off-by-one errors@
    @─────────────────@

    $sum = 0;

    for ( $i = 0; $i \e[31m<\e[0m 100; @$i++@ ) {
        $sum @+=@ $i;
    }
  EOS
end

section 'Sending email' do
  block <<-EOS
    Problem
    ───────

    You need to send a newsletter to

    all your active users. How do you

    get their addresses?
  EOS

  code <<-EOS, :php
    $emails = [];

    foreach ( $users as $user ) {
        if ( $user->active ) {
            $emails[] = $user->email;
        }
    }
  EOS

  block <<-EOS
    oooo
    `888
     888 .oo.    .ooooo.  oooo oooo    ooo
     888P"Y88b  d88' `88b  `88. `88.  .8'
     888   888  888   888   `88..]88..8'
     888   888  888   888    `888'`888'
    o888o o888o `Y8bod8P'     `8'  `8'
  EOS

  block <<-EOS
                     oooo                      .
                     `888                    .o8
    oooo oooo    ooo  888 .oo.    .oooo.   .o888oo
     `88. `88.  .8'   888P"Y88b  `P  )88b    888
      `88..]88..8'    888   888   .oP"888    888
       `888'`888'     888   888  d8(  888    888 .
        `8'  `8'     o888o o888o `Y888""8o   "888"
  EOS

  code <<-EOS, :php
    $active = array_filter( $users, function( $u ) {
      return $u->active;
    } );

    $emails = array_map( function( $u ) {
      return $u->email;
    }, $active );
  EOS

  code <<-EOS, :php
    array_map(
        function( $u ) {
            return $u->email;
        },
        array_filter( $users, function( $u ) {
            return $u->active;
        } ) );
  EOS

  block <<-EOS
    …but is that better?
  EOS

  code <<-EOS, :javascript
    JavaScript
    ──────────

    users
      .filter(function(u) { return u.active })
      .map(function(u) { return u.email });
  EOS

  code <<-EOS, :coffee
    CoffeeScript
    ────────────

    users
      .filter((u) -> u.active)
      .map((u) -> u.email)
  EOS

  code <<-EOS, :php
    Back to PHP
    ───────────

    array_map(
        function( $u ) { return $u->email; },
        array_filter( $users, function( $u ) {
            return $u->active;
        } ) );

    // Noise and inconsistency

    // Yet, conceptually simpler

    // → Very readable
  EOS

  center <<-EOS
    Not convinced yet?

    Let's talk about readibility…
  EOS

  block colorize <<-EOS
    You know you are working with clean code

    when each routine you read turns out to

    be pretty much what you expected.

                           #90#— Ward Cunningham##
  EOS

  block <<-EOS
    Should be self-evident, right?\a

    As in natural languages?\a

    Let's run an experiment!\a

    Two sentences, same meaning: which is more readable?\a

    Ready?
  EOS

  verbatim <<-EOS
    \e[0m







                     ルビを使って嬉しい開発者になる。

                ルビを使って嬉しいソフトウェアを作る人になる。
  EOS

  center annotate <<-EOS, 1
    Readibility depends on the reader too!

    You must know the alphabet to read
  EOS

  block colorize <<-EOS
    LIST COMPREHENSIONS
    ───────────────────

    • map + filter is so useful, that it has a name\a

    • Python has them:

      [u.email for u in users if u.active]\a

    • PHP might have the some day:

      [foreach ($users as $u)
       if $u->active
       yield $u->email]

      #90#markmail.org/thread/uvendztpe2rrwiif##
  EOS
end

#section 'Grouping things' do
  #block <<-EOS
         #We have an array of people.

   #Can we group them by arbitrary things?

                #Like country?



    #[
      #'Bulgaria' => [$ivan, $marin],
      #'Sweden' => [$sven, $jon, $martin],
      #…
    #]
  #EOS

  #code <<-EOS, :php
    #group_by( $people, function( $u ) {
      #return $u->countryName;
    #} )
  #EOS

  #code <<-EOS, :php
    #function group_by( $items, $func ) {
        #$grouped = [];

        #foreach ( $items as $item ) {
            #$key = $func( $item );

            #if ( ! isset( $grouped[ $key ] ) ) {
                #$grouped[ $key ] = [];
            #}

            #$grouped[ $key ][] = $item;
        #}

        #return $grouped;
    #}
  #EOS

  #center <<-EOS
    #Did you see anything fishy?\a

    #There were side-effects!\a

    #OTOH it was ref. transparent\a

    #It's philosophical!
  #EOS

  #block <<-EOS
    #If a tree falls in the woods,

    #does it make a sound?




    #If a pure function mutates some

    #local data in order to produce an

    #immutable return value, is that ok?
  #EOS
#end

section 'In conclusion' do
  block annotate <<-EOS, 1
    Say @what@ instead of @how@!
  EOS

  block annotate <<-EOS, 1
    Readibility is @subjective@! (ルビー)
  EOS

  block annotate <<-EOS, 1
    It's a @buzzword@!
  EOS
end

section 'Thank you'

block colorize <<-EOS
QUESTIONS?
──────────

• Say #1#what## instead of #1#how##!

• Readibility is #1#subjective##! (ルビー)

• It's a #1#buzzword##!




                               #90#\@skanev##
EOS
