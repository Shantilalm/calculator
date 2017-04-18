Start "" /B /wait C:\localgitrepo\Calculator\packages\OpenCover.4.6.519\tools\OpenCover.Console.exe -register:user "-target:C:\localgitrepo\Calculator\packages\NUnit.ConsoleRunner.3.6.1\tools\nunit3-console.exe" "-targetargs: C:\localgitrepo\Calculator\Calculator.test\bin\Debug\Calculator.test.dll  -result:.\TestResult.xml;format=nunit2">C:\localgitrepo\calcuatortestresultwithcoverage.txt
C:\localgitrepo\Calculator\packages\ReportGenerator.2.5.6\tools\ReportGenerator.exe "-reports:results.xml" "-targetdir:C:\localgitrepo\coverage"
findstr /c:"Overall result: Passed" C:\localgitrepo\calcuatortestresultwithcoverage.txt
if %errorlevel% equ 0 (goto allcasepass) else (goto casefailed)
:allcasepass
echo. 1>&2
echo %errorlevel% 1>&2
SETLOCAL ENABLEDELAYEDEXPANSION
SET count=1
FOR /F "tokens=* USEBACKQ" %%F IN (`findstr /r /c:"^Visited" C:\localgitrepo\calcuatortestresultwithcoverage.txt`) DO (
  SET var!count!=%%F
  SET /a count=!count!+1
)
ECHO %var1%
ECHO %var2%
ECHO %var3%
ECHO %var4%
for /f "tokens=1,2,3,4,5,6 delims= " %%a in ("%var1%") do set classcoverage=%%f
for /f "tokens=1,2,3,4,5,6 delims= " %%a in ("%var2%") do set methodcoverage=%%f
for /f "tokens=1,2,3,4,5,6 delims= " %%a in ("%var3%") do set pointcoverage=%%f
for /f "tokens=1,2,3,4,5,6 delims= " %%a in ("%var4%") do set branchcoverage=%%f
ECHO %classcoverage%
ECHO %methodcoverage%
ECHO %pointcoverage%
ECHO %branchcoverage%
set classcoverage=%classcoverage:~1,-1%
set methodcoverage=%methodcoverage:~1,-1%
set pointcoverage=%pointcoverage:~1,-1%
set branchcoverage=%branchcoverage:~1,-1%
ECHO %classcoverage%
ECHO %methodcoverage%
ECHO %pointcoverage%
ECHO %branchcoverage%
if %classcoverage% gtr 80 if %methodcoverage% gtr 80 if %pointcoverage% gtr 80 if %branchcoverage% gtr 80  (goto coveragepass) else (goto coveragefailed)
ENDLOCAL
:coveragefailed
echo. 1>&2
echo Your commit has been blocked because code coverage failed. 1>&2  
echo Please correct the code to make code coverage pass. 1>&2
echo Thanks 1>&2
exit 1
:coveragepass
echo. 1>&2
echo class coverage passed
exit 0
:casefailed  
echo. 1>&2 
echo %errorlevel% 1>&2 
echo Your commit has been blocked Unit test caese are failed. 1>&2  
echo Please correct the code to make unit test pass then try commit. 1>&2
echo Thanks 1>&2
exit 1











