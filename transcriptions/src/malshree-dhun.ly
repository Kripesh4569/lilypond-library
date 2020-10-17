\version "2.20.0"

% Melody
Bass = \relative c, {
    c4_5 g' c g_5 | % _5 fingering notation (_ tells lilypond to display the fingering at the bottom, ^ = top, - = default)
    c g' c, g_1
    \repeat unfold 4  \relative c, {
        c4 g' c g |
        c g' c, g
    }
}

% Harmonies
MelodyStart = \relative c'' {

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
    
    \relative c' {
        r4 c8^2 d4 c b8 |
        c4 c d8 f8 f4 |

    }
}

upper = \relative c'' {
    \clef treble
    %\key b \minor % harmonic minor
    \time 4/4
    \MelodyStart
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