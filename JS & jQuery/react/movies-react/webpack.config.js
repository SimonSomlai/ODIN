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
    bundle: ['webpack-dev-server/client?http://localhost:3000', 'webpack/hot/only-dev-server', './src/index']
    },
  output: {
    path: path.join(__dirname, 'dist'),
    filename: 'bundle.js',
    publicPath: '/static/'
  },
  plugins: [
    new webpack.ProvidePlugin({$: "jquery", jQuery: "jquery", "window.jQuery": "jquery"}),
    new webpack.HotModuleReplacementPlugin(),
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
      },  {
        test: /\.(jpe?g|png|gif|svg)$/i,
        loaders: ['file?hash=sha512&digest=hex&name=[hash].[ext]', 'image-webpack?bypassOnDebug&progressive=true&optimizationLevel=4&interlaced=false']
      }
    ],
    postcss: [autoprefixer({browsers: ['last 2 versions']})]
  }
};


//
// const webpack = require('webpack');
// const path = require('path');
// const HtmlWebpackPlugin = require('html-webpack-plugin');
// const ExtractTextPlugin = require("extract-text-webpack-plugin");
// const CleanWebpackPlugin = require('clean-webpack-plugin');
// const autoprefixer = require('auto-prefixer');
//
// module.exports = {
//   devserver: {
//     port: '3000',
//     browser: 'default'
//   },
//     entry: {
//       app: ['webpack-dev-server/client?http://localhost:3000', 'webpack/hot/only-dev-server', './src/index'],
//     "vendor.js": ["./src/assets/scripts/jquery2.js", './src/assets/scripts/plugins.js', './src/assets/scripts/functions.js']
//     },
//     output: {
//       path: path.join(__dirname, 'dist'),
//       filename: 'bundle.js',
//       chunkFilename: "vendor.js",
//       publicPath: '/static/'
//     },
//   node: {
//     fs: 'empty',
//     net: 'empty',
//     tls: 'empty'
//   },
//   module: {
//     loaders: [
//       {
//         test: /\.js$/,
//         include: path.join(__dirname, 'src'),
//         loader: 'react-hot!babel?presets[]=es2015&presets[]=stage-0&presets[]=react',
//         exclude: /node_modules/
//       }, {
//         test: /\.scss$/,
//         loader: 'style!css!postcss-loader!sass?sourceMap',
//         exclude: /node_modules/
//       }, {
//         test: /\.(woff2?|ttf|eot|svg)$/,
//         loaders: ['url?limit=10000']
//       }, {
//         test: /\.(jpe?g|png|gif|svg)$/i,
//         loaders: ['file?hash=sha512&digest=hex&name=[hash].[ext]', 'image-webpack?bypassOnDebug&optimizationLevel=7&interlaced=false']
//       }
//     ],
//     postcss: [autoprefixer({browsers: ['last 2 versions']})]
//   },
//   plugins: [
//         new webpack.optimize.CommonsChunkPlugin({
//                 name: "vendor",
//                 filename: 'vendor.js',
//                 Infinity
//             }),
//
//     new webpack.HotModuleReplacementPlugin(),
//     new webpack.DefinePlugin({
//       'process.env': {
//         'NODE_ENV': JSON.stringify(process.env.NODE_ENV)
//       }
//     }),
//     new webpack.ProvidePlugin({$: 'jquery', jQuery: 'jquery', 'window.jQuery': 'jquery'})
//   ]
// };
