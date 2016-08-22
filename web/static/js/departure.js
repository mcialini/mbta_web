import socket from "./socket"

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
              '<td><a href="origin/' + departure.origin + '">' + departure.origin + '</a></td>' +
              '<td>' + departure.trip + '</td>' +
              '<td class="wide">' + departure.destination + '</td>' +
              '<td>' + unix_to_date(departure.scheduled_time) + '</td>' +
              '<td>' + departure.track + '</td>' +
              '<td>' + departure.status + '</td>' +
              '</tr>';
    tb.append(row);
  }
}

$(function() {
  if (window.location.pathname == "/") {
    let tb = $("#departures")
    if (tb.length) {
      var topic = "departure:lobby"
      // Join the topic
      let channel = socket.channel(topic, {})
      channel.join()
        .receive("ok", data => {
          console.log("Joined topic", topic)
          tb.empty()
          for (var d in data.departures) {
            Departure.add(tb, data.departures[d])
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