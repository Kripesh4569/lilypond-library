\version "2.20.0"

\include "articulate.ly"

% Karma Band - Yadi

% Intro Rhythm
rhythmSingleRootNote = \relative c' {
    r4 a4 ~ a2 | a1 | d,1 | e1 |
    a1 | a1 | d,1 | e1 |
    % b4\sustainOn b'8 fis4 b8 dis4 \sustainOff | 
}

% Intro
IntroRhythm = \relative c {
    \rhythmSingleRootNote
}

% Intro Melody
IntroMelody = \relative c {
    \repeat unfold 4 \relative c {
        r1 |
    }
}

%Verse
VerseRhythm = \relative c {
    % \IntroRhythm
}

Bass = \relative c {
    % intro
    \IntroRhythm
    \VerseRhythm
}


VerseMelody = \relative c' {
    r1
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
    \key a \major
    \Melody
}

lower = \relative c {
    \clef bass
    \dynamicDown
    \dynamicDown
    %\key b \minor  % harmonic minor
    \time 4/4
    \set Staff.pedalSustainStyle = #'mixed
    \key a \major
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
        \tempo 4 = 120
    }
}