<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/vue.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/axios-0.18.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
<style>
	.show{
		display: black
	}
	.hidden{
		display: none
	}
</style>
</head>
<body>
<a href="${pageContext.request.contextPath}/toAdd.do">添加</a>
<div id="did">
<input type="button" @click="del" value="删除">
<table id="tid" border="1" cellspacing="0" :class="flag1">
	<tr>
		<td>选择</td>
		<td>编号</td>
		<td>姓名</td>
		<td>年龄</td>
		<td>性别</td>
		<td>生日</td>
		<td>图片</td>
		<td>部门</td>
		<td>操作</td>
	</tr>
	<tr v-for="(student,index) in slist">
		<td>
			<input type="checkbox" v-model="ids" :value="student.sid">
		</td>
		<td v-text="student.sid"></td>
		<td v-text="student.sname"></td>
		<td v-text="student.age"></td>
		<td v-text="student.sex"></td>
		<td v-text="format(student.birthday)"></td>
		<td>照片</td>
		<td v-text="student.dept.dname"></td>
		<td><input type="button" @click="toUpdate(index)" value="修改"></td>
	</tr>
</table>
<!-- 当前页:{{apge.pageNum}}/总页数{{page.pages}}&nbsp;&nbsp;&nbsp;总条数:{{page.total}}<br>
<input type="button" value="首页" @click="jump(page.firstPage)">
<input type="button" value="上一页" @click="jump(page.prePage)">
<input type="button" value="下一页" @click="jump(page.nextPage)">
<input type="button" value="尾页" @click="jump(page.lastPage)"> -->
	<form action="" id="fid" :class="flag">
	<input type="hidden" v-model="student.sid" ><br/>
	姓名:<input type="text" v-model="student.sname"><br>
	性别:<input type="radio" value="男" v-model="student.sex">男
		<input type="radio" value="女" v-model="student.sex">女<br>
	图片:<input type="file"><br>
	年龄:<input type="text" v-model="student.age"><br>
	生日:<input type="date" v-model="student.birthday"><br>
	班级:<select v-model="student.depid">
		<option v-for="dept in clist" :value="dept.depid" v-text="dept.dname"></option>
	</select><br>
	<input type="button" @click="update" value="修改"></form>
</div>
<script type="text/javascript">
var table = new Vue({
	el:"#did",
	data:{
		slist:[],
		student:{},
		clist:[],
		flag:'hidden',
		flag1:'show',
		ids:[]
	},
	created(){
		axios.post("${pageContext.request.contextPath}/findAll.do?pageNum=1").then(function(res){
			table.slist = res.data.list;
		})
		axios.post("${pageContext.request.contextPath}/findDept.do").then(function(res){
			table.clist = res.data;
		})
	},
	methods:{
		format(datetime){
			var year = new Date(datetime).getFullYear();
			var month1 = new Date(datetime).getMonth()+1;
			var month = month1<10?"0"+month1:month1;
			var date = new Date(datetime).getDate()<10?"0"+new Date(datetime).getDate():new Date(datetime).getDate();
			return year+"-"+month+"-"+date
		},
		toUpdate(i){
			this.student=this.slist[i];
			this.student.birthday=this.format(this.student.birthday);
			this.flag="show";
			this.flag1="hidden";
		},
		update(){
			axios.post("${pageContext.request.contextPath}/updateStudent.do",table.student).then(function(res){
				if (res.data>0) {
					this.flag="hidden";
					this.flag1="show";
					location.href="${pageContext.request.contextPath}/toShow.do"
				}
			})
		},
		del(){
			axios.post("${pageContext.request.contextPath}/deleteStudent.do",this.ids).then(function(res){
				if (res.data>0) {
					location.href="${pageContext.request.contextPath}/toShow.do"
				}
			})
		}
		/* jump(){
			axios.post("${pageContext.request.contextPath}/findAll.do?pageNum="+pageNum).then(function(res){
				table.slist = res.data.list;
				table.page = res.data;
			})
		} */
	}
})
</script>
</body>
</html>