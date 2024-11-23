@echo off

:: Configuration
set "Affinity=0x0000000000005554"      :: Processor affinity mask
set "MaxRetries=5"                     :: Maximum number of retries
set "RetryInterval=10"                 :: Interval (seconds) between retries
set "ProcessName=BlackDesertPatcher32.pae" :: Target process name

:: Start the game via Steam
echo Starting game via Steam...
start steam://rungameid/582660

:: Initial wait to allow the game to start
echo Waiting for the game to initialize... (%RetryInterval% seconds)
timeout /t %RetryInterval% /nobreak >nul

:: Retry loop to set affinity
set "RetryCount=0"
:RetryAffinity
set /a "RetryCount+=1"
echo [Attempt %RetryCount%/%MaxRetries%] Checking process and setting processor affinity...

:: PowerShell command to check process and set affinity
powershell.exe -NoProfile -Command ^
    "$Affinity = '%Affinity%'; " ^
    "$ProcessName = '%ProcessName%'; " ^
    "$Processes = Get-Process -ErrorAction SilentlyContinue | Where-Object { $_.ProcessName -eq $ProcessName }; " ^
    "if ($Processes) { " ^
    "    foreach ($Process in $Processes) { " ^
    "        try { " ^
    "            $Process.ProcessorAffinity = [int64]$Affinity; " ^
    "            Write-Host 'Affinity set successfully for process' $ProcessName '.'; " ^
    "            exit 0; " ^
    "        } catch { " ^
    "            Write-Host 'Failed to set affinity for process' $ProcessName ': ' $_.Exception.Message; " ^
    "        } " ^
    "    } " ^
    "} else { " ^
    "    Write-Host 'Process' $ProcessName 'not found. Retrying...'; " ^
    "    exit 1; " ^
    "}"

:: Check if affinity was set successfully
if "%errorlevel%" == "0" (
    echo Affinity set successfully for %ProcessName%. Exiting.
    exit /b 0
)

:: Retry logic
if "%RetryCount%" lss "%MaxRetries%" (
    echo Waiting %RetryInterval% seconds before retrying...
    timeout /t %RetryInterval% /nobreak >nul
    goto RetryAffinity
)

:: If retries are exhausted
echo ERROR: Failed to set affinity for %ProcessName% after %MaxRetries% attempts. Exiting.
pause
exit /b 1
