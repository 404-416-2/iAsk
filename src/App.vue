<template>
  <div id="app" :style="{height:H+'px',width:W+'px'}">
    <div>Hello World</div>
    <Popup>
        <form>
          <div id="form">
            <div>
                <label>Email</label>
            </div>
            <div>
              <Input 
                  type="email" 
                  v-model="account"
                  :size = "{
                     H : 35,
                     W : 200
                  }" 
              />
            </div>
            <div>
              <label>Password</label>
            </div>
            <div>
              <Input 
                  type="text" 
                  v-model="password"
                  :size = "{
                     H : 35,
                     W : 200
                  }" 
              />
            </div>
            <div id="item">
              <Button  
                  @click="signIn"
                  :size="{
                       H : 50,
                       W : 300
                    }"
                  text="Submit"
              ></Button>
            </div>
          </div>
        </form>
    </Popup>
  </div>
</template>

<script>
import Popup from './components/Popup.vue'
import Button from './components/Button.vue';
import Input from './components/Input.vue';
import {transformRequest} from './common/function.js';

export default {
  name: 'app',
  components: {
    Popup,
    Button,
    Input
  },
  data : function(){
    return {
       msg : 'Click Me',
       H : 0,
       W : 0,
       account : '',
       password : '',
    }
  },
  methods : {
    signIn(){
       var _this = this;
      //  this.axios('/api/login').then(res=>{
      //    console.log(res);
      //  })
       this.axios({
            url: '/api/login',
            method: 'post',
            data: {
              account: _this.account,
              password: _this.password
            },
            transformRequest: [function (data) {
              // Do whatever you want to transform the data
              return transformRequest(data);
            }],
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded'
            }
       }).then(res=>{
         console.log(res);
       })
    }
  },
  created : function(){
    //获取视口大小
     let pageHeight = window.innerHeight,
         pageWidth  = window.innerWidth;
     if(typeof pageHeight != 'number'){
       if(document.compatMode == 'CSS1Compat'){
         pageWidth = document.documentElement.clientWidth;
         pageHeight = document.documentElement.clientHeight;
       }else{
         pageWidth = document.body.clientWidth;
         pageHeight = document.body.clientHeight;
       }
     }
     this.H = pageHeight;
     this.W = pageWidth;
  }
}
</script>

<style>
body{
  height : 100%;
  width : 100%;
}
#app {
  height: 100%;
  width : 100%;
}
#form{
  display: grid;
  grid-template-rows: 100px 100px 50px ;
  grid-template-columns: 100px 200px;
  grid-template-areas: 'a b'
                       'c d'
                       'e e' ;
  justify-items: start ;
  align-items: center;
  align-content: space-around
}
#form > #item{
  grid-area: e;
  justify-self: stretch;
  align-self: stretch;
}
</style>
