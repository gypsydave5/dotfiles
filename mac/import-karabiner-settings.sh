#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

$cli set bilalh.remap.f19_escape_control 1
/bin/echo -n .
$cli set general.dont_remap_external 1
/bin/echo -n .
$cli set passthrough.fnescape 1
/bin/echo -n .
$cli set remap.commandR2optionL 1
/bin/echo -n .
$cli set remap.optionR2controlR 1
/bin/echo -n .
$cli set remap.programmer.shifts_parens 1
/bin/echo -n .
$cli set remap.qwerty2colemak 1
/bin/echo -n .
$cli set remap.shiftRshiftL_to_capslock 1
/bin/echo -n .
$cli set repeat.initial_wait 200
/bin/echo -n .
$cli set repeat.wait 20
/bin/echo -n .
/bin/echo
