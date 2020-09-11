\version "2.20.0"
\absolute {
    \time 4/4
    \tempo 4 = 90
    \clef "treble"
    % arpegio on c
    c' e' g' e'
    \clef "bass"
    % arpegio on c
    c e g e

    %Bar lines example
    \clef "treble"
    % Bar checks --> not mandatory, but helps ensure when the bar should end
    c' e' g' e' | c' e' g' e' |
    % Bar lines - eg: "|." is the ending bar line
    c' e' g' e' \bar "|."
}