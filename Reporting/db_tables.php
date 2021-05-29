<?php
    #const PATH_TO_SQLITE_FILE = '/Library/WebServer/Documents/Reporting/WarberryReporting/SQLiteConnection/db/warberry.db';
    const PATH_TO_SQLITE_FILE = 'C:\PortableApps\xampp\htdocs\warberry\WarberryReporting\SQLiteConnection\php\db\warberry.db';
    #const PATH_TO_SQLITE_FILE = './WarberryReporting/SQLiteConnection/db/warberry.db';

    $db = new SQLite3(PATH_TO_SQLITE_FILE);
    $tablesquery = $db->query("SELECT name FROM sqlite_master WHERE type='table';");

    while ($table = $tablesquery->fetchArray(SQLITE3_ASSOC)) {
        echo $table['name'] . '<br />';
    }
?>
