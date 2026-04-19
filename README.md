# Mythdle
Hádej postavy z mytologií, folklóru a pohádek!  
Webová hra vytvořena v JS/PHP. 

## Instalace

### 1. Konfigurace

- Najděte soubor `config.php.example`
- Přejmenujte ho na `config.php`
- Otevřete `config.php` a nastavte přihlašovací údaje k databázi

### 2. Nastavení databáze

- Importujte přiložený SQL dump do vaší databáze (nachází se ve složce `extras/mythdle.sql`)
- Pokud používáte PhpMyAdmin, nastavte kolaci na `utf8mb4_general_ci` (kvůli podpoře emoji)

### 3. Složka extras

- Složka `extras` obsahuje:
  - design manuál
  - SQL dump
- Tato složka **není potřeba pro běh aplikace** a nemusí se nahrávat na hosting

### 4. Nastavení .htaccess

- Otevřete soubor `.htaccess`
- Najděte řádek `RewriteBase`
- Upravte ho podle umístění projektu:
  - Výchozí (subadresář):
    ```
    RewriteBase /mythdle/
    ```
  - Kořenový adresář:
    ```
    RewriteBase /
    ```

## Poznámky

- Server musí podporovat PHP a `.htaccess` (Apache s povoleným `mod_rewrite`)