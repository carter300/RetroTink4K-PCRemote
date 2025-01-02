# Argumente einlesen
Param (
    [string]$Eingabe    # Eingabe über die Kommandozeile
)

# Debug-Ausgabe für das Argument
Write-Host "Übergebenes Argument für Eingabe: '$Eingabe'" -ForegroundColor Yellow

# Variablen für Standardwerte
$com = "10"            # COM-Port-Nummer (z. B. "1" für COM1)
$baud = "115200"        # Baudrate (115200 für den Retrotink 4K)

# Prüfen, ob das Argument für $Eingabe übergeben wurde
if ([string]::IsNullOrEmpty($Eingabe)) {
    Write-Host "Fehler: Kein Hex-String übergeben. Bitte mit -Eingabe 'HexString' ausführen." -ForegroundColor Red
    exit 1
}

# Pfad zur SerialSend.exe
$serialSendPath = "O:\Retrotink\SerialSend.exe"

# Prüfen, ob SerialSend.exe existiert
if (-Not (Test-Path $serialSendPath)) {
    Write-Host "SerialSend.exe nicht gefunden unter $serialSendPath. Bitte überprüfen." -ForegroundColor Red
    exit 1
}

# Liste der möglichen Commands
$validCommands = @(
    "pwr", "menu", "up", "down", "left", "right", "ok", "back", "diag", "stat",
    "input", "output", "scaler", "sfx", "adc", "prof", "prof1", "prof2", "prof3",
    "prof4", "prof5", "prof6", "prof7", "prof8", "prof9", "prof10", "prof11", "prof12",
    "gain", "phase", "pause", "safe", "genlock", "buffer", "res4k", "res1080p", "res1440p",
    "res480p", "res1", "res2", "res3", "res4", "aux1", "aux2", "aux3", "aux4", "aux5",
    "aux6", "aux7", "aux8", "pwr on"
)

# Prüfen, ob der Eingabewert in der Liste der gültigen Commands vorhanden ist
if ($validCommands -contains $Eingabe) {
    [String]$command = "remote $Eingabe\n"  # "remote" vor den Befehl setzen
} else {
    Write-Host "Unbekannter Befehl: '$Eingabe'. Bitte einen gültigen Befehl eingeben." -ForegroundColor Red
    exit 1
}

# Debug-Ausgabe für den Befehl
Write-Host "Auszuführender Befehl: $command" -ForegroundColor Cyan

# Befehl an SerialSend.exe übergeben
Invoke-Expression "$serialSendPath /devnum $com /baudrate $baud /hex '$command'"

#Liste der Befehle:
#https://consolemods.org/wiki/AV:RetroTINK-4K#USB_Serial_Configuration
#Ausführen mit: .\RT4KRemoteSerial.ps1 -Eingabe "down"