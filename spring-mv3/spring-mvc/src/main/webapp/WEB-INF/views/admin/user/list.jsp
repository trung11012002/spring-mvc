<%@include file="/common/taglib.jsp"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:url var="newAPI" value="/api/new" />
<c:url var="userURL" value="/quan-tri/nguoi-dung/danh-sach" />
<c:url var="deleteUserURL" value="/quan-tri/nguoi-dung/xoa" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Danh sách người dùng</title>

</head>

<body>
	<div class="main-content">
		<form action="<c:url value='/quan-tri/nguoi-dung/danh-sach'/>"
			id="formSubmit" method="get">
			<div class="main-content-inner">
				<div class="breadcrumbs ace-save-state" id="breadcrumbs">
					<ul class="breadcrumb">
						<li><i class="ace-icon fa fa-home home-icon"></i> <a href="#">Trang
								chủ</a></li>
					</ul>
					<!-- /.breadcrumb -->
				</div>
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<c:if test="${not empty message}">
								<div class="alert alert-${alert}">${message}</div>
							</c:if>
							<div class="widget-box table-filter">
								<div class="table-btn-controls">
									<div class="pull-right tableTools-container">
										<div class="dt-buttons btn-overlap btn-group">
											<c:url var="createUserURL"
												value="/quan-tri/nguoi-dung/them-moi" />
											<a flag="info"
												class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
												data-toggle="tooltip" title='Thêm người dùng'
												href='${createUserURL}'> <span> <i
													class="fa fa-plus-circle bigger-110 purple"></i>
											</span>
											</a>
											<button id="btnDelete" type="button"
												onclick="warningBeforeDelete()"
												class="dt-button buttons-html5 btn btn-white btn-primary btn-bold"
												data-toggle="tooltip" title='Xóa bài viết'>
												<span> <i class="fa fa-trash-o bigger-110 pink"></i>
												</span>
											</button>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-12">
									<div class="table-responsive">
										<table class="table table-bordered">
											<thead>
												<tr>
													<th><input type="checkbox" id="checkAll"></th>
													<th>Tài khoản</th>
													<th>Mật khẩu</th>
													<th>Họ và tên</th>
													<th>Trạng thái</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="item" items="${model.listResult}">
													<tr>
														<td><input type="checkbox" id="checkbox_${item.id}"
															value="${item.id}"></td>
														<td>${item.userName}</td>
														<td>${item.password}</td>
														<td>${item.fullname}</td>
														<td>${item.status}</td>

														<td><c:url var="updateUserURL"
																value="/quan-tri/nguoi-dung/chinh-sua">
																<c:param name="id" value="${item.id}"></c:param>
															</c:url> <a class="btn btn-sm btn-primary btn-edit"
															data-toggle="tooltip" title="Cập nhật bài viết"
															href='${updateUserURL}'><i
																class="fa fa-pencil-square-o" aria-hidden="true"></i> </a></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
										<ul class="pagination" id="pagination"></ul>
										<input type="hidden" value="" id="page" name="page" /> <input
											type="hidden" value="" id="limit" name="limit" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<!-- /.main-content -->
	<script>
	function warningBeforeDelete() {
	    Swal.fire({
	        title: "Xác nhận xóa",
	        text: "Bạn có chắc chắn muốn xóa hay không",
	        icon: "warning",
	        showCancelButton: true,
	        confirmButtonClass: "btn-success",
	        cancelButtonClass: "btn-danger",
	        confirmButtonText: "Xác nhận",
	        cancelButtonText: "Hủy bỏ",
	    }).then((result) => {
	        if (result.isConfirmed) {
	           var ids = $('tbody input[type=checkbox]:checked').map(function () {
	                return $(this).val();
	            }).get();
	           	if(ids.length > 0){
	           		deleteNew(ids);
	           	}else{
	           	 Swal.fire({
	                    icon: 'error',
	                    title: 'Lỗi',
	                    text: 'Bạn chưa chọn mục để xóa!'
	                });
	           	}
	            
	        }
	    }); 			
	}

	function deleteNew(data) {
	    // Chuyển đổi mảng số nguyên thành mảng Long
	    /* var longData = data.map(function(item) {
	        return parseInt(item, 10); // Chuyển đổi từ string sang số nguyên
	    });
 */
	    $.ajax({
	        url: '${deleteUserURL}',
	        type: 'POST',
	        contentType: 'application/json',
	        data: JSON.stringify(data), // Truyền dữ liệu dưới dạng JSON với key là "userIds"
	        success: function (result) {
	            window.location.href = "${userURL}?page=1&limit=2&message=delete_success";
 	        },
	        error: function (error) {
            window.location.href = "${userURL}?page=1&limit=2&message=delete_success";
         }
	    });
	}

		var totalPages = ${model.totalPage};
		var currentPage = ${model.page};
		$(function () {
	        window.pagObj = $('#pagination').twbsPagination({
	            totalPages: totalPages,
	            visiblePages: 10,
	            startPage: currentPage,
	            onPageClick: function (event, page) {
	            	if (currentPage != page) {
	            		$('#limit').val(2);
						$('#page').val(page);
						$('#formSubmit').submit();
					}
	            }
	        });
	    });
		
	</script>
</body>

</html>