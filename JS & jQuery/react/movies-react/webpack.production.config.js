path = require('path');
const webpack = require('webpack');

module.exports = {
  devtool: 'cheap-module-source-map',
  entry: ['./src/index'],
  output: {
    path: path.join(__dirname, 'dist'),
    filename: 'bundle.js'
  },
  plugins:[
    new webpack.DefinePlugin({
      'process.env': {
        'NODE_ENV': JSON.stringify('production')
      }
    })
  ],
  module: {
    loaders: [
      {
        test: /\.js$/,
        include: path.join(__dirname, 'src'),
        loader: 'react-hot!babel?presets[]=es2015&presets[]=stage-0&presets[]=react',
        exclude: /node_modules/
      },
      {
        test: /\.scss$/,
        loader: 'style!css!postcss-loader!sass?sourceMap',
        exclude: /node_modules/
      },
      {
        test: /\.(woff2?|ttf|eot|svg)$/,
        loaders: ['url?limit=10000']
      }
    ]
  }
};