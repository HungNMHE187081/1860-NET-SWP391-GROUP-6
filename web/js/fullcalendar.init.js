document.addEventListener('DOMContentLoaded', function () {
    var Calendar = FullCalendar.Calendar;
    var Draggable = FullCalendar.Draggable;

    var containerEl = document.getElementById('external-events');
    var calendarEl = document.getElementById('calendar');
    var checkbox = document.getElementById('drop-remove');

    // initialize the external events
    // -----------------------------------------------------------------

    new Draggable(containerEl, {
        itemSelector: '.fc-event',
        eventData: function (eventEl) {
            return {
                title: eventEl.innerText
            };
        }
    });

    // initialize the calendar
    // -----------------------------------------------------------------

    var calendar = new Calendar(calendarEl, {
        locale: 'vi', // Set the locale to Vietnamese
        headerToolbar: {
            left: 'prev,next today addEventButton',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay',
        },
        businessHours: true, // display business hours
        editable: true,
        events: [
            {
                title: 'Ăn Trưa Công Việc',
                start: '2021-01-03T13:00:00',
                constraint: 'businessHours'
            },
            {
                title: 'Cuộc Họp',
                start: '2021-01-13T11:00:00',
                constraint: 'availableForMeeting', // defined below
                color: '#53c797'
            },
            {
                title: 'Hội Nghị',
                start: '2021-01-18',
                end: '2021-01-20'
            },
            {
                title: 'Tiệc Tùng',
                start: '2021-01-29T20:00:00'
            },
        ],

        customButtons: {
            addEventButton: {
                text: 'Thêm Sự Kiện',
                click: function () {
                    var dateStr = prompt('Nhập ngày theo định dạng YYYY-MM-DD');
                    var date = new Date(dateStr + 'T00:00:00'); // will be in local time

                    if (!isNaN(date.valueOf())) { // valid?
                        calendar.addEvent({
                            title: 'Sự kiện động',
                            start: date,
                            allDay: true
                        });
                        alert('Tuyệt vời. Bây giờ, hãy cập nhật cơ sở dữ liệu của bạn...');
                    } else {
                        alert('Ngày không hợp lệ.');
                    }
                }
            }
        },
        
        editable: true,
        droppable: true, // this allows things to be dropped onto the calendar
        drop: function (info) {
            // is the "remove after drop" checkbox checked?
            if (checkbox.checked) {
                // if so, remove the element from the "Draggable Events" list
                info.draggedEl.parentNode.removeChild(info.draggedEl);
            }
        }
    });

    calendar.render();
});