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
                   A D V A N C E D

                          88
                          ""   ,d
                               88
               ,adPPYb,d8 88 MM88MMM
              a8"    `Y88 88   88
              8b       88 88   88
              "8a,   ,d88 88   88,
               `"YbbdP"Y8 88   "Y888
               aa,    ,88
                "Y8bbdP"


Стефан Кънев                            RuseConf
#36#\@skanev                         04 октомври 2014##
EOS

image 'pics/git/broken-window.jpg'
image 'pics/git/xzibit.png'

block <<-EOS
  …disclaimer…
EOS

block <<-EOS
  Най-важното нещо за

  добра git употреба?
EOS

section 'Commit  съобщения' do
  block <<-EOS
    → git log -1\a
    commit b180e773f6a174a2f6b50d62e1b6a78346611a76
    Author: Иван Иванов <ivan.ivanov@example.org>
    Date:   Fri Oct 3 18:15:38 2014 +0300\a

        Fixes
  EOS

  center <<-EOS
    http://whatthecommit.com/
  EOS

  block <<-EOS
    This is a basic implementation that works.\a

    GIT :(\a

    someone fails and it isn't me\a

    should work now.\a

    REALLY FUCKING FIXED\a

    This is why git rebase is a horrible horrible thing.
  EOS

  center <<-EOS
    Съобщенията трябва да дават отговори:\a

    Защо е написан този код?\a

    Какъв е проблема, който решава?\a

    Защо е решен така?\a

    Какви са ефектите на решението?
  EOS

  block colorize <<-EOS
    Redirect user to the requested page after login

    https://trello.com/path/to/relevant/card

    Users were being redirected to the home page after
    login, which is less useful than redirecting to the
    page they had originally requested before being
    redirected to the login form.

    - Store requested path in a session variable

    - Redirect to the stored location after successfully
      logging in the user

    #90#robots.thoughtbot.com/5-useful-tips-for-a-better-commit-message##
  EOS

  center colorize <<-EOS
    Git съобщенията са начин за комуникация.\a

    Комуникацията е #1#важна##.
  EOS

  center colorize <<-EOS
    Финално, има #1#стандартен формат##

    за commit съобщения.
  EOS

  block <<-EOS
    Capitalized, short (50 chars or less) summary

    More detailed explanatory text, if necessary.  Wrap it to about 72
    characters or so.  In some contexts, the first line is treated as the
    subject of an email and the rest of the text as the body.

    Write your commit message in the imperative: "Fix bug" and not "Fixed bug"
    or "Fixes bug."  This convention matches up with commit messages generated
    by commands like git merge and git revert.

    Further paragraphs come after blank lines.

    - Bullet points are okay, too

    - Typically a hyphen or asterisk is used for the bullet, followed by a
      single space, with blank lines in between, but conventions vary here
  EOS
end

section 'Topic branches!' do
  center <<-EOS
    За разлика от SVN, CVS и

    всичко такова, клонове в

    git са евтини
  EOS
end

section 'git rebase master' do
  block <<-EOS
    git log --graph
  EOS

  block <<-EOS
    …example…
  EOS

  block <<-EOS
          A---B---C topic
         /
    D---E---F---G master\a

    → git rebase master\a

                 A'--B'--C' topic
                /
    D---E---F---G master
  EOS

  block <<-EOS
    * |
    |\\ \\
    | * |
    * | |
    |\\ \\ \\
    | * | |
    |/ / /
    * | |
    | |/
    |/|
    * |
    |\\ \\
    | * |
    * | |
    |/ /
  EOS

  block <<-EOS
    | * | | | | | | | |
    | |\\ \\ \\ \\ \\ \\ \\ \\ \\
    | | * \\ \\ \\ \\ \\ \\ \\ \\
    | | |\\ \\ \\ \\ \\ \\ \\ \\ \\
    | | * \\ \\ \\ \\ \\ \\ \\ \\ \\
    | | |\\ \\ \\ \\ \\ \\ \\ \\ \\ \\
    | | | | |/ / / / / / / /
    | | | |/| | | | | | | |
    | | | * | | | | | | | |
    | | | |\\ \\ \\ \\ \\ \\ \\ \\ \\
    | | | * | | | | | | | | |
    | * | | | | | | | | | | |
    | | |_|_|/ / / / / / / /
    | |/| | | | | | | | | |
    | * | | | | | | | | | |
    | |/ / / / / / / / / /
    | * | | | | | | | | |
  EOS

  block <<-EOS
    Как се стига дотук?
  EOS

  block <<-EOS
    Merge bubble
  EOS

  block <<-EOS
    * f5994f3 (origin/master) What up?
    * ca6a156 That thing
    * d0a3ebd That other thing
    * 8b9e709 Whatever
  EOS

  block colorize <<-EOS
    #1#* 8cc7ecc (master) My super cool new change##
    * f5994f3 (origin/master) What up?
    * ca6a156 That thing
    * d0a3ebd That other thing
    * 8b9e709 Whatever
  EOS

  block colorize <<-EOS
    #1#* 640f323 (origin/master) Meanwhile in the upstream##
    | * 8cc7ecc (master) My super cool new change
    |/
    * f5994f3  What up?
    * ca6a156 That thing
    * d0a3ebd That other thing
    * 8b9e709 Whatever
  EOS

  block colorize <<-EOS
    #1#* e62d46c (master) Merge branch 'master' of whatever##
    |\\
    * | 640f323 (origin/master) Meanwhile in the upstream
    | * 8cc7ecc My super cool new change
    |/
    * f5994f3  What up?
    * ca6a156 That thing
    * d0a3ebd That other thing
    * 8b9e709 Whatever
  EOS

  block <<-EOS
    git pull --rebase
  EOS

  block annotate <<-EOS, 1
    Любимият ми workflow:

    @@→ git rebase master@@
    @@→ git merge topic --no-ff@@
  EOS

  block <<-EOS
      * 430b376
      |\\
      | * af5e12e
      | * 3de9489
      |/ 829eea4
      * b5b8ad9
      |\\ e465504
      | * 1b4344f
      | * ce7c0f3
      | * gf341a7
      |/
      * 5a372d6
      * d73d24a
  EOS
end

section 'git rebase -i' do
  block <<-EOS
    pick f7f3f6d change my name a bit
    pick 310154e update README formatting
    pick a5f4a0d add cat-file

    # Rebase 710f0f8..a5f4a0d onto 710f0f8
    #
    # Commands:
    #  p, pick = use commit
    #  r, reword = use commit, but edit message
    #  e, edit = use commit, but stop for amending
    #  s, squash = use commit, but meld in previous
    #  f, fixup = like "squash", but discard msg
    #  x, exec = run command using shell
  EOS

  block <<-EOS
    git commit -m 'Fix a typo'
  EOS
end

section 'git  rerere' do
  block <<-EOS
    Reuse Recorded Resolution
  EOS

  block <<-EOS
    * e465504 (master) Remove a left-over test
    * 1b4344f Don't process MathJax entries
    * ce7c0f3 Add LaTeX to everything
    | * af5e12e (cool-stuf) Revert gems source
    | * 3de9489 Use production S3
    | * 829eea4 Add ruby 2.1.0
    | * b5b8ad9 Move simplecov
    | * e3fbcf0 Gems only  for test
    |/
    * 5a372d6 Lock json to 1.8.0
  EOS

  block <<-EOS
    *   430b376 Merge branch 'cool-stuff'
    |\\
    | * af5e12e Revert gems source
    | * 3de9489 Use production S3
    | * 829eea4 Add ruby 2.1.0
    | * b5b8ad9 Move simplecov
    | * e3fbcf0 Gems only  for test
    * | e465504 Remove a left-over test
    * | 1b4344f Don't process MathJax entries
    * | ce7c0f3 Add LaTeX to everything
    |/
    * 5a372d6 Lock json to 1.8.0
  EOS

  block <<-EOS
    * ba26db8 (origin/master) Upstream
    | *   430b376 (master) Merge 'cool-stuff'
    | |\\
    |/ /
    | * af5e12e Revert gems source
    | * 3de9489 Use production S3
    | * 829eea4 Add ruby 2.1.0
    | * b5b8ad9 Move simplecov
    | * e3fbcf0 Gems only for test
    * | e465504 Remove a left-over test
    * | 1b4344f Don't process MathJax entries
    * | ce7c0f3 Add LaTeX to everything
    |/
    * 5a372d6 Lock json to 1.8.0
  EOS

  block <<-EOS
    * cd1f38a Merge…  ah, forget it
    |\\
    * | ba26db8 (origin/master) Upstream
    | *   430b376  Merge 'cool-stuff'
    | |\\
    |/ /
    | * af5e12e Revert gems source
    | * 3de9489 Use production S3
    | * 829eea4 Add ruby 2.1.0
    | * b5b8ad9 Move simplecov
    | * e3fbcf0 Gems only for test
    * | e465504 Remove a left-over test
    * | 1b4344f Don't process MathJax entries
    * | ce7c0f3 Add LaTeX to everything
    |/
    * 5a372d6 Lock json to 1.8.0
  EOS
end

section 'Bag of tricks'

section 'git-diff highlighting' do
  image 'pics/git/diff-highlight.png'

  center colorize <<-EOS
    В command line interface-а го няма ;(

    #90#git show 68968d8##
  EOS

  center colorize <<-EOS
    #1#contrib/diff-highlight##
  EOS

  center <<-EOS
    Как ли работи това?\a

    …ама то е Perl скрипт!!\a

    И ние може да пишем такива!
  EOS
end

section 'PSD-та във vesion control' do
  block <<-EOS
    Уф, тия дизайнери…
  EOS

  block <<-EOS
    git filter-branch --tree-filter 'rm -f uh.psd' HEAD
  EOS
end

section 'git stash'

section 'git  bisect' do
  block <<-EOS
    Кой commit прецака нещата?
  EOS

  block <<-EOS
    → git bisect start <bad> <good>\a
    Bisecting: 9 revisions left to test
               after this (roughly 3 steps)
    [e46550d] Remove a left-over test\a

    → git bisect good\a
    → git bisect bad\a
    → git bisect bad\a
    → git bisect good\a
    → git bisect bad\a
    829eea5 is the first bad commit
    commit 829eea5
    author ...
  EOS

  block <<-EOS
    → git bisect start <bad> <good>

    → git bisect run 'rake test'
  EOS
end

section 'git  reflog' do
  block <<-EOS
    → git reflog
    7d36321 HEAD@{0}: reset: moving to origin/master
    dcdb77a HEAD@{1}: checkout: moving from 829e to master
    829eea4 HEAD@{2}: checkout: moving from 3de9 to 829e
    3de9489 HEAD@{3}: checkout: moving from b5b8 to 3de9
    b5b8ad9 HEAD@{4}: checkout: moving from e465 to b5b8
    e465504 HEAD@{5}: checkout: moving from master to e465
    dcdb77a HEAD@{6}: checkout: moving from what to master
    dcdb77a HEAD@{7}: reset: moving to master
    05ed7d8 HEAD@{8}: filter-branch: rewrite
    dcdb77a HEAD@{9}: checkout: moving from master to what
    dcdb77a HEAD@{10}: commit: WIP
    430b376 HEAD@{11}: reset: moving to origin/master
    00d9f5e HEAD@{12}: reset: moving to HEAD~4
    2d9ab54 HEAD@{13}: reset: moving to HEAD~4
  EOS
end

section 'git-svn'

section 'SHA, trees, commits, oh my…' do
  block <<-EOS
    tree 744b29797db4913c75b20703894901b6e5ec4f62
    parent 00d9f5eafaab21750263651a7224f5763e9c9c07
    author Dimitar Dimitrov <me@ddimitrov.name>
    committer Dimitar Dimitrov <me@ddimitrov.name>

    Lock json to 1.8.0

    We need to stick to json 1.8.0 until we update
    Ruby to its latest version, because this
    version of Ruby ships with json 1.8.0.

    diff --git a/Gemfile b/Gemfile
    index a6cfc7e..6f50b52 100644

    diff --git a/Gemfile.lock b/Gemfile.lock
    index 9d8e8eb..ecda009 100644
  EOS

  image 'pics/git/pro-git.jpg'
end

section 'Благодаря'

section 'Въпроси ?'


# Demo 1: git log --graph
# Demo 2: wtf graph
# Demo 3: git diff highlight
