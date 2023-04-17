\version "2.20.0"

\include "articulate.ly"

% Rhythm
OneTwoThreeAndNoFourAndB = \relative c {
    b4^\accent <<dis4 fis>> b,8^\accent  <<dis4 fis>> <<dis8 fis>> |
}

OneTwoThreeAndNoFourAndE = \transpose b e' \OneTwoThreeAndNoFourAndB
OneTwoThreeAndNoFourAndFSharp = \transpose b fis' \OneTwoThreeAndNoFourAndB

% Intro
IntroRhythm = \relative c {
    \repeat unfold 2 \OneTwoThreeAndNoFourAndB
    \OneTwoThreeAndNoFourAndE
    \OneTwoThreeAndNoFourAndB
}

%Verse
Verse = \relative c {
    \repeat unfold 2 \IntroRhythm
    \repeat unfold 4 \OneTwoThreeAndNoFourAndB
    \repeat unfold 2 {
        \repeat unfold 3 \OneTwoThreeAndNoFourAndFSharp
        \OneTwoThreeAndNoFourAndB
    }
}

Bass = \relative c {
    % intro
    \IntroRhythm
    \Verse
}


% melody
Melody = \relative c' {
}

upper = \relative c'' {
    \clef treble
    %\key b \minor % harmonic minor
    \time 4/4
    \key d \major
    \Melody
}

lower = \relative c {
    \clef bass
    %\key b \minor  % harmonic minor
    \time 4/4
    \set Staff.pedalSustainStyle = #'mixed
    \key b \major
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
        \tempo 4 = 160
    }
}