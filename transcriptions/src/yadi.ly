\version "2.20.0"

\include "articulate.ly"

% Karma Band - Yadi

% Rhythm
OneTwoAndNoThreeAndFourB = \relative c {
    b4\sustainOn b'8 fis4 b8 dis4 \sustainOff | 
}

OneTwoAndNoThreeAndFourE = \transpose b e' \OneTwoAndNoThreeAndFourB
% OneTwoAndNoThreeAndFourFSharp = \transpose b fis' \OneTwoAndNoThreeAndFourB

OneTwoAndNoThreeAndFourFSharp = \relative c {
    fis4\sustainOn fis'8 ais,4 cis8 fis4 \sustainOff | 
}

% Intro
IntroRhythm = \relative c {
    \repeat unfold 2 \OneTwoAndNoThreeAndFourB
    \OneTwoAndNoThreeAndFourE
    \OneTwoAndNoThreeAndFourB
}

% Intro Melody
IntroMelody = \relative c {
    \repeat unfold 4 \relative c {
        r1 |
    }
}

%Verse
VerseRhythm = \relative c {
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
    \VerseRhythm
}


VerseMelody = \relative c' {
    r4 fis8 fis4 ~ fis8 fis4 | 
    b4 b8 b4 ~ b8 fis4 |
    gis4 gis4 ~ gis4 b4|
    fis1 |
}

% melody
Melody = \relative c' {
    \IntroMelody
    \repeat unfold 2 \VerseMelody
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
    \dynamicDown
    \dynamicDown
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