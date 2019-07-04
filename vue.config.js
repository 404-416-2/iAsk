// vue.config.js
module.exports = {
    // 选项...
    publicPath : '/',
    outputDir : 'dist',
    assetsDir : 'assets',
    indexPath : 'index.html',
    pages : {
        index : {
            entry : 'src/main.js',
            template : 'public/index.html',
            filename : 'index.html',
            title : 'HomePage'
        }
    },
    lintOnSave : false,//关闭eslint检查
    runtimeCompiler : true,//开启template
    productionSourceMap : true,//开启资源地图
    css : {
        modules : true,
        loaderOptions : {
            css : {
                localIdentName : '[name]-[hash]',
                camelCase : 'only'
            }
        },
        extract : true
    },
    devServer : {
        proxy : {
            '/api' : {
                target : 'http://localhost/IAsk',
                // ws : true,
                changeOrigin : true,
                pathRewrite : {
                    '^/api' : ''
                }
            }
        }
    }
  }