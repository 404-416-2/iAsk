<template>
  <div class="popup">
    <div id="panel">
      <div id="title">
        <div>{{title}}</div>
      </div>
      <div id="content">
        <slot>
          <p>welcome to use this popup component!</p>
        </slot>
      </div>
    </div>
  </div>
</template>

<script>

export default {
  name: 'Popup',
  props: {
    title: {
      type : String,
      default : '温馨提示'
    }
  },
  methods : {

  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
.popup{
  position: fixed;
  top : 0px;
  left: 0px;
  height : 100%;
  width : 100%;
  background : rgba(49,37,36, 0.9);
  z-index: 1000;
}
#panel{
  position: absolute;
  top : 50%;
  left: 50%;
  height : 400px;
  width : 600px;
  margin-left : -300px;
  margin-top: -200px;
  z-index: 10001;
}
#panel > #title{
  display: flex;
  align-items: center;
  justify-content: center;
  height : 20%;
  width : 100%;
  font-size: 20px;
  border-top-left-radius: 8px;
  border-top-right-radius: 8px;
  background: #F8F8F8;
}
#panel > #content{
  height : 80%;
  width : 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  border-bottom-left-radius: 8px;
  border-bottom-right-radius: 8px;
  background: white;
}
</style>
