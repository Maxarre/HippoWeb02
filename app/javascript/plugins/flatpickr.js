import flatpickr from "flatpickr"
import "flatpickr/dist/themes/material_blue.css" // Note this is important!

flatpickr(".datepicker", {
  altInput: true,
  allowInput: true,
  altFormat: "d F Y",
})

flatpickr(".meetpicker", {
  altInput: true,
  allowInput: true,
  altFormat: "d F Y",
  time_24hr: true,
})


flatpickr(".timepicker",{
    enableTime: true,
    noCalendar: true,
    dateFormat: "H"
})
