(function(t){function e(e){for(var i,o,r=e[0],u=e[1],c=e[2],p=0,d=[];p<r.length;p++)o=r[p],s[o]&&d.push(s[o][0]),s[o]=0;for(i in u)Object.prototype.hasOwnProperty.call(u,i)&&(t[i]=u[i]);l&&l(e);while(d.length)d.shift()();return a.push.apply(a,c||[]),n()}function n(){for(var t,e=0;e<a.length;e++){for(var n=a[e],i=!0,r=1;r<n.length;r++){var u=n[r];0!==s[u]&&(i=!1)}i&&(a.splice(e--,1),t=o(o.s=n[0]))}return t}var i={},s={index:0},a=[];function o(e){if(i[e])return i[e].exports;var n=i[e]={i:e,l:!1,exports:{}};return t[e].call(n.exports,n,n.exports,o),n.l=!0,n.exports}o.m=t,o.c=i,o.d=function(t,e,n){o.o(t,e)||Object.defineProperty(t,e,{enumerable:!0,get:n})},o.r=function(t){"undefined"!==typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(t,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(t,"__esModule",{value:!0})},o.t=function(t,e){if(1&e&&(t=o(t)),8&e)return t;if(4&e&&"object"===typeof t&&t&&t.__esModule)return t;var n=Object.create(null);if(o.r(n),Object.defineProperty(n,"default",{enumerable:!0,value:t}),2&e&&"string"!=typeof t)for(var i in t)o.d(n,i,function(e){return t[e]}.bind(null,i));return n},o.n=function(t){var e=t&&t.__esModule?function(){return t["default"]}:function(){return t};return o.d(e,"a",e),e},o.o=function(t,e){return Object.prototype.hasOwnProperty.call(t,e)},o.p="";var r=window["webpackJsonp"]=window["webpackJsonp"]||[],u=r.push.bind(r);r.push=e,r=r.slice();for(var c=0;c<r.length;c++)e(r[c]);var l=u;a.push([0,"chunk-vendors"]),n()})({0:function(t,e,n){t.exports=n("56d7")},"034f":function(t,e,n){"use strict";var i=n("64a9"),s=n.n(i);s.a},3648:function(t,e,n){"use strict";var i=n("5b40"),s=n.n(i);s.a},"56d7":function(t,e,n){"use strict";n.r(e);n("cadf"),n("551c"),n("f751"),n("097d");var i=n("a026"),s=function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{style:{height:t.H+"px"},attrs:{id:"app"}},[i("div",{attrs:{id:"header"}},[i("Header",[i("div",{staticClass:"headerItem"},[i("img",{attrs:{src:n("b640"),width:"50",height:"50"}})]),i("div",{staticClass:"headerItem",attrs:{id:"search"}},[i("Input",{attrs:{type:"text",styleClass:"primary",placeholder:"搜索..."},on:{input:t.search}}),i("div",{staticStyle:{height:"25px",width:"50px"}})],1),i("div",{staticClass:"headerItem"},[i("span",{on:{click:t.openSignInWindow}},[t._v("登陆")]),t._v(" |\n          "),i("span",{on:{click:t.openSignUpWindow}},[t._v("注册")])])]),i("Nav",{attrs:{tabs:t.tabs},on:{switchChange:t.flashPanel}})],1),i("div",{attrs:{id:"contentBody"}},t._l(t.questions,function(t){return i("Panel",{key:t.id,attrs:{name:t.name,time:t.time,question:t.question}})}),1),i("Popup",{attrs:{title:t.popup.title,isActive:t.popup.isOpen},on:{stateChange:t.cannelPopup}},[t.popup.isSignIn?i("form",[i("div",{attrs:{id:"form"}},[i("div",[i("label",[t._v("邮箱")])]),i("div",[i("Input",{attrs:{type:"email",size:{H:35,W:200}},model:{value:t.account,callback:function(e){t.account=e},expression:"account"}})],1),i("div",[i("label",[t._v("密码")])]),i("div",[i("Input",{attrs:{type:"text",size:{H:35,W:200}},model:{value:t.password,callback:function(e){t.password=e},expression:"password"}})],1),i("div",{attrs:{id:"item"}},[i("Button",{attrs:{styleClass:"default",size:{H:50,W:300},text:"登录",click:"signIn"},on:{click:t.signIn,"":function(t){}}})],1)])]):i("form",[i("div",{attrs:{id:"form"}},[i("div",[i("label",[t._v("邮箱")])]),i("div",[i("Input",{attrs:{type:"email",placeholder:"输入常用邮箱",size:{H:35,W:200}},model:{value:t.account,callback:function(e){t.account=e},expression:"account"}})],1),i("div",[i("label",[t._v("密码")])]),i("div",[i("Input",{attrs:{type:"text",placeholder:"字母、数字、符号组合",size:{H:35,W:200}},model:{value:t.password,callback:function(e){t.password=e},expression:"password"}})],1),i("div",{attrs:{id:"item"}},[i("Button",{attrs:{size:{H:50,W:300},text:"注册",click:"signUp"},on:{click:t.signIn,"":function(t){}}})],1)])])])],1)},a=[],o=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{directives:[{name:"show",rawName:"v-show",value:t.isOpen,expression:"isOpen"}],staticClass:"popup"},[n("div",{attrs:{id:"layer"},on:{click:t.cancel}}),n("div",{attrs:{id:"panel"}},[n("div",{attrs:{id:"title"}},[n("div",[t._v(t._s(t.title))])]),n("div",{attrs:{id:"content"}},[t._t("default",[n("p",[t._v("welcome to use this popup component!")])])],2)])])},r=[],u={name:"Popup",props:{title:{type:String,default:"温馨提示"},isActive:{type:Boolean,default:!1}},data:function(){return{isOpen:this.isActive}},watch:{isActive:function(t){this.isOpen=t}},methods:{cancel:function(){this.isOpen=!1,this.$emit("stateChange",this.isOpen)}}},c=u,l=(n("f5c7"),n("2877")),p=Object(l["a"])(c,o,r,!1,null,"31274958",null),d=p.exports,f=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("button",{staticClass:"base",class:t.innerClass,style:{height:t.normalizedSize.H,width:t.normalizedSize.W},attrs:{type:t.type},on:{click:function(e){return t.$emit("click")},mouseover:t.overMouse,mouseout:t.outMouse}},[t._v("\n    "+t._s(t.text)+"\n")])},m=[],h={name:"Button",props:{text:{type:String,default:"btn"},styleClass:{type:String,default:"default"},type:{type:String,default:"button"},size:{type:Object,default:function(){return{H:30,W:60}}}},data:function(){return{innerClass:this.styleClass}},computed:{normalizedSize:function(){var t=Object.assign(this.size);return"number"==typeof t.H&&(t.H+="px"),"number"==typeof t.W&&(t.W+="px"),t}},methods:{overMouse:function(){this.innerClass+=" "+this.innerClass+"-active"},outMouse:function(){this.innerClass=this.styleClass}}},v=h,b=(n("58c1"),Object(l["a"])(v,f,m,!1,null,"872ea51c",null)),g=b.exports,y=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("input",{staticClass:"base",class:t.innerClass,style:{height:t.normalizedSize.H,width:t.normalizedSize.W},attrs:{placeholder:t.placeholder,type:t.type},on:{input:function(e){return t.$emit("input",e.target.value)},focus:t.onFocus,blur:t.onBlur}})},_=[],w={name:"Button",props:{value:String,placeholder:String,styleClass:{type:String,default:"default"},type:{type:String,default:"button"},size:{type:Object,default:function(){return{H:30,W:160}}}},data:function(){return{innerClass:this.styleClass}},computed:{normalizedSize:function(){var t=Object.assign(this.size);return"number"==typeof t.H&&(t.H+="px"),"number"==typeof t.W&&(t.W+="px"),t}},methods:{onFocus:function(){this.innerClass+=" "+this.innerClass+"-active"},onBlur:function(){this.innerClass=this.styleClass}}},x=w,C=(n("7dbc"),Object(l["a"])(x,y,_,!1,null,"6de17fe4",null)),S=C.exports,O=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("header",{staticClass:"header"},[t._t("default")],2)},H=[],W={name:"Header",props:{},computed:{},methods:{}},z=W,I=(n("599e"),Object(l["a"])(z,O,H,!1,null,"7547489e",null)),j=I.exports,k=function(){var t=this,e=t.$createElement,n=t._self._c||e;return n("div",{attrs:{id:"nav"}},t._l(t.dataTabs,function(e,i){return n("div",{key:i,staticClass:"tab",on:{click:t.switchTo}},[n("div",[t._v(t._s(e))])])}),0)},P=[],$={name:"Header",props:{tabs:{type:Array,required:!0,default:function(){return["置顶","全部"]}}},data:function(){return{dataTabs:this.tabs}},computed:{},methods:{switchTo:function(t){$emit("switchChange",t)}}},N=$,q=(n("3648"),Object(l["a"])(N,k,P,!1,null,"d053b0ba",null)),B=q.exports,E=function(){var t=this,e=t.$createElement,i=t._self._c||e;return i("div",{attrs:{id:"panel","data-key":"id"}},[i("div",{attrs:{id:"content"}},[i("div",{attrs:{id:"name"}},[i("strong",[t._v(t._s(t.name))])]),i("div",{attrs:{id:"time"}},[i("small",[t._v(t._s(t.time))])]),i("div",{attrs:{id:"question"}},[i("h2",[t._v(t._s(t.question))])])]),i("div",{attrs:{id:"func"}},[i("div",{staticClass:"funcItem",attrs:{id:"follow"}},[i("img",{attrs:{src:n("7f1f"),height:"20",width:"20"}}),t._v("\n            +"+t._s(t.followNum)+"\n        ")]),i("div",{staticClass:"funcItem",attrs:{id:"comment"}},[i("img",{attrs:{src:n("6ae1"),height:"20",width:"20"}}),t._v("\n            +"+t._s(t.commentNum)+"\n        ")])])])},M=[],T=(n("c5f6"),{name:"Header",props:{id:Number,name:String,time:String,question:String,followNum:Number,commentNum:Number},computed:{},methods:{}}),A=T,U=(n("bf8d"),Object(l["a"])(A,E,M,!1,null,"672649ba",null)),F=U.exports;function J(){var t=window.innerHeight,e=window.innerWidth;return"number"!=typeof t&&("CSS1Compat"==document.compatMode?(e=document.documentElement.clientWidth,t=document.documentElement.clientHeight):(e=document.body.clientWidth,t=document.body.clientHeight)),{pageHeight:t,pageWidth:e}}var V={name:"app",components:{Popup:d,Button:g,Input:S,Header:j,Nav:B,Panel:F},data:function(){return{H:0,W:0,account:"",password:"",popup:{title:"登录",isOpen:!0,isSignIn:!0},tabs:["置顶","前端","人工智能","全部"],questions:[{id:"01",name:"熊饲",time:"2019-07-5 12:57",question:"Vue-cli 3.x + axios 跨域方案踩坑指北"}]}},methods:{openSignInWindow:function(){this.popup={title:"登录",isOpen:!0,isSignIn:!0}},cannelPopup:function(t){this.popup.isOpen=t},openSignUpWindow:function(){this.popup={title:"注册",isOpen:!0,isSignIn:!1}},signIn:function(){},signUp:function(){},flashPanel:function(t){this.tabs[t]},search:function(t){}},created:function(){this.H=J().pageHeight}},D=V,G=(n("034f"),Object(l["a"])(D,s,a,!1,null,null,null)),K=G.exports,L=n("bc3a"),Q=n.n(L),R=n("a7fe"),X=n.n(R);i["a"].use(X.a,Q.a),i["a"].config.productionTip=!1;new i["a"]({render:function(t){return t(K)}}).$mount("#app")},"58c1":function(t,e,n){"use strict";var i=n("7b1b"),s=n.n(i);s.a},"599e":function(t,e,n){"use strict";var i=n("97d7"),s=n.n(i);s.a},"5b40":function(t,e,n){},"64a9":function(t,e,n){},"6ae1":function(t,e,n){t.exports=n.p+"static/img/comment.844e2d36.png"},"76b1":function(t,e,n){},"7b1b":function(t,e,n){},"7b6f":function(t,e,n){},"7dbc":function(t,e,n){"use strict";var i=n("7b6f"),s=n.n(i);s.a},"7f1f":function(t,e,n){t.exports=n.p+"static/img/icon_follow.9b6012bf.png"},"97d7":function(t,e,n){},b640:function(t,e,n){t.exports=n.p+"static/img/logo.cda7e417.jpg"},bf8d:function(t,e,n){"use strict";var i=n("76b1"),s=n.n(i);s.a},d0c7:function(t,e,n){},f5c7:function(t,e,n){"use strict";var i=n("d0c7"),s=n.n(i);s.a}});
//# sourceMappingURL=index.0f6f7f8d.js.map