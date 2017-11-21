select 
	Gender,
	cast(Age as integer) Age,
	date(ScheduledDay) Scheduled_Day,
	date(AppointmentDay) Appointment_Day,
	strftime('%j', AppointmentDay) - strftime('%j', ScheduledDay) Day_Difference,
	(case cast(strftime('%w', AppointmentDay) as integer)
		when 0 then 'Sunday'
	    when 1 then 'Monday'
	    when 2 then 'Tuesday'
	    when 3 then 'Wednesday'
	    when 4 then 'Thursday'
	    when 5 then 'Friday'
	    else 'Saturday' end) Day_of_Week,
	(case cast(Scholarship as integer)
		when 1 then 'Yes' else 'No' end) Scholarship,
	(case cast(SMS_Received as integer)
		when 1 then 'Yes' else 'No' end) SMS_Received,
	(case cast(Hipertension + Diabetes + Alcoholism + Handcap as integer)
		when 0 then 'No' else 'Yes' end) With_Condition,
	No_Show
from
	RFC
where Age > 0

