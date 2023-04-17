\version "2.20.0"

\include "articulate.ly"

% Karma Band - Yadi

% Rhythm
OneTwoAndNoThreeAndFourB = \relative c {
    <<dis4 fis b>> fis'8^\accent b,4 b8 fis'4 |
}

OneTwoAndNoThreeAndFourE = \transpose b e' \OneTwoAndNoThreeAndFourB
OneTwoAndNoThreeAndFourFSharp = \transpose b fis' \OneTwoAndNoThreeAndFourB

% Intro
IntroRhythm = \relative c {
    \repeat unfold 2 \OneTwoAndNoThreeAndFourB
    \OneTwoAndNoThreeAndFourE
    \OneTwoAndNoThreeAndFourB
}

%Verse
Verse = \relative c {
    \repeat unfold 2 \IntroRhythm
    \repeat unfold 4 \OneTwoAndNoThreeAndFourB
    \repeat unfold 2 {
        \repeat unfold 3 \OneTwoAndNoThreeAndFourFSharp
        \OneTwoAndNoThreeAndFourB
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