import { Calendar } from '@fullcalendar/core';
import dayGridPlugin from '@fullcalendar/daygrid';

document.addEventListener('DOMContentLoaded', () => {
  const calendarEl = document.getElementById('calendar');

  if (calendarEl) {
    const calendar = new Calendar(calendarEl, {
      plugins: [dayGridPlugin],
      initialView: 'dayGridMonth',
      events: '/events.json' // Railsのエンドポイントからイベントを取得
    });

    calendar.render();
  }
});