/**
 * D header file for C99.
 *
 * $(C_HEADER_DESCRIPTION pubs.opengroup.org/onlinepubs/009695399/basedefs/_ctype.h.html, _ctype.h)
 *
 * Copyright: Copyright Sean Kelly 2005 - 2009.
 * License: Distributed under the
 *      $(LINK2 http://www.boost.org/LICENSE_1_0.txt, Boost Software License 1.0).
 *    (See accompanying file LICENSE)
 * Authors:   Sean Kelly
 * Source:    $(DRUNTIMESRC core/stdc/_ctype.d)
 * Standards: ISO/IEC 9899:1999 (E)
 */

module core.stdc.ctype;

version(WASIp2) {
// Not extern(C)
@safe: // All of these operate on integers only.
nothrow:
@nogc:

pure int isalnum(int c) => isalpha(c) || isdigit(c);
pure int isalpha(int c) => (cast(uint)c | 32) - 'a' < 26;
pure int isblank(int c) => c == ' ' || c == '\t';
pure int iscntrl(int c) => cast(uint)c < 0x20 || c == 0x7f;
pure int isdigit(int c) => cast(uint)c - '0' < 10;
pure int isgraph(int c) => cast(uint)c - 0x21 < 0x5e;
pure int islower(int c) => cast(uint)c - 'a' < 26;
pure int isprint(int c) => cast(uint)c - 0x20 < 0x5f;
pure int ispunct(int c) => isgraph(c) && !isalnum(c);
pure int isspace(int c) => c == ' ' || cast(uint)c - '\t' < 5;
pure int isupper(int c) => cast(uint)c - 'A' < 26;
pure int isxdigit(int c) => isdigit(c) || (cast(uint)c | 32) - 'a' < 6;
pure int tolower(int c) => isupper(c) ? (c | 32) : c;
pure int toupper(int c) => islower(c) ? (c & 0x5f) : c;

}
else:

extern (C):
@trusted: // All of these operate on integers only.
nothrow:
@nogc:

    ///
pure int isalnum(int c);
///
pure int isalpha(int c);
///
pure int isblank(int c);
///
pure int iscntrl(int c);
///
pure int isdigit(int c);
///
pure int isgraph(int c);
///
pure int islower(int c);
///
pure int isprint(int c);
///
pure int ispunct(int c);
///
pure int isspace(int c);
///
pure int isupper(int c);
///
pure int isxdigit(int c);
///
pure int tolower(int c);
///
pure int toupper(int c);
