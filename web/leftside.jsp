<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
  <aside class="app-sidebar">
    <div class="app-sidebar__user"><img class="app-sidebar__user-avatar" src="${sessionScope.account.image}" width="50px"
        alt="User Image">
      <div>
          <p class="app-sidebar__user-name"><b>${sessionScope.account.fullName}</b></p>
        <p class="app-sidebar__user-designation">Welcom back</p>
      </div>
    </div>
    <hr>
    <ul class="app-menu">

      <li><a class="app-menu__item active" href="admin"><i class='app-menu__icon bx bx-tachometer'></i><span
            class="app-menu__label">Dash board</span></a></li>
    
      <li><a class="app-menu__item" href="managerUser"><i class='app-menu__icon bx bx-user-voice'></i><span
            class="app-menu__label">Manage User</span></a></li>
      <li><a class="app-menu__item" href="manager"><i
            class='app-menu__icon bx bx-purchase-tag-alt'></i><span class="app-menu__label">Manage Product</span></a>
      </li>
      <li><a class="app-menu__item" href="managerOrder"><i class='app-menu__icon bx bx-task'></i><span
            class="app-menu__label">Manage Orders</span></a></li>
    
     
      <li><a class="app-menu__item" href="quan-ly-bao-cao.html"><i
            class='app-menu__icon bx bx-pie-chart-alt-2'></i><span class="app-menu__label">B�o c�o doanh thu</span></a>
      </li>
      
      
    </ul>
  </aside>