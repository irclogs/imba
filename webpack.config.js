module.exports = {
  mode: 'development',
  module: {
    rules: [
      {
        test: /\.imba$/,
        loader: 'imba/loader',
      }
    ]
  },
  resolve: {
    extensions: [".imba", ".js", ".json"]
  },
  entry: "./src/app.imba",
  output: {  path: __dirname + '/dist', filename: "app.js" }
}
