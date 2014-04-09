function Matrix (options) {
    var options = $.merge(options, {
        rows: 2,
        columns: 2,
        values: [
            [1, 0],
            [0, 1]
        ]
    });

    this.rows = options.rows;
    this.columns = options.columns;
    this.values = options.values;
}

Matrix.prototype.changeRows = function (new_rows) {
    this.rows = new_rows;
};

Matrix.prototype.changeColumns = function (new_columns) {
    this.columns = new_columns;
};

Matrix.prototype.getDeterminant = function (callback) {
    
};
