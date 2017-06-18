tcsushihead パッケージ
======================

LaTeX： FontAwssome の“fa-spin”のようにテキストを回転させる

ネストを実現するところに力入れた。

そもそも“fa-spin”は任意のテキストを回転させるためのものではないという
ツッコミについては暫時保留することにする。

注意： PDF 文書におけるアニメーションの表示をサポートする PDF ビューア
（Adobe Reader 等）は非常に少ない。

### 前提環境

  * フォーマット： LaTeX
  * エンジン： pdfTeX、XeTeX、LuaTeX、およびDVI出力のエンジン全て
  * DVIウェア（DVI出力の場合）： dvips、dvipdfmx
  * 依存パッケージ：
      - animate
      - pgfmath

### インストール

  - `*.sty` → $TEXMF/tex/latex/tcfaspin

### ライセンス

MIT ライセンスが適用される。

### パッケージ読込

    \usepackage[<オプション>,...]{tcfaspin}

以下のオプションが使用できる。

  * `dvips`、`dvipdfmx`： 当該の DVI ウェアを使う場合に指定する。
  * `ticks=<整数>`： アニメーション周期（2 秒）中のフレーム数。フレーム
    レート（＝ticks/2）は秒間 80 コマが上限である。（Adobe Reader の性能
    限界はもっと低いはず。）

### 使用法

  * `\faSpin{<テキスト>}`： そのテキストを回転させる。

更新履歴
--------

  * Version 0.2a ‹2017/06/18›
      - 微修正。
  * Version 0.2  ‹2017/06/16›
      - 最初の公開版。

--------------------
Takayuki YATO (aka. "ZR")  
Twitter: @zr_tex8r
