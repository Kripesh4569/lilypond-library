\version "2.20.0"

\relative c' {
    % ~ represents tie
    \time 4/4
    g4~ g c2~ | c4~ c8 a~ a2 |

    % slur - (), starting note needs an ( suffixed to it eg: `a(` and the ending note has ) suffixed to it eg: c)
    d4( c16) cis( d e c cis d) e( d4) 

    % phrasing with slur use \( and \) instead of ( and )
    g4\( g8( a) b( c) b4\)

    % ties in slurs
    c4~( c8 d~ d4 e)
}