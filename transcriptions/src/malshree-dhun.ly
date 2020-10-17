\version "2.20.0"

\include "articulate.ly"

% Melody
Bass = \relative c, {
    c4_5 g' c g_5 | % _5 fingering notation (_ tells lilypond to display the fingering at the bottom, ^ = top, - = default)
    c g' c, g_1 |
    \repeat unfold 16  \relative c, {
        c4 g' c g |
        c g' c, g |
    }
}

MelodyPartOne = \relative c'' {

    % part 1
    r4 g8^2 g4 c^5 c8 | 
    c4  ais a g |
    r4 d8^1( f g aes g f^1 |
    ees4 d c r) |
    % octaves
    \relative c'' {
        r4 <g g'>8 <g g'>4 <c c'> <c c'>8 | 
        <c c'>4  <ais ais'> <a a'> <g g'> |
        r4 <d d'>8 <f f'>4 <bes bes'> <g g'>8 |
        <ees ees'>4 <ees ees'>8 <d d'> <c c'>4 <c c'> |
    }
    
    %part 2
    \relative c' {
        r4 c8^2 d4 c b8 |
        c4 c d8 f8 f4 |
        r4 d8^1 f4 bes^5 g8 |
        ees4^3 d c r4 |
    }
    \relative c' {
        r4 <c c'>8 <d d'>4 <c c'> <b b'>8 |
        <c c'>4 <c c'> <d d'>8 <f f'>8 <f f'>4 |
        r4 <d d'>8 <f f'>4 <bes bes'> <g g'>8 |
        <ees ees'>4 <d d'> <c c'>8 <d d'> <ees ees'> <f f'> |
        <g g'>4
    }

    %repeat part one with minor changes
    \relative c''' {
        g8^2 g4 c^5 c8 | 
        c4  ais a g |
        r4 d8^1( f g aes g f^1 |
        ees4 d c r) |
    }
    % octaves
    \relative c'' {
        r4 <g g'>8 <g g'>4 <c c'> <c c'>8 | 
        <c c'>4  <ais ais'> <a a'> <g g'> |
        r4 <d d'>8 <f f'>4 <bes bes'> <g g'>8 |
        <ees ees'>4 <ees ees'>8 <d d'> <c c'>4 <c c'> |
    }
    
    %repeat part two with minor change
    %part 2
    \relative c' {
        r4 c8^2 d4 
        \articulate << \relative c' { 
            c\mordent 
        } >> 
        b8 |
        c4 c d8 f8 f4 |
        r4 d8^1 f4 bes^5 g8 |
        ees4^3 d c r4 |
    }
    \relative c' {
        r4 <c c'>8 <d d'>4 <c c'> <b b'>8 |
        <c c'>4 <c c'> <d d'>8 <f f'>8 <f f'>4 |
        r4 <d d'>8 <f f'>4 <bes bes'> <g g'>8 |
        <ees ees'>4 <d d'> <c c'>8 <d d'> <ees ees'> <f f'> |
        <g g'>4
    }

}

upper = \relative c'' {
    \clef treble
    %\key b \minor % harmonic minor
    \time 4/4
    \MelodyPartOne
}

lower = \relative c {
    \clef bass
    %\key b \minor  % harmonic minor
    \time 4/4
    \set Staff.pedalSustainStyle = #'mixed
    
    \Bass
}

\score {
    \new PianoStaff <<
        \set PianoStaff.instrumentName = #"Piano  "
        \new Staff = "upper" \upper
        \new Staff = "lower" \lower
    >>
    \layout { }
    \midi { 
        \tempo 2 = 60
    }
}