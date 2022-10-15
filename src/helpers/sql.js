/*
querySql - querries pool with sql

Returns:  Promise< querriedResult >
Params:
    sqlPool <object>                sql pool
    sql <string>                    sql query
    handleResult <function>         query results handler

    handleResult - query results handler
    Params:
        fulfill <function>      promise fulfill
        result <function>       query result
        reject <function>       promise reject
*/
export const querySql = (
    sqlPool = {},
    sql = '',
    handleResult = () => {}
    //includeHeader = false
) =>
    new Promise((fulfill, reject) => {
        sqlPool.query(sql, (error, result) => {
            if (error) {
                reject(error);
            }

            handleResult(fulfill, result, reject);
        });
    });
