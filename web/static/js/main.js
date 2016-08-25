import socket from "./socket"
import $ from "jquery"

export default class MainView {
	mount() {
		// This will be executed when the document loads...
		console.log('MainView mounted');
	}

	unmount() {
		// This will be executed when the document unloads...
		console.log('MainView unmounted');
	}
};

export default class DepartureView extends MainView {
	mount() {
		super.mount();
		this.startTime();
		var topic = document.getElementById("departures").dataset.jsTopicName;
		if (topic === undefined) {
			topic = "departure:lobby";
		}
		this.connectToChannel(topic);
	}

	startTime() {
		var today = new Date();
		var y = today.getFullYear();
		var mo = today.getMonth() + 1;
		var d = today.getDate();
		var h = today.getHours();
		var m = today.getMinutes();
		var s = today.getSeconds();
		if (m < 10) { m = "0" + m; }
		if (s < 10) { s = "0" + s; }
		document.getElementById('current_datetime').innerHTML = mo + '-' + d + '-' + y + ' ' + h + ":" + m + ":" + s;
		var t = setInterval(this.startTime, 500);
	}

	connectToChannel(topic) {
		console.log("called connect ", topic);
		let tb = $("#departures");
	    if (tb.length) {
			let channel = socket.channel(topic, {})
			channel.join()
			.receive("ok", data => {
				console.log("Joined topic", topic)
				tb.empty()
				for (var d in data.departures) {
					this.addDepartureRow(tb, data.departures[d])
				}
			})
			.receive("error", resp => {
		  		console.log("Unable to join this topic", topic)
			})
			channel.on("change", data => {
				console.log("Departure feed updated");
				tb.empty()
				for (var d in data.departures) {
					this.addDepartureRow(tb, data.departures[d])
				}
			});
	    }
	    return;
	}

	addDepartureRow(tb, departure) {
		if (departure.track === null) {
		  	departure.track = "TBD";
		}
		let row = '<tr>' +
		          '<td><a href="/origin/' + departure.origin + '">' + departure.origin + '</td>' +
		          '<td>' + departure.trip + '</td>' +
		          '<td class="destination">' + departure.destination + '</td>' +
		          '<td>' + this.unix_to_date(departure.scheduled_time) + '</td>' +
		          '<td>' + departure.track + '</td>' +
		          '<td>' + departure.status + '</td>' +
		          '</tr>';
		tb.append(row);
	}

	unix_to_date(ts) {
		// For formatting dates.
		var date = new Date(ts*1000);
		var h = date.getHours();
		var m = date.getMinutes();
		if (m < 10) { m = "0" + m; }
		return h + ":" + m;
	}
};