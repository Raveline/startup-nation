const path = require("path");

module.exports = {
    devtool: 'source-map',

    entry: "./src/app.js",

    output: {
        path: path.resolve(__dirname, "public"),
        filename: "bundle.js"
    },

    module: {
        rules: [
            {
                test: /\.purs$/,
                loader: "purs-loader"
            }
        ]
    },

    devServer: {
        contentBase: "public"
    }
};
