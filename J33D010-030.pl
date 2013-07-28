#!/usr/bin/perl
use constant KEEP => 60;

$base = "/Users/indou/work/J33D010-030.pl.d/base";
@targets = ("DB", "listener", "AP");
foreach $target (@targets) {
  if (opendir(DH, $base . "/" . $target)) {
    @dirs = readdir(DH);
    @sorted = sort {$b <=> $a} @dirs;
    $i = 1;
    foreach $dir (@sorted) {
      if($dir == ".." or $dir == ".") {
        next;
      }
      if($i > KEEP) {
        $deldir = $base . "/" . $target . "/" . $dir;
        #print "$deldir\n";
        if (opendir(DH2, $deldir)) {
          unlink <$deldir/*> or die("unlink $deldir:$!");
          closedir(DH2);
        }
        rmdir $deldir or die("rmdir $deldir:$!"); # dieは未通
      }
      $i++;
    }
    closedir(DH);
  } else {
    die("$target:$!");
  }
}
exit(0);
