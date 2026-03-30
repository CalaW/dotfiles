# Neovim Configuration

## nvim-surround

### Basic usage

"Get Surround {motion} with {char}"

In all of the following examples, the `*` denotes the cursor position:
```
Old text                    Command         New text ~
local str = H*ello          gsiw"           local str = "Hello"
require"nvim-surroun*d"     gsa")           require("nvim-surround")
char c = *x;                gsl'            char c = 'x';
int a[] = *32;              gst;}           int a[] = {32};
```

"gS" command in visual mode, |xxx| for selection
```
Old text                    Command         New text ~
local str = |some text|     gs'             local str = 'some text'
|div id="test"|</div>       gs>             <div id="test"></div>
```

`dgs[char]`: delete surround,
`cgs{target}{replacement}`: change surround

*gss* operates on the current line, ignoring leading and trailing whitespace.

*gS* and *gSS* add the delimiter pair on new lines.

### Pairs

**closing character** will surround the selection with just the pair itself;
**opening character** will add a whitespace gap between the selection and delimiter pair.

`tT`: HTML tags
`t` will only change the surrounding tag's type (leaving the attributes alone), while `T` will change the entirety of the surrounding tag's contents.
```
Old text                    Command         New text ~
div cont*ents               ysstdiv         <div>div contents</div>
h1 *contents                yssth1 id="x"   <h1 id="x">h1 contents</h1>
<div>d*iv contents</div>    dst             div contents
<h1 id="head">t*ext</h1>    cstdiv          <div id="head">text</div>
<h1 id="head">text*</h1>    csTdiv          <div>text</div>
```

`f`: function calls
```
Old text                    Command         New text ~
arg*s                       ysiwffunc       func(args)
f*unc_name(a, b, x)         dsf             a, b, x
f*unc_name(a, b, x)         csfnew_name     new_name(a, b, x)
```

`i`: manually input
```
Old text                    Command         New text ~
inner text                  yssi/<CR>\      /inner text\
```

`a`: >, `p`: ), `B`: }, `b`: ], `q`: quotes, `s`: all pair

disabled literal surround (`invalid_key_behavior`)

LaTeX related surround is placed in `after/ftplugin/tex.vim`.
`c`: command, `e`: environment, `m`: math

## leap.nvim

s/S for normal mode sneak

A character at the end of a line can be targeted by pressing <space> after it.

Empty lines can also be targeted, by pressing the newline alias twice (<space><space> by default).

## vimtex

change math text object from `$` to `m`

`]e` for navigating between environments,
`]m` for navigating between math,
`]i` for navigating between items.

`tgsd` to toggle between delimiters,
`tgsD` to toggle between delimiters reversely,
`tgsm` to toggle math environments.
