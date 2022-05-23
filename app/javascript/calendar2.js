import { Calendar} from '@fullcalendar/core';
import interactionPlugin from '@fullcalendar/interaction';
import monthGridPlugin from '@fullcalendar/daygrid';
import googleCalendarApi from '@fullcalendar/google-calendar';

document.addEventListener('turbolinks:load', function() {
  const calendarEl = document.getElementById('calendar2');
  if (!calendarEl) return;

  const calendar2 = new Calendar(calendarEl, {
    plugins: [ monthGridPlugin, interactionPlugin, googleCalendarApi ],

    events: '/member/schedules.json',
    locale: 'ja',
    timeZone: 'Asia/Tokyo',
    firstDay: 1,
    headerToolbar: {
      start: '',
      center: 'title',
      end: 'today prev,next'
    },
    expandRows: true,
    stickyHeaderDates: true,
    buttonText: {
       today: '今日'
    },
    allDayText: '終日',


    dateClick: function (info) {
      const year  = info.date.getFullYear();
      const month = (info.date.getMonth() + 1);
      const day   = info.date.getDate();

      $.ajax({
        type: 'GET',
        url:  '/member/schedules/new',
        data: { group_id: $('#group-id').text(), id: $('#member-id').text() }
      }).done(function (res) {
        $('.schedule-modal__body').html(res);
        $('#schedule_date_1i').val(year);
        $('#schedule_date_2i').val(month);
        $('#schedule_date_3i').val(day);

        $('#schedule-modal').fadeIn();
        $('.schedule-modal-close').on('click', function(){
          $('#schedule-modal').fadeOut();
        });
      }).fail(function (result) {
        alert("failed");
      });
    },

    eventClick: function(info){
    },
    eventClassNames: function(arg){
    }



  });
  calendar2.render();

  $(".error").click(function (){
    calendar2.refeychEvents();
  });

});
