const path = require('path'),
  webpack = require('webpack'),
  autoprefixer = require('auto-prefixer');

module.exports = {
  devtool: 'source-map',
  devserver: {
    port: '3000',
    browser: 'default'
  },
  entry: {
    app: ['webpack-dev-server/client?http://localhost:3000', 'webpack/hot/only-dev-server', './src/index'],
  "vendor.js": ["./src/assets/scripts/jquery2.js", './src/assets/scripts/plugins.js', './src/assets/scripts/functions.js']
  },
  output: {
    path: path.join(__dirname, 'dist'),
    filename: 'bundle.js',
    chunkFilename: "vendor.js",
    publicPath: '/static/'
  },
  plugins: [
    new webpack.ProvidePlugin({$: "jquery", jQuery: "jquery", "window.jQuery": "jquery"}),
    new webpack.HotModuleReplacementPlugin(),
    new webpack.optimize.CommonsChunkPlugin({
            name: "vendor",
            filename: 'vendor.js',
            Infinity
        })
  ],
  module: {
    loaders: [
      {
        test: /\.js$/,
        include: path.join(__dirname, 'src'),
        loader: 'react-hot!babel?presets[]=es2015&presets[]=stage-0&presets[]=react',
        exclude: /node_modules/
      }, {
        test: /\.scss$/,
        loader: 'style!css!postcss-loader!sass?sourceMap',
        exclude: /node_modules/
      }, {
        test: /\.(woff2?|ttf|eot|svg)$/,
        loaders: ['url?limit=10000']
      }, {
        test: /\.(jpe?g|png|gif|svg)$/i,
        loaders: ['file?hash=sha512&digest=hex&name=[hash].[ext]', 'image-webpack?bypassOnDebug&optimizationLevel=7&interlaced=false']
      }
    ],
    postcss: [autoprefixer({browsers: ['last 2 versions']})]
  }
};
