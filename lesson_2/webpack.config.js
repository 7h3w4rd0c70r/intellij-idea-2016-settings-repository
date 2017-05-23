
var path = require('path');
var webpack = require('webpack');
var HtmlWebpackPlugin = require('html-webpack-plugin');
var ExtractTextPlugin = require('extract-text-webpack-plugin');
var CopyWebpackPlugin = require('copy-webpack-plugin');

module.exports = {
    entry: {
        gallery: path.resolve(__dirname, 'src/index.jsx')
    },
    output: {
        publicPath: '/haxe_intro/lesson_2',
        path: __dirname + '/dist',
        filename: '[name].[chunkhash].js'
    },
    devtool: 'source-map',
    resolve: {
        extensions: ['.js', '.jsx', '.less'],
        alias: {
            root:        path.resolve(__dirname),
            src:         path.resolve(__dirname, 'src'),
            assets:      path.resolve(__dirname, 'src/assets'),
            less:        path.resolve(__dirname, 'src/assets/less'),
            core:        path.resolve(__dirname, 'src/core'),
            components:  path.resolve(__dirname, 'src/components'),
            smart:       path.resolve(__dirname, 'src/components/smart'),
            dumb:        path.resolve(__dirname, 'src/components/dumb')
        }
    },
    devServer: {
        port: 8078,
        historyApiFallback: true
    },
    watchOptions: {
        aggregateTimeout: 1,
        ignored: /node_modules/
    },
    module: {
        loaders: [
            {
                test: /.jsx?$/,
                loader: 'babel-loader',
                exclude: /node_modules/,
                query: {
                    presets: ['es2015', 'react', 'stage-2', 'stage-0']
                }
            },
            {
                test: /\.html$/,
                loader: 'html-loader'
            },
            {
                test: /\.less$/,
                use: ExtractTextPlugin.extract({
                    fallback: 'style-loader',
                    use: 'css-loader!postcss-loader!less-loader'
                })
            }
        ]
    },
    plugins: [
        new HtmlWebpackPlugin({
            template: path.resolve(__dirname, 'src/index.html')
        }),
        new ExtractTextPlugin({
            filename: '[name].[chunkhash].css',
            allChunks: false
        }),
        new CopyWebpackPlugin([])
    ]
};
