---
id: tutorial-guidelines
summary: Learn how to make a portable installation of Ubuntu (UEFI) on a USB drive
categories: desktop
tags: ubuntu, installation, usb
difficulty: 3/5
status: draft
feedback_url: -
published: xx-xx-xxxx
author: Piotrek <pvanselow.2000@gmail.com>

---

# Instalacja Ubuntu na pamięci USB z możliwością bootowania na dowolnym komputerze

## Wstęp

W tym tutorialu poruszę kwestję instalacji Ubuntu (i pokrewnych dystrybucji Linuxa) na pamięci USB. Będzie to instalacja:

* Ubuntu 18.04.3 LTS
* W wersji UEFI
* Na dysku z tablicą partycji GPT

## Co jest potrzebne

* Dysk USB / pendrive: 8 GB, najlepiej USB3.1 Gen1 lub wyższe
* Pendrive: min. 4 GB, który posłuży nam jako dysk instalacyjny
* Komputer obsługujący UEFI

## 1. Tworzenie dysku instalacyjnego

* Pobierz obraz ISO wybranej dystrybucji linuxa.
* Pobierz program [Rufus](https://rufus.ie/) i uruchom go.
  * W programie wybierz pendrive którego chcesz użyć.
  * Następnie wybierz uprzednio pobrany obraz ISO.
  * Schemat partycjonowania: GPT
  * Docelowy system: UEFI.
  * System plików: fat32
  * Rozmiar jednostki alokacji: Default
  * Zaznacz również: szybkie formatowanie, utwórz rozszerzoną nazwę i pliki ikon
* Ostateczne ustawienia powinny wyglądać w ten sposób:
![Rufus_screenshot](IMG/01_RUFUS-Windows-10-Settings.png)
* Teraz kliknij start i w oknie dialogowym zezwól na pobranie dodatkowych plików.

## 2. Przygotowanie dysku USB do instalacji Linuxa

### Uruchom ponownie komputer, wejdź w boot menagera i kliknij (UEFI):nazwa_dysku

### W menu zaznacz "Try Ubuntu without installing"

* Dla instalatora w trybie UEFI tło w menu jest czarne (i takie powinno być w naszym przypadku).
* Dla trybu BIOS tło jest purpurowe.

### Teraz musimy sformatować nasz dysk USB i usunąć wszystkie partycje

* Aby to zrobić musimy uruchomić program __GParted__. Można to zrobić z terminala albo graficznie.
  * Otwórz terminal: <kbd>Ctrl</kbd> + <kbd>Alt</kbd> + <kbd>T</kbd>  
  * I w terminalu wpisz:  
    > `sudo gparted`
* W programie __GParted__ znajdź dysk USB  __/dev/sdX__  przeznaczony do instalacji linuksa.  
* Od teraz będę go nazywać __/dev/sdX__ 
* Sformatuj wszystkie partycje (może pojawić się potrzeba odmontowania ich):
  * dla zamontowanych partycji dysku: *PPM > Unmount*
  * dla wszystkich partycji dysku: *PPM > Format to > cleared*
  * __Apply All Operations__  

* Usuń wszystkie partycje: *PPM > Delete*, tak aby cała pamięć na dysku była __*Unallocated*__, ponownie naciśnij __Apply All Operations__ i zamknij __GParted__.
![Gparted_delete_screenshot](IMG/02_delete_partitions.png)

### Zmień tablicę partycji z MBR na GPT (jeżeli nie jest GPT)

* W terminalu wpisz:  

> `sudo gdisk /dev/sdX`

* Następnie:

> `w`

* I zatwierdź:

> `Y`

![gdisk_mbr_2_gpt](IMG/03_gdisk_done.png)

### 
