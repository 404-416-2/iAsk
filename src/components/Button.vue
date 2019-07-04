<template>
    <button class="base" 
            :type="type" 
            :class="styleClass" 
            :style="{height:normalizedSize.H,width:normalizedSize.W}"
            @click="$emit('click')"
            >
        {{text}}
    </button>
</template>
<script>
export default {
    name : "Button",
    props : {
        text : {
            type : String,
            default : 'btn'
        },
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
                    W : 60
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
    background: white;
    color : black;
}
.primary{
    border : 1px solid #155A90;
    background: #154398;
}
.success{
    border : 1px solid #588E0D;
    background: #4B7E08;
}
.warning{
    border : 1px solid #D6640F;
    background: #F07115;
}
.error{
    border : 1px solid #9D0812;
    background: #CB0A17;
}
</style>
