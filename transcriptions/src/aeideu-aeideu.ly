\version "2.20.0"

\include "articulate.ly"

% James Pradhan - Aeideu Aeideu

% Rhythm
TwistA = \relative c, {
    a8 r cis e 
    a, r cis e |
}

TwistAStop = \relative c, {
    a8 r cis e
    a, r r4 |
}

TwistD = \relative c, {
    d8 r fis a 
    d, r fis a |
}

TwistDStop = \relative c, {
    d8 r fis a
    d, r r4 |
}

% Intro
IntroBass = \relative c, {
    % 6 bars
    \repeat unfold 5 \TwistA
    \TwistAStop
}

IntroMelody = \relative c' {
    % 6 bars
    r1 | r1 |
    cis4 d8 cis8~ cis2~ | cis8 cis d cis4 d cis8 | 
    cis4 d8 cis8~ cis2~ | cis8 d8 cis d cis r r4 |
}

% Verse
VerseBass = \relative c, {
    % 14 bars
    \repeat unfold 2 \TwistA
    \repeat unfold 2 \TwistD

    \repeat unfold 2 \TwistA
    \repeat unfold 2 \TwistD

    \repeat unfold 2 \TwistA
    \repeat unfold 2 \TwistD
    \TwistA
    \relative c, {
        a8 r8 r4 r2 |
    }

    % same repeat
    % 14 bars
    \repeat unfold 2 \TwistA
    \repeat unfold 2 \TwistD

    \repeat unfold 2 \TwistA
    \repeat unfold 2 \TwistD

    \repeat unfold 2 \TwistA
    \repeat unfold 2 \TwistD
    \TwistA
    \relative c, {
        a8 r8 r4 r2 |
    }
}

% VerseMelodyOnA = \relative c {
%     <<cis8 e a>> r8  <<cis,8 e a>> r8 
%     <<cis,8 e a>> r8  <<cis,8 e a>> d8 | cis r8 <<cis, e a>> r8 <<cis, e a>> r8 <<cis, e a>> r8|
% }

VerseRhythmRightHandOnA = \relative c {
    r8 <<cis8 e a>> r8  <<cis,8 e a>> r8 
    <<cis,8 e a>> r8  d8 | cis <<cis, e a>> r8 <<cis, e a>> r8 <<cis, e a>> r8 <<cis, e a>>|
}

VerseOutroRightHandOnA = \relative c {
    r8 <<cis8 e a>> r8  <<cis,8 e a>> r8 
    <<cis,8 e a>> r8  <<cis,8 e a>> | r8  d cis d cis r r4 |
}

VerseRhythmRightHandOnD = \relative c' {
    r8 <<d8 fis a>> r8  <<d,8 fis a>> r8 
    <<d,8 fis a>> r8 <<d8 g>> | fis <<d,8 fis a>> r8  <<d,8 fis a>> r8 <<d,8 fis a>> r8 <<d,8 fis a>>|
}

% MetronomeRhythmOnD = \relative c' {
%     <<d8 fis a>> r8  <<d,8 fis a>> r8 
%     <<d,8 fis a>> r8  <<d,8 fis a>> r8 | 
%     <<d,8 fis a>> r8  <<d,8 fis a>> r8 
%     <<d,8 fis a>> r8  <<d,8 fis a>> r8 | 
% }

MetronomeRhythmRightHandOnA = \relative c' {
    r8 <<cis8 e a>> r8  <<cis,8 e a>> r8 
    <<cis,8 e a>> r8  <<cis,8 e a>> | r8 
    <<cis,8 e a>> r8  <<cis,8 e a>> r8 
    <<cis,8 e a>> r8  <<cis,8 e a>> | 
}

MetronomeRhythmRightHandOnD = \relative c' {
    r8 <<d8 fis a>> r8  <<d,8 fis a>> r8 
    <<d,8 fis a>> r8  <<d,8 fis a>> | r8 
    <<d,8 fis a>> r8  <<d,8 fis a>> r8 
    <<d,8 fis a>> r8  <<d,8 fis a>> | 
}

VerseMelody = \relative c' {
    %14 bars
    \VerseRhythmRightHandOnA 
    \VerseRhythmRightHandOnD

    \VerseRhythmRightHandOnA 
    \VerseRhythmRightHandOnD

    \MetronomeRhythmRightHandOnA
    \MetronomeRhythmRightHandOnD

    \VerseOutroRightHandOnA

    %14 bars
    \VerseRhythmRightHandOnA 
    \MetronomeRhythmRightHandOnD

    \VerseRhythmRightHandOnA 
    \MetronomeRhythmRightHandOnD

    \MetronomeRhythmRightHandOnA
    \MetronomeRhythmRightHandOnD

    \VerseOutroRightHandOnA
}

Bass = \relative c, {
    % intro
    \IntroBass

    % verse
    \VerseBass
}


% melody
Melody = \relative c' {
    \IntroMelody

    \VerseMelody
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
    \key d \major
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
        \tempo 4 = 106
    }
}