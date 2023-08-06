\version "2.20.0"

% montuno

\score {
    \new Staff {
        \time 5/4
        <c e g>4 r8 <c e>8 <g b>8 <c e g>4 r8 <c e>8 <g b>8 |
        <f a c>4 r8 <f a>8 <c e>8 <f a c>4 r8 <f a>8 <c e>8 |
        <g b d>4 r8 <g b>8 <d f>8 <g b d>4 r8 <g b>8 <d f>8 |
        <f a c>4 r8 <f a>8 <c e>8 <f a c>4 r8 <f a>8 <c e>8 |
    }

    \layout { }
    \midi { 
        \tempo 4 = 100
    }
}
