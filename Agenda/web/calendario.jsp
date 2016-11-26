<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
    <link rel="stylesheet" href="recursos/estiloscalendario.css"/>
    <link rel="stylesheet" href="recursos/fonts.css"/>
    <link rel='stylesheet' type='text/css' href='recursos/jquery-weekcalendar-1.2.2/calendar/reset.css' />
    <link rel='stylesheet' type='text/css' href='recursos/jquery-weekcalendar-1.2.2/calendarweb1.css' />
    <link rel='stylesheet' type='text/css' href='recursos/jquery-weekcalendar-1.2.2/jquery.weekcalendar.css' />
    <link rel='stylesheet' type='text/css' href='recursos/jquery-weekcalendar-1.2.2/calendar/demo.css' />
    <title>Calendario</title>
    <script type='text/javascript' src='recursos/jquery-weekcalendar-1.2.2/calendarweb2.js'></script>
    <script type='text/javascript' src='recursos/jquery-weekcalendar-1.2.2/calendarweb3.js'></script>
    <script type='text/javascript' src='recursos/jquery-weekcalendar-1.2.2/jquery.weekcalendar.js'></script>
    <script type='text/javascript' src='recursos/jquery-weekcalendar-1.2.2/calendar/demo.js'></script>
</head>
<body> 
    <!-- Barra de navegacion -->
    	<header>
            <nav>
                <ul>
                    <li><a href="inicio.jsp"><span class="primero"><i class="icon icon-home"></i></span>Inicio</a></li>
                    <li><a href="proyectos.jsp"><span class="segundo"><i class="icon icon-pencil"></i></span>Proyectos</a></li>
                    <li><a href="#"><span class="tercero"><i class="icon icon-file-text"></i></span>Calendario</a></li>
                    <li><a href="contactos.jsp"><span class="cuarto"><i class="icon icon-address-book"></i></span>Contactos</a></li>
                    <li><a href="perfil.jsp"><span class="quinto"><i class="icon icon-user-tie"></i></span>Perfil</a></li>
                    <li><a href="index.jsp"><span class="logo"><i class="icon icon-yelp"></i></span>.</a></li>
                </ul>
            </nav>
        </header>
    <!--Calendario-->
    <%
        String palabra="hola";
    %>
    
	<div id='calendar'></div>
	<div id="event_edit_container">
		<form action="crearpc" method="post">
			<input type="hidden" />
			<ul>
				<li>
					<span>Fecha: </span><span class="date_holder"></span>              
                                        
				</li>
				<li>
					<label for="start">Hora Inicio: </label><select name="start"><option value="">Selecciona Hora de Inicio</option></select>
				</li>
				<li>
					<label for="end">Hora Fin: </label><select name="end"><option value="">Selecciona Hora de Fin</option></select>
				</li>
				<li>
					<label for="title">Titulo: </label><input type="text" name="titulo" />
				</li>
				<li>
					<label for="body">Lugar: </label><textarea name="lugar"></textarea>
				</li>
                                <li>
					<label for="body">Detalles: </label><textarea name="detalles"></textarea>
                                        
				</li>
                                
			</ul>
                        
		</form>
	</div>
<script>
        $(document).ready(function() {

   
   var $calendar = $('#calendar');
   var id = 10;

   $calendar.weekCalendar({
      timeslotsPerHour : 4,
      allowCalEventOverlap : true,
      overlapEventsSeparate: true,
      firstDayOfWeek : 1,
      businessHours :{start: 5, end: 22, limitDisplay: true },
      daysToShow : 7,
      height : function($calendar) {
         return $(window).height() - $("h1").outerHeight() - 1;
      },
      eventRender : function(calEvent, $event) {
         if (calEvent.end.getTime() < new Date().getTime()) {
            $event.css("backgroundColor", "#000");
            $event.find(".wc-time").css({
               "backgroundColor" : "#999",
               "border" : "1px solid #888"
            });
         }
      },
      draggable : function(calEvent, $event) {
         return calEvent.readOnly != true;
      },
      resizable : function(calEvent, $event) {
         return calEvent.readOnly != true;
      },
      eventNew : function(calEvent, $event) {
         var $dialogContent = $("#event_edit_container");
         resetForm($dialogContent);
         var startField = $dialogContent.find("select[name='start']").val(calEvent.start);
         var endField = $dialogContent.find("select[name='end']").val(calEvent.end);
         var titleField = $dialogContent.find("input[name='title']");
         var bodyField = $dialogContent.find("textarea[name='body']");


         $dialogContent.dialog({
            modal: true,
            title: "New Calendar Event",
            close: function() {
               $dialogContent.dialog("destroy");
               $dialogContent.hide();
               $('#calendar').weekCalendar("removeUnsavedEvents");
            },
            buttons: {
               save : function() {
                  calEvent.id = id;
                  id++;
                  calEvent.start = new Date(startField.val());
                  calEvent.end = new Date(endField.val());
                  calEvent.title = titleField.val();
                  calEvent.body = bodyField.val();

                  $calendar.weekCalendar("removeUnsavedEvents");
                  $calendar.weekCalendar("updateEvent", calEvent);
                  $dialogContent.dialog("close");
               },
               cancel : function() {
                  $dialogContent.dialog("close");
               }
            }
         }).show();

         $dialogContent.find(".date_holder").text($calendar.weekCalendar("formatDate", calEvent.start));
         setupStartAndEndTimeFields(startField, endField, calEvent, $calendar.weekCalendar("getTimeslotTimes", calEvent.start));

      },
      eventDrop : function(calEvent, $event) {
      },
      eventResize : function(calEvent, $event) {
      },
      eventClick : function(calEvent, $event) {

         if (calEvent.readOnly) {
            return;
         }

         var $dialogContent = $("#event_edit_container");
         resetForm($dialogContent);
         var startField = $dialogContent.find("select[name='start']").val(calEvent.start);
         var endField = $dialogContent.find("select[name='end']").val(calEvent.end);
         var titleField = $dialogContent.find("input[name='title']").val(calEvent.title);
         var bodyField = $dialogContent.find("textarea[name='body']");
         bodyField.val(calEvent.body);

         $dialogContent.dialog({
            modal: true,
            title: "Edit - " + calEvent.title,
            close: function() {
               $dialogContent.dialog("destroy");
               $dialogContent.hide();
               $('#calendar').weekCalendar("removeUnsavedEvents");
            },
            buttons: {
               save : function() {

                  calEvent.start = new Date(startField.val());
                  calEvent.end = new Date(endField.val());
                  calEvent.title = titleField.val();
                  calEvent.body = bodyField.val();

                  $calendar.weekCalendar("updateEvent", calEvent);
                  $dialogContent.dialog("close");
               },
               "delete" : function() {
                  $calendar.weekCalendar("removeEvent", calEvent.id);
                  $dialogContent.dialog("close");
               },
               cancel : function() {
                  $dialogContent.dialog("close");
               }
            }
         }).show();

         var startField = $dialogContent.find("select[name='start']").val(calEvent.start);
         var endField = $dialogContent.find("select[name='end']").val(calEvent.end);
         $dialogContent.find(".date_holder").text($calendar.weekCalendar("formatDate", calEvent.start));
         setupStartAndEndTimeFields(startField, endField, calEvent, $calendar.weekCalendar("getTimeslotTimes", calEvent.start));
         $(window).resize().resize(); //fixes a bug in modal overlay size ??

      },
      eventMouseover : function(calEvent, $event) {
      },
      eventMouseout : function(calEvent, $event) {
      },
      noEvents : function() {

      },
      data : function(start, end, callback) {
         callback(getEventData());
      }
   });

   function resetForm($dialogContent) {
      $dialogContent.find("input").val("");
      $dialogContent.find("textarea").val("");
   }

   function getEventData() {
      var year = new Date().getFullYear();
      var month = new Date().getMonth();
      var day = new Date().getDate();

      return {
         events : [
             
            {
               "id":1,
               "start": new Date(year, month, day - 1, 8),
               "end": new Date(year, month, day - 1, 9, 30),
               "title":"Evento del dia anterior"
            },
            {
               "id":2,
               "start": new Date(year, month, day + 1, 12),
               "end": new Date(year, month, day + 1, 14),
               "title":"Futbol"
            },
            {
               "id":3,
               "start": new Date(year, month, day, 10),
               "end": new Date(year, month, day, 11),
               "title":"Reunion BD",
               //readOnly : true
            },
            {
               "id":4,
               "start": new Date(year, month, day + 2, 8),
               "end": new Date(year, month, day + 2, 10),
               "title":"Programacion 3D"
            }
            ,
            {
               "id":4,
               "start": new Date(year, month, day + 3, 9),
               "end": new Date(year, month, day + 3, 14),
               "title":"Paseo"
            }

         ]
      };
   }


   /*
    * Sets up the start and end time fields in the calendar event
    * form for editing based on the calendar event being edited
    */
   function setupStartAndEndTimeFields($startTimeField, $endTimeField, calEvent, timeslotTimes) {

      for (var i = 0; i < timeslotTimes.length; i++) {
         var startTime = timeslotTimes[i].start;
         var endTime = timeslotTimes[i].end;
         var startSelected = "";
         if (startTime.getTime() === calEvent.start.getTime()) {
            startSelected = "selected=\"selected\"";
         }
         var endSelected = "";
         if (endTime.getTime() === calEvent.end.getTime()) {
            endSelected = "selected=\"selected\"";
         }
         $startTimeField.append("<option value=\"" + startTime + "\" " + startSelected + ">" + timeslotTimes[i].startFormatted + "</option>");
         $endTimeField.append("<option value=\"" + endTime + "\" " + endSelected + ">" + timeslotTimes[i].endFormatted + "</option>");

      }
      $endTimeOptions = $endTimeField.find("option");
      $startTimeField.trigger("change");
   }

   var $endTimeField = $("select[name='end']");
   var $endTimeOptions = $endTimeField.find("option");

   //reduces the end time options to be only after the start time options.
   $("select[name='start']").change(function() {
      var startTime = $(this).find(":selected").val();
      var currentEndTime = $endTimeField.find("option:selected").val();
      $endTimeField.html(
            $endTimeOptions.filter(function() {
               return startTime < $(this).val();
            })
            );

      var endTimeSelected = false;
      $endTimeField.find("option").each(function() {
         if ($(this).val() === currentEndTime) {
            $(this).attr("selected", "selected");
            endTimeSelected = true;
            return false;
         }
      });

      if (!endTimeSelected) {
         //automatically select an end date 2 slots away.
         $endTimeField.find("option:eq(1)").attr("selected", "selected");
      }

   });


   var $about = $("#about");

   $("#about_button").click(function() {
      $about.dialog({
         title: "About this calendar demo",
         width: 600,
         close: function() {
            $about.dialog("destroy");
            $about.hide();
         },
         buttons: {
            close : function() {
               $about.dialog("close");
            }
         }
      }).show();
   });


});
    </script>
	
</body>
</html>
