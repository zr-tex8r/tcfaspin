use v5.12;
my $program = "makegif";
#
my $input;
my $cycle = 200; # 2 seconds
my $ticks = 32;
my $latex = "platex";
my $density = 225;

sub main {
  read_option();
  unlink(glob("__frm*.png"), "$input.gif");
  foreach (0 .. $ticks - 1) {
    make_frame($_);
  }
  my $delay = $cycle / $ticks;
  system("convert -delay $delay __frm*.png $input.gif");
  (-f "$input.gif") or error("post-conversion failed", "$input.gif");
  unlink(glob("__frm*.png"), "$input.pdf");
}

sub read_option {
  $input = (shift(@ARGV) // '') =~ s/\.tex$//r;
  (-f "$input.tex") or error("file not found", "$input.tex");
  $ticks = shift(@ARGV) // $ticks;
  ($ticks =~ m/^\d+/ && 0 < $ticks && $ticks <= 80)
    or error("bad ticks value", $ticks);
  $ticks = int(($ticks + 15) / 16) * 16;
}

sub run_latex {
  my ($tck, $ticks, $base, $intr) = @_;
  unlink("$base.dvi", "$base.pdf");
  local $_ = system($latex,
    "-halt-on-error", "-interaction=batchmode",
    "\\def\\faTicks{$ticks}", "\\chardef\\faStopTicks=$tck",
    "\\input", $base);
  ($_ == 0 && -s "$base.dvi") or return;
  ($intr) and return 1;
  local $_ = system("dvipdfmx", $base);
  ($_ == 0 && -s "$base.pdf") or return;
  unlink("$base.aux", "$base.log", "$base.dvi");
  return 1;
}

sub make_frame {
  my ($tck) = @_;
  my $frame = sprintf("__frm%04d", $tck);
  run_latex($tck, $ticks, $input)
    or error("compilation failed", "$input.tex");
  system("convert -density $density $input.pdf $frame.png");
  (-f "$frame.png") or error("conversion failed", "frame $tck");
}

sub error {
  say STDERR (join(": ", $program, @_));
  exit(-1);
}

main();
__END__

platex -halt-on-error %1 || exit /B
platex -halt-on-error %1 || exit /B
dvipdfmx %1 || exit /B
del %1.log %1.aux %1.dvi
if exist frm*.png del frm*.png
convert -density 600 %1.pdf frm.png
perl 10sortout.pl
convert -delay 5 frm-*.png -resize 720 %1.gif
del frm*.png

