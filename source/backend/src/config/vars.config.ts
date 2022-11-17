// setup database
export const DATA_SOURCES = {
    mySqlDataSource: {
        DB_HOST: process.env.MARIADB_HOST,
        DB_USER: process.env.MARIADB_USER,
        DB_PASSWORD: process.env.MARIADB_PASSWORD,
        DB_DATABASE: process.env.MARIADB_DATABASE,
        DB_CONNECTION_LIMIT: process.env.MARIADB_CONNECTION_LIMIT ? parseInt(process.env.MARIADB_CONNECTION_LIMIT) : 4,
    }
};
