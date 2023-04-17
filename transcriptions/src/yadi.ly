\version "2.20.0"

\include "articulate.ly"

% Karma Band - Yadi

% Rhythm
OneTwoThreeAndFourB = \relative c {
    b4^\accent <<dis4 fis>> b,8^\accent  <<dis4 fis>> <<dis8 fis>> |
}

OneTwoThreeAndFourE = \transpose b e' \OneTwoThreeAndFourB
OneTwoThreeAndFourFSharp = \transpose b fis' \OneTwoThreeAndFourB

% Intro
IntroRhythm = \relative c {
    \repeat unfold 2 \OneTwoThreeAndFourB
    \OneTwoThreeAndFourE
    \OneTwoThreeAndFourB
}

%Verse
Verse = \relative c {
    \repeat unfold 2 \IntroRhythm
    \repeat unfold 4 \OneTwoThreeAndFourB
    \repeat unfold 2 {
        \repeat unfold 3 \OneTwoThreeAndFourFSharp
        \OneTwoThreeAndFourB
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