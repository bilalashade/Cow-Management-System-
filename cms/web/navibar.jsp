<%
    String group = "";

    if (((String) session.getAttribute("group")) != null) {
        group = (String) session.getAttribute("group");
    }
%>

<div id="topnav">
    <div class="dropdown">
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <br></br>
        </ul>
    </div>

    <div class="dropdown">
        <ul>
            <li><a href="menuCow.jsp">Cow</a></li>
            <br></br>
            <div class="dropdown-content">
                <a href=addCow.jsp>Add Cow</a>
                <a href=manageCow.jsp>Manage Cow</a>
            </div>
        </ul>
    </div>

    <div class="dropdown">
        <ul>
            <li><a href="menuBarn.jsp">Barn</a></li>
            <br></br>
            <div class="dropdown-content">
                <a href=addBarn.jsp>Add Barn</a>
                <a href=barnList.jsp>Barn List</a>
                <a href=manageBarn.jsp>Manage Barn</a>
            </div>
        </ul>
    </div>

    <div class="dropdown">
        <ul>
            <li><a href="menuFood.jsp">Food</a></li>
            <br></br>
            <div class="dropdown-content">
                <a href=addFood.jsp>Add Food</a>
                <a href=manageFood.jsp>Manage Food</a>
                <a href=addFeed.jsp>Add Feeding</a>
                <a href=manageFeed.jsp>Manage Feeding</a>
            </div>
        </ul>
    </div>

    <div class="dropdown">
        <ul>
            <li><a href="menuHealthcare.jsp">Healthcare</a></li>
            <br></br>
            <div class="dropdown-content">
                <a href=addCheckup.jsp>Add Checkup</a>
                <a href=manageCheckup.jsp>Manage Checkup</a>
                <a href=manageTreatment.jsp>Process Treatment</a>
                <a href=managePastTreatment.jsp>Manage Treatment</a>
            </div>
        </ul>
    </div>

    <div class="dropdown">
        <ul>
            <li><a href="menuSale.jsp">Sales</a></li>
            <br></br>
            <div class="dropdown-content">
                <a href="addSale.jsp">Add Sale</a>
                <a href="manageSale.jsp">Manage Sale</a>
            </div>
        </ul>
    </div>

    <%
        if (group.equals("staff")) {
    %>

    <div class="dropdown">
        <ul>
            <li><a href="menuUser.jsp">Profile</a></li>
            <br></br>
            <div class="dropdown-content">
                <a href=profile.jsp>My Profile</a>
                <a href=changePassword.jsp>Change Password</a>
                <a href=logout.jsp>Logout</a>
            </div>
        </ul>
    </div>
    <%} else if (group.equals("admin")) {
    %>

    <div class="dropdown">
        <ul>
            <li><a href="menuStaff.jsp">Staff</a></li>
            <br></br>
            <div class="dropdown-content">
                <a href=addStaff.jsp>Add Staff</a>
                <a href=manageStaff.jsp>Manage Staff</a>
                <a href=logout.jsp>Logout</a>
            </div>
        </ul>
    </div>
    <%
    } else if (group.equals("")) {
    %>

    <div class="dropdown">
        <ul>
            <li><a href="login.jsp">Login</a></li>
            <br></br>
        </ul>
    </div>
    <%
        }
    %>


</div>