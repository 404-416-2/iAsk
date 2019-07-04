<template>
    <input class="base" 
            :type="type" 
            :class="styleClass" 
            :style="{height:normalizedSize.H,width:normalizedSize.W}"
            @input="$emit('input',$event.target.value)"
    />
</template>
<script>
export default {
    name : "Button",
    props : {
        value : String,
        styleClass : {
            type : String,
            default : 'default'
        },
        type : {
            type : String,
            default : 'button'
        },
        size : {
            type : Object,
            default : ()=>{
                return {
                    H : 30,
                    W : 160
                }
            }
        }
    },
    computed :{
        normalizedSize(){
            let size = Object.assign(this.size);
            if(typeof size.H == 'number')size.H += 'px';
            if(typeof size.W == 'number')size.W += 'px';
            return size;
        }
    },
    methods : {

    }
}
</script>
<style scoped>
.base{
    /* 去掉默认样式 */
    box-shadow: none;
    text-shadow: none;
    border : none;
    outline: none;
    text-decoration: none;
    background : white;
    /* 基础样式 */
    border-radius: 5px;
    color: white
}
.default {
    border : 1px solid black;
    color : black;
}
.primary{
    border : 1px solid #155A90;
}
.success{
    border : 1px solid #588E0D;
}
.warning{
    border : 1px solid #D6640F;
}
.error{
    border : 1px solid #9D0812;
}
</style>
