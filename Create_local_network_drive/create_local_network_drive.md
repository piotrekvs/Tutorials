---
id: tutorial-guidelines
summary: Create your own local file server
categories: xx
tags: network, drive
difficulty: 1/5
status: draft
feedback_url: -
published: xx-xx-xxxx
author: Szymon <rysszymon00@gmail.com>

---

# Tworzenie i mapowanie  w sieci lokalnej

## Wstęp
Stworzenie i mapowanie dysku sieciowego w sieci lokalnej to bardzo prosty, wygodny i darmowy sposób na stworzenie domowego serwera plików (np. zdjęć, filmów, dokumentów, ...), do których możemy mieć dostęp z dowolnego innego komputera podłączonego do sieci domowej.

## __Windows__

## 1. Ustawianie statycznego IP routerze dla komputera z dyskiem sieciowym
__UWAGA:__ Pierwsze 3 wartości wybranego adresu IP __muszą__ być zgodne z pierwszymi trzema polami _Bramy domyślnej_ / _Serwera DHCP_; czwarta wartość musi należeć do przedziału od _2 do 254_ (zalecane: _100 - 200_)
1. Sprawdź _adres MAC_ swojego urządzenia (karty sieciowej za pomocą której łączysz się z Internetem): 
    * Otwórz __Wiersz poleceń__ (__Command prompt__) i wpisz polecenie `ipconfig /all`, znajdź interfejs za pomocą którego komputer łączy się z internetem i pole _Physical Address_ <br/>
    ![ipconfig_screenshot](IMG/edited_get_mac_address_using_ipconfig.png)
    * Alternatywnie: _Panel sterowania > Centrum sieci i udostępniania_, otwórz _Połączenia_, _Szczegóły..._ i znajdź pole _Physical Address_ (_Control panel > Network and Sharing center_, open _Connections_, _Details..._ and check _Physical Address_ field) <br/>
    ![MacGUI_screenshot](IMG/edited_get_mac_address_using_GUI.png)
    * Niezależnie od wybranej opcji sprawdzania zapamiętaj także pole _DHCP Server_
2. Zmień IP na routerze:
    * Otwórz ustawienia routera w przeglądarce (wartość pola _DHCP Server_, np. 192.168.1.1)
    * Zaloguj się (domyślnie username/login: _admin_, password: _admin_)
    * Przypisz statyczny adres IP do adresu MAC swojego urządzenia - zależnie od producenta sprzętu sieciowego (TP-LINK, Huawei, Cisco, ...) taka konfiguracja może nazywać się różnie (w razie potrzeby skorzystaj z google)
        * W przypadku TP-LINK Archer C80: _Zaawansowane_ (_Advanced_) >_Sieć_ (_Network_);_Serwer DHCP_ > (_DHCP Server_); w _Rezerwacja adresów_ (_Address Reservation_) dodaj nowe pole, _Zapisz_ (_Save_) <br/>
        ![ArcherConfig_screenshot](IMG/edited_set_static_IP_on_archer_c80.png)
3. Sprawdź czy do urządzenia został przypisany poprawny _adres IP_ (`ipconfig /all` lub alternatywna wersja):
    * Jeśli tak - przejdź dalej
    * Jeśli nie - zrestartuj komputer

## 2. Ustawianie adresu na karcie sieciowej urządzenia z dyskiem sieciowym
* Jeśli udało Ci się z sukcesem przejść wszystkie kroki zawarte w __pkt. 1.__ wpisz polecenie `ipconfig /all` i sprawdź czy _IPv4 Address_ twojego urządzenia jest taki sam jak ustawiony na routerze
    * Alternatywnie: _Panel sterowania > Centrum sieci i udostępniania_, otwórz _Połączenia_, _Właściwości_, kliknij w _Protokół internetowy w wersji 4 (TCP/IPv4)_, przycisk _Właściwości_ poniżej i sprawdż czy _Adres IP_ (_IP address_) oraz _Serwer DNS_ (_DNS Server_) są ustawiane na domyślne (automatyczne) wartości <br/>
    ![ArcherConfig_screenshot](IMG/edited_check_network_card.png)
* Jeśli __nie__ udało Ci się z sukcesem przejść wszystkich kroków z __pkt. 1.__ spróbuj (może nie działać poprawnie):
    1. _Panel sterowania > Centrum sieci i udostępniania_, otwórz _Połączenia_, _Właściwości_
    2. Kliknij w _Protokół internetowy w wersji 4 (TCP/IPv4)_
    3. Kliknij przycisk _Właściwości_ poniżej i zmień _Adres IP_ (_IP address_) na wybrany przez siebie adres (patrz: __UWAGA__ w __pkt. 1.__) oraz _Bramę domyślną_ (_Default gateway_) na __istniejącą__ bramę domyślną, którą można sprawdzić przy okazji sprawdzania _Adresu MAC_ w __pkt. 1.__ <br/>
    ![ArcherConfig_screenshot](IMG/edited_change_network_card_properties_GUI.png)
    __UWAGA:__ W zależności od konfiguracji sieci możesz stracić dostęp do internetu. Wtedy jedyną drogą jest ponowienie próby ustawienia _statycznego adresu IP_ na routerze (patrz: __pkt. 1.__)

## 3. Udostępnianie folderu do sieci lokalnej
1. Utwórz folder który chcesz udostępnić w sieci lokalnej. Do folderu warto dodać jakikolwiek plik aby później móc łatwo sprawdzić czy jest on poprawnie udostępniany.
2. Kliknij prawym przyciskiem myszy w folder, wybierz _Właściwości > Udostępnianie > Zaawansowane ustawienia udostępniania..._, zaznacz _Udostępnij ten folder_, wejdź do _Uprawnienia_, ustaw dla grupy możliwość wprowadzania zmian (_Modyfikacja_) i odczytu (_Odczyt_) zgodnie z preferencjami
3. Wracając klikaj w każdym okienku kolejno _Zastosuj_ i _OK_ <br/>
![ArcherConfig_screenshot](IMG/edited_share_directory_windows.png)


## 4. Mapowanie dysku sieciowego
0. Te kroki należy wykonać na urządzeniu na którym chcemy mieć dostęp do zasobów dysku sieciowego
1. Otwórz __Ten Komputer__
2. _Mapuj dysk sieciowy_, wybierz literę, pod którą dysk będzie widoczny w komputerze
3. W polu _Folder_ podaj: \\\\_IP urządzenia_\\_nazwa folderu_
4. Kliknij _Zakończ_
5. Zaloguj się nazwą i hasłem użytkownika, który ten folder tworzył <br/>
![ArcherConfig_screenshot](IMG/edited_map_network_drive_windows.png)
6. Wróć do __Ten Komputer__ i otwórz swój dysk w sekcji _Dyski internetowe_ <br/>
![ArcherConfig_screenshot](IMG/edited_mapped_dir_windows.png)


## __Linux (Debian, Ubuntu, Mint, ...)__

## Potrzebne narzędzia
* pakiet _net-tools_: 
    ```
    apt-get install net-tools
    ``` 
* _samba_:
    ``` 
    sudo apt-get install samba
    ```

## 1. Ustawianie statycznego IP routerze (alternatywnie systemowo) dla komputera z dyskiem sieciowym
1. Sprawdź _adres MAC_ swojego urządzenia za pomocą `ifconfig` (z pakietu _net-tools_)
![ArcherConfig_screenshot](IMG/check_MAC_linux.png)
2. Przypisz swojemu urządzeniu statyczny _adres IP_ na routerze
    * Alternatywnie (nie zawsze działa) ustaw statyczny _adres IP_ dla swojego urządzenia w systemie
3. Używając `ifconfig` sprawdź czy _adres IP_ urządzenia został zmieniony
    * TAK - przejdź dalej
    * NIE - zrestartuj urządzenia

## 2. Udostępnianie folderu do sieci lokalnej
1. Utwórz folder, który chcesz udostępnić:
`mkdir /home/<user_name/<path>/<directory_name>`
2. Utwórz hasło dla swojego użytkownika dysku sieciowego:
`sudo smbpasswd -a <user_name>`
3. Skonfiguruj plik `/etc/samba/smb.conf`:
    * Na wypadek popełnienia błędu możesz zrobić kopię zapasową pliku _smb.conf_ (`sudo cp /etc/samba/smb.conf /<path_to_backup_dir>`)
    * `sudo nano /etc/samba/smb.conf` (for braves: można skorzystać z Vim'a zamiast nano tylko trzeba umieć później wyjść)
    * Na końcu pliku dodaj linijki:
    ```
    [<folder_name>]
    path = /home/<user_name>/<folder_name>
    valid users = <user_name>
    read only = no
    ```
    * Zapisz plik
4. Zrestartuj usługę `samba`:
`sudo service smbd restart`
5. Sprawdź konfigurację czy niema `syntax errors`:
`testparm`

## 3. Dostęp do udostępnionego folderu
* Dostęp z terminala i GUI (zalecane):
`sudo mount -t cifs -o username=<user_name> //<host_ip_name>/<directory_name> /<path_to_mounted_drive>/`
* Dostęp tylko z terminala:
`smbclient //<host_ip_name>/<directory_name> -U <user_name>`

__UWAGA:__ Przeglądanie plików z GUI jest całkiem wygodne, jednak w przypadku modyfikowania plików zalecane jest używanie terminala. :smile: