# Neovim Configuration

## nvim-surround

### Basic usage

"You Surround {motion} with {char}"

In all of the following examples, the `*` denotes the cursor position:
```
Old text                    Command         New text ~
local str = H*ello          ysiw"           local str = "Hello"
require"nvim-surroun*d"     ysa")           require("nvim-surround")
char c = *x;                ysl'            char c = 'x';
int a[] = *32;              yst;}           int a[] = {32};
```

"S" command in visual mode, |xxx| for selection
```
Old text                    Command         New text ~
local str = |some text|     S'              local str = 'some text'
|div id="test"|</div>       S>              <div id="test"></div>
```

`ds[char]`: delete surround
`cs{target}{replacement}`: change surround

*yss* operates on the current line via `yss[char]`, ignoring leading and trailing whitespace.

*yS* and *ySS* add the delimiter pair on new lines.

### Pairs

**closing character** will surround the selection with just the pair itself，
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
