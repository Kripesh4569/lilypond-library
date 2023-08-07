\version "2.20.0"

\include "articulate.ly"

% Karma Band - Yadi

% Intro Rhythm
rhythmSingleRootNote = \relative c' {
    r4 a4 ~ a2 | a1 | d,1 | e1 |
    a1 | a1 | d,2. ~d8 e8~ | e1 |
    % b4\sustainOn b'8 fis4 b8 dis4 \sustainOff | 
}

% Intro
IntroRhythm = \relative c {
    \rhythmSingleRootNote
}

% Intro Melody
IntroMelody = \relative c {
    \relative c' {
        % Liitle darling
        r4 <e cis'>8 a8 b8 cis4 a8~ | 
        % it's been a long cold lonely
        a8 
        <<
        \new Voice { \voiceOne r8 cis8 b4 a4 fis8~ | fis8 a4 b4 a4 fis8 }
            { \voiceTwo \relative c' {e4.~e2} \oneVoice }
        >>
        |
        % winter
        <<
        \new Voice { \voiceOne gis8 fis8 gis8 a4 <gis b>4. }
            { \voiceTwo \relative c' {d1} \oneVoice }
        >> |
        % Liitle darling
        r4 <e cis'>8 a8 b8 cis4 a8~ | 
        % it feels like years since it's been here
        a8 
        <<
        \new Voice { \voiceOne r8 cis8 b4 a4 fis8~ | fis8 cis'4 b4 a4 <d,~ gis~>8 | <d gis>1  }
            { \voiceTwo \relative c' {e4.~e2} \oneVoice }
        >>
        |
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
    \repeat unfold 1 \VerseMelody
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