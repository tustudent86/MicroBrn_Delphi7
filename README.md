# MicroBrn TOTAL decompilation / reverse-engineering to Delphi source project.

---

### `.\Original_DIYpack25ep:`
Containts the original MicroBrn 2007 distribution from Kits'R'Us with 
MicroBrn and HEX files for the various programmer kits.

Original EXE was packed by NPack and is detected as malware by many AVs
(SHA256: `b09641a6a2a17fcee67dcfd92c316f58b4409e35800d55c423d7194ebb37e7af`)

### `.\Unpacked_EXE`
Contains unpacked EXEs (original code) for `MicroBrn.exe` and `FIXHEX2.exe`

### `.\` (This directory)
Contains complete Delphi source code project that was reverse-engineered 
by decompilation from original EXE.  You can compile the source code with
Delphi 7 AFTER installation of replacement "TSerial" (see below in this
file)

---

This software is not supported by original author anymore since long time
and can be considered abandonware.  The K150 programmer is mostly sold as
a  modified and improved clone (on-board VPP generation) on AliExpress.

Rebuild from source MicroBrn was tested on K150 clone hardware from AliExpress
with MCUs: `PIC12F508`, `PIC12F629`, `PIC16F628A` and `PIC18F452`.    Due to
fact, that programmer's MCU (`PIC16F628A`) is performing the programming
algorithms and MicroBrn is just setting up the programmer and transmitting
data, I expect  all others to work too.

### Patches:
* COM port limitation 1-9 was removed (replaced by 1-99) , as replacement
TSerial2 component uses `\\.\`-syntax with `CreateFile`, therefore works with
arbitrary COM port number.

* EEPROM .HEX file save bug was fixed (previously MicroBrn except for BIT14_H
(non existant in CHIPDATA.CID) chips and PIC18F did not save EEPROM in .HEX
file

Delphi 7 can be downloaded from:
[https://winworldpc.com/product/delphi/70](https://winworldpc.com/product/delphi/70)

Newly compiled EXE from source project is NOT detected as malware, only generic
by some crappy AV like Indian "MaxSecure".  Original packed EXE was detected by
many AV and blocked by browsers when downloading.

---

## IMPORTANT note about TSerial / Serial2:
The application and Delphi form designer needs an installed package containing
`"TSerial"`. Because original package cannot be found anymore, a substitution
package was created that only contains parts / API used by MicroBrn.

### To install in Delphi 7:
1. Close the MicroBrn project if open and choose `CANCEL` if asked for ignoring
   a missing component and close the project without saving it (if you already
   saved it with removed component, extract files again)
2. Open `"MicroBrnSerialD7.dpk"` with `File -> Open` in this directory.
3. Click `Compile`, then click `Install` in the Package Editor. Delphi should
   report that `TSerial` was registered.
4. Close the component project and open `"MicroBrn.dpr"` in the current
   directory
5. Test compilation.
