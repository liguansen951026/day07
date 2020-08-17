<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/vue.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/axios-0.18.0.js"></script>
</head>
<body>
<form action="" id="fid">
	姓名:<input type="text" v-model="student.sname"><br>
	性别:<input type="radio" value="男" v-model="student.sex">男
		<input type="radio" value="女" v-model="student.sex">女<br>
	图片:<input type="file"><br>
	年龄:<input type="text" v-model="student.age"><br>
	生日:<input type="date" v-model="student.birthday"><br>
	班级:<select v-model="student.depid">
		<option v-for="dept in clist" :value="dept.depid" v-text="dept.dname"></option>
	</select><br>
<!-- 	<button @click="add">添加</button> -->
	<input type="button" @click="add" value="添加"></form>
<script type="text/javascript">
	var form = new Vue({
		el:"#fid",
		data:{
			clist:[],
			student:{}
		},
		created(){
			axios.post("${pageContext.request.contextPath}/findDept.do").then(function(res) {
				form.clist = res.data;
			})
		},
		methods:{
			add(){
				axios.post("${pageContext.request.contextPath}/addStudent.do",form.student).then(function(res) {
					if(res.data>0){
						location.href="${pageContext.request.contextPath}/toShow.do"
					};
				})
			}
		}
	});
</script>
</body>
</html>