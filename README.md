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
