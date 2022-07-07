console.log("Javascript instatied.")

function dbInit()
{
    let db = LocalStorage.openDatabaseSync("Database", "", "App Settings",
                                           1000000);
    try
    {
        db.transaction(function (tx) {
            tx.executeSql(
                        "CREATE TABLE IF NOT EXISTS app_settings (data_text, data_value)"
                        );
        });
    }
    catch (err)
    {
        console.log("Error creating table in database: " + err);
        //Qt.quit()
    }
}

function dbGetHandle()
{
    let db;
    try
    {
        db = LocalStorage.openDatabaseSync("Database", "", "App Settings",
                                           1000000);
    }
    catch (err)
    {
        console.log("Error opening database: " + err);
    }

    return db;
}

function dbSet(data_text, data_value)
{
    const db = dbGetHandle();
    let row_id = 0;
    db.transaction(function (tx) {
        tx.executeSql("INSERT INTO app_settings VALUES(?, ?)",
                      [data_text, data_value]);
    });
}

function dbGet(data_text)
{
    const db = dbGetHandle();
    let row_id = 0;

    db.transaction(function (tx) {
        const result = tx.executeSql(`SELECT data_value FROM app_settings
                      WHERE data_text = '${data_text}'`);
        row_id = result.rows.item(0).data_value
    });

    return row_id;
}

function dbUpdate(data_text, data_value)
{
    const db = dbGetHandle();
    db.transaction(function (tx) {
        tx.executeSql(`UPDATE app_settings
                      SET data_text = ?, data_value = ?`,
                      [data_text, data_value]);
    });
}

function dbClearAll() {
    const db = dbGetHandle();
    db.transaction(function (tx) {
        tx.executeSql("DELETE FROM app_settings")
    });
}
