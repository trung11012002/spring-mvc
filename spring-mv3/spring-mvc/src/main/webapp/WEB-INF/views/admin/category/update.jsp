<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="newURL" value="/quan-tri/bai-viet/danh-sach" />
<c:url var="editNewURL" value="/quan-tri/bai-viet/chinh-sua" />
<c:url var="newAPI" value="/api/new" />
<c:url var="userNew" value="/quan-tri/nguoi-dung/them-moi" />

<html>
<head>
<title>Chỉnh sửa bài viết</title>
</head>
<body>
	<div class="main-content">
		<div class="main-content-inner">
			<div class="breadcrumbs" id="breadcrumbs">
				<script type="text/javascript">
					try {
						ace.settings.check('breadcrumbs', 'fixed')
					} catch (e) {
					}
				</script>

				<ul class="breadcrumb">
					<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Home</a>
					</li>

					<li><a href="#">Forms</a></li>
					<li class="active">Form Elements</li>
				</ul>
				<!-- /.breadcrumb -->
			</div>
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
						<c:if test="${not empty message}">
							<div class="alert alert-${alert}">${message}</div>
						</c:if>
						<form:form action="${userNew}" method="POST"
							class="form-horizontal" role="form" id="formSubmit"
							modelAttribute="model">

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right"
									for="form-field-1">Tài khoản</label>
								<div class="col-sm-9">
									<form:input path="userName" id="userName"
										cssClass="col-xs-10 col-sm-5" readonly="true" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right"
									for="form-field-1">Mật khẩu</label>
								<div class="col-sm-9">
									<form:input path="password" id="password"
										cssClass="col-xs-10 col-sm-5" readonly="true" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right"
									for="form-field-1">Họ và tên</label>
								<div class="col-sm-9">
									<form:input path="fullname" id="fullname"
										cssClass="col-xs-10 col-sm-5" />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right"
									for="form-field-1">Quyền</label>
								<div class="col-sm-9">
									<c:if test="${empty model.id}">
										<c:forEach var="o" items="${roles}">
											<label class="checkbox-inline"> <input
												type="checkbox" name="${o.code}" value="${o.code}"
												id="checkRoleAdmin" /> ${o.code}
											</label>
										</c:forEach>
									</c:if>
									<c:if test="${not empty model.id}">
										<c:if test="${not empty ADMIN}">
											<label class="checkbox-inline"> <input
												type="checkbox" name="ADMIN" value="ADMIN"
												id="checkRoleAdmin" checked="true" /> ADMIN
											</label>
										</c:if>
										<c:if test="${empty ADMIN}">
											<label class="checkbox-inline"> <input
												type="checkbox" name="ADMIN" value="ADMIN"
												id="checkRoleAdmin" /> ADMIN
											</label>
										</c:if>
										<c:if test="${not empty USER}">
											<label class="checkbox-inline"> <input
												type="checkbox" name="USER" value="USER" id="checkRoleUser"
												checked="true" /> USER
											</label>
										</c:if>
										<c:if test="${empty USER}">
											<label class="checkbox-inline"> <input
												type="checkbox" name="USER" value="USER" id="checkRoleUser" />
												USER
											</label>
										</c:if>
										<c:if test="${not empty EDITOR}">
											<label class="checkbox-inline"> <input
												type="checkbox" name="EDITOR" value="EDITOR"
												id="checkRoleUser" checked="true" /> EDITOR
											</label>
										</c:if>
										<c:if test="${empty EDITOR}">
											<label class="checkbox-inline"> <input
												type="checkbox" name="EDITOR" value="EDITOR"
												id="checkRoleUser" /> EDITOR
											</label>
										</c:if>
										<c:if test="${not empty WRITER}">
											<label class="checkbox-inline"> <input
												type="checkbox" name="WRITER" value="WRITER"
												id="checkRoleUser" checked="true" /> WRITER
											</label>
										</c:if>
										<c:if test="${empty WRITER}">
											<label class="checkbox-inline"> <input
												type="checkbox" name="WRITER" value="WRITER"
												id="checkRoleUser" /> WRITER
											</label>
										</c:if>
									</c:if>
								</div>
							</div>

							<form:hidden path="id" id="newId" />
							<div class="clearfix form-actions">
								<div class="col-md-offset-3 col-md-9">
									<c:if test="${not empty model.id}">
										<button class="btn btn-info" id="btnUpdate" type="button">
											<i class="ace-icon fa fa-check bigger-110"></i> Cập nhật
											người dùng
										</button>
									</c:if>
									<c:if test="${empty model.id}">
										<button class="btn btn-info" type="submit" id="btnAdd">
											<i class="ace-icon fa fa-check bigger-110"></i> Thêm người
											dùng
										</button>
									</c:if>
									&nbsp; &nbsp; &nbsp;
									<button class="btn" type="reset">
										<i class="ace-icon fa fa-undo bigger-110"></i> Hủy
									</button>
								</div>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('#btnUpdate').click(function(e) {
			e.preventDefault();
			var data = {};
			var formData = $('#formSubmit').serializeArray();
			console.log(formData);
			$.each(formData, function(i, v) {
				data["" + v.name + ""] = v.value;
			});
			var check = 1;
			// Kiểm tra xem dữ liệu có trường nào rỗng không
			for ( var key in data) {
				if (key != 'id') {
					if (data.hasOwnProperty(key) && data[key] === "") {

						check = 0;
						break; // Dừng việc thêm nếu có trường rỗng
					}
				}
			}

			if (check == 1) {
				$('#formSubmit').submit();
			} else {
				Swal.fire({
					icon : 'error',
					title : 'Lỗi',
					text : 'Bạn phải điền đầy đủ thông tin!'
				});
			}
		});
	</script>
</body>
</html>
