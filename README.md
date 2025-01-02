# RetroTink4K-PCRemote
Ein Powershell Skript um den Retrotink4K via USB vom PC zu steuern

Mit diesem Skript kann man via PowerShell die Befehle eines Retrotink4K via USB/Serial senden.
Dazu wird das Programm SerialSend.exe benötigt. https://batchloaf.wordpress.com/serialsend/

Der Retrotink muss via USB-C Kabel mit dem PC Verbunden sein und im Gerätemanager erkannt werden.

Setup:
Im Skript müssen folgende Variabeln eingestellt werden:

\$com = "10"            # COM-Port-Nummer (z. B. "1" für COM1) - Der Com des Retrotinks. Das Gerät im Gerätemanager heisst: "USB Serial Port"

$baud = "115200"        # Baudrate (115200 für den Retrotink 4K)

$serialSendPath = "O:\Retrotink\SerialSend.exe" # Pfad zur SerialSend.exe lokal auf euren PC.

Nutzung aus der Powershell:
.\RT4KRemoteSerial.ps1 -Eingabe "down"

Das Skript setzt automatisch das notwendige "remote" als Prefix und ein "\n" als Postfix um die Eingabe herum.
Das Skript prüft  ob die Eingabe einem der gültigen Retroink4K Befehle entspricht.

In Kombination mit einem StreamDeck (https://www.elgato.com/) oder ähnliches kann das Skript via Shortcuts ausgeführt werden.
Für das StreamDeck gibt es ein Plugin mit dem Namen "WindowsScriptDeck". Mit dem kann dann auf einzelne Buttons die Ansteuerung des Skripts legen:
z.b: O:\Retrotink\RT4KRemoteSerial.ps1 -Eingabe "menu"

Die Befehle des Retroinks4K gehen aus der Dokumenations hervor:
https://consolemods.org/wiki/AV:RetroTINK-4K#USB_Serial_Configuration

Entwickelt auf Basis der Retrotink4K Firmware v.1.6.9 (https://retrotink-llc.github.io/firmware/4k.html)

Bilder dazu hier im X Post: https://x.com/Carter_ccc/status/1874864322662572526

ENGLISH (deepl)

A Powershell script to control the Retrotink4K via USB from the PC

With this script you can send the commands of a Retrotink4K via USB/Serial using PowerShell. The SerialSend.exe programme is required for this. https://batchloaf.wordpress.com/serialsend/

The Retrotink must be connected to the PC via USB-C cable and recognised in the device manager.

Setup: The following variables must be set in the script:

$com = ‘10’ # COM port number (e.g. ‘1’ for COM1) - The Com of the Retrotink. The device in the device manager is called: ‘USB Serial Port’

$baud = ‘115200’ # Baud rate (115200 for the Retrotink 4K)

$serialSendPath = ‘O:\Retrotink\SerialSend.exe’ # Path to SerialSend.exe locally on your PC.

Use from the Powershell:
.\RT4KRemoteSerial.ps1 -Eingabe "down"

The script automatically places the necessary ‘remote’ as a prefix and a ‘\n’ as a postfix around the input.
The script checks whether the input corresponds to one of the valid Retroink4K commands.

In combination with a StreamDeck (https://www.elgato.com/) or similar, the script can be executed via shortcuts.
There is a plugin for the StreamDeck called ‘WindowsScriptDeck’. This can then be used to control the script on individual buttons:
e.g: O:\Retrotink\RT4KRemoteSerial.ps1 -Eingabe "menu"

The Retroinks4K commands can be found in the documentation:
https://consolemods.org/wiki/AV:RetroTINK-4K#USB_Serial_Configuration

Developed on the basis of Retrotink4K firmware v.1.6.9 (https://retrotink-llc.github.io/firmware/4k.html)

Pics here on my X post: https://x.com/Carter_ccc/status/1874864322662572526


