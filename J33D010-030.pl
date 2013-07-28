#!/usr/bin/perl
$base = "/Users/indou/work/J33D010-030.pl.d/base";
@targets = ("DB", "listener", "AP");
foreach $target (@targets) {
  opendir(DH, $base . "/" . $target);
  @dirs = readdir(DH);
  @sorted = sort {$b <=> $a} @dirs;
  $i = 1;
  foreach $dir (@sorted) {
    if($dir == ".." or $dir == ".") {
      next;
    }
    if($i > 60) {
      $deldir = $base . "/" . $target . "/" . $dir;
      #print "$deldir\n";
      if (opendir(DH2, $deldir)) {
        unlink <$deldir/*>;
      }
      closedir(DH2);
      rmdir $deldir;
    }
    $i++;
  }
  closedir(DH);
}
exit(0);
