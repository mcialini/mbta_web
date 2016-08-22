import socket from "./socket"
import $ from "jquery"

let unix_to_date = function(ts) {
  // For formatting dates.
  var date = new Date(ts*1000);
  var h = date.getHours();
  var m = date.getMinutes();
  if (m < 10) { m = "0" + m; }
  return h + ":" + m;
}

export var Departure = {
  add: function(tb, departure) {
    if (departure.track === null) {
      departure.track = "TBD";
    }
    let row = '<tr>' +
              '<td>' + departure.origin + '</td>' +
              '<td>' + departure.trip + '</td>' +
              '<td class="destination">' + departure.destination + '</td>' +
              '<td>' + unix_to_date(departure.scheduled_time) + '</td>' +
              '<td>' + departure.track + '</td>' +
              '<td>' + departure.status + '</td>' +
              '</tr>';
    tb.append(row);
  }
}

$(function() {
  console.log('in')
  if (window.location.pathname == "/") {
    let tb = $("#departures")
    if (tb.length) {
      var topic = "departure:lobby"
      // Join the topic
      let channel = socket.channel(topic, {})
      console.log('joining')
      channel.join()
        .receive("ok", data => {
          console.log("Joined topic", topic)
          tb.empty()
          for (var d in data.departures) {
            Departure.add(tb, data.departures[d])
            console.log('added ' + d)
          }
        })
        .receive("error", resp => {
          console.log("Unable to join this topic", topic)
        })
      channel.on("change", data => {
        console.log("Departure feed updated");
        tb.empty()
        for (var d in data.departures) {
          Departure.add(tb, data.departures[d])
        }
      });
    }
  }
});