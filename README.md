tcfaspin
========

LaTeX: to spin text just as “fa-spin” of FontAwesome

Just try it.

NOTE: The animation inside PDF documents is supported by very few PDF
viewers, including Adobe Reader.

### SYSTEM REQUIREMENT

  * TeX format: LaTeX.
  * TeX engine: pdfTeX, XeTeX, LuaTeX, and any DVI-output engines.
  * DVI-ware (in DVI-output mode): dvips, dvipdfmx.
  * Required packages:
      - animate
      - pgfmath

### INSTALLATION

  - `*.sty` → $TEXMF/tex/latex/tcfaspin

### LICENSE

This package is distributed under the MIT license.

### PACKAGE LOADING

    \usepackage[option,...]{tcfaspin}

The following options are available:

  * `dvips`, `dvipdfmx`: Specifies that the DVI-driver of that name should
    be used.
  * `ticks=<number>`: The number of frames in an animation cycle (2 sec).
    When the frame rate (= ticks/2) exceeds 80/s, the value is capped.
    (Probably the performance limit of Adobe Reader is much lower.)

### USAGE

  * `\faSpin{<text>}`: Spins the text.

REVISION HISTORY
----------------

  * Version 0.2a ‹2017/06/18›
      - Minor fix.
  * Version 0.2  ‹2017/06/16›
      - First public version.

--------------------
Takayuki YATO (aka. "ZR")  
Twitter: @zr_tex8r
