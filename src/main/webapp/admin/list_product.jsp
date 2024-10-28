<%-- 
    Document   : list_product
    Created on : Oct 22, 2024, 2:11:45 PM
    Author     : ADMIN
--%>

<%@page import="model.Hoa"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="../shared/header.jsp" />

<jsp:include page="../shared/nav.jsp" />

<% if (request.getAttribute("success") != null) { %>
<script>
    Swal.fire({
        title: "Good job!",
        text: "Thao tác thành công",
        icon: "success"
    });
</script>
<%
    }
%>

<div class="container">
    <h2> Danh sách sản phẩm</h2>
    <div class="mb-2 text-end">
        <a href="ManagerProduct?action=ADD" class="btn btn-success"> <i class="bi bi-plus-circle"></i> Thêm mới</a>
    </div>

    <table class="table table-bordered table-striped">
        <tr>
            <th>Tên hoa</th>
            <th>Giá</th>
            <th>Hình ảnh</th>
            <th>Loại</th>
            <th>Action</th>
        </tr>  
        <%
            DecimalFormat fmt = new DecimalFormat("#,##0");
            ArrayList<Hoa> dsHoa = (ArrayList<Hoa>) request.getAttribute("dsHoa");
            for (Hoa x : dsHoa) {
        %>
        <tr>
            <td><%=x.getTenhoa()%></td>
            <td><%=x.getGia()%></td>
            <td> <img src="assets/images/products/<%=x.getHinh()%>" style="width: 100px">  </td>
            <td><%=x.getMaloai()%></td>
            <td>
                <a href="ManagerProduct?action=EDIT&mahoa=<%=x.getMahoa()%>" class="btn btn-secondary"> <i class="bi bi-pencil-square"></i> Sửa</a>
                <a href="ManagerProduct?action=DELETE&mahoa=<%=x.getMahoa()%>" class="btn btn-danger"
                   onclick="return confirm('Ban co dong y xoa khong')"
                   > <i class="bi bi-trash"></i> Xoá</a>
            </td>
        </tr>    
        <%
            }
        %>
    </table>  
    <ul class="pagination justify-content-center">
    <%
        //Lấy tổng số trang từ servlet
        int sumOfPage = (int) request.getAttribute("sumOfPage");
        int pageIndex = (int) request.getAttribute("pageIndex");
        for (int i = 1; i <= sumOfPage; i++) {
    %>
    <li class="page-item"><a class="page-link" href="ManagerProduct?page=<%=i %>"><%=i %></a></li>
       <%
           }
       %>
</ul>
</div>
       <jsp:include page="../shared/footer.jsp" /> 