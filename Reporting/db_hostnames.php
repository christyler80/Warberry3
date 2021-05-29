<?php
#const PATH_TO_SQLITE_FILE = '/Library/WebServer/Documents/Reporting/WarberryReporting/SQLiteConnection/db/warberry.db';
const PATH_TO_SQLITE_FILE = 'C:\PortableApps\xampp\htdocs\warberry\WarberryReporting\SQLiteConnection\php\db\warberry.db';
#const PATH_TO_SQLITE_FILE = './WarberryReporting/SQLiteConnection/db/warberry.db';
class MyDB extends SQLite3
    {
    function __construct()
        {
        $this->open(PATH_TO_SQLITE_FILE);
        }
    }

#$pdo = new \PDO("sqlite:" . Config::PATH_TO_SQLITE_FILE);
#$pdo = new PDO("sqlite:" . PATH_TO_SQLITE_FILE);
$pdo = new \PDO("sqlite:" . PATH_TO_SQLITE_FILE);
				
$stmt = $pdo->query('SELECT * FROM warberry_session ');
while ($row = $stmt->fetch(\PDO::FETCH_ASSOC))
	{
    echo "ID = " . $row["WarberrySessionID"] . "<br />";
    }
#$pdo->close();

$db = new MyDB();
if (!$db)
    {
    echo $db->lastErrorMsg();
    }
else
    {
    echo "Opened database successfully<br>";
    }

$sql = <<<EOF
      SELECT * from war_hostnames;
EOF;

$ret = $db->query($sql);
while ($row = $ret->fetchArray(SQLITE3_ASSOC))
    {
    echo "ID = " . $row['WarberryHostnamesID'] . " - ";
    echo "NAME = " . $row['hostname'] . "<br />";
    }
echo "Operation done successfully\n";
$db->close();
?>
