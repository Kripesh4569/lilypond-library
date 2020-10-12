
% Melody
MelStart = \relative c'' {
    b4( cis2 b4)~ | b4 b2. |
    fis1~ | fis1
    b4( cis2 b4)~ | b4 b2. |
    <d, fis>1~ | 1 % ommiting notes after tie means that the note is the same, and thus just specifying the note duration
}

% Harmonies
HarBToF = \relative c {
    b4\sustainOn( d fis b)~ | b4 d2.\staccato |
    fis,,4( cis' fis ais)~ | ais1\sustainOff
}

upper = \relative c'' {
    \clef treble
    \key b \minor
    \time 4/4

    r1*4
    \MelStart
    %a4 b c d
}

lower = \relative c {
    \clef bass
    \key b \minor
    \time 4/4
    \set Staff.pedalSustainStyle = #'mixed
    
    \HarBToF
    \HarBToF
    \HarBToF
}

\score {
    \new PianoStaff <<
        \set PianoStaff.instrumentName = #"Piano  "
        \new Staff = "upper" \upper
        \new Staff = "lower" \lower
    >>
    \layout { }
    \midi { 
        \tempo 2 = 90
    }
}