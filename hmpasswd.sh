#!/bin/sh

CONF="/etc/lighttpd/lighttpd_ssl.conf"
HTPASSWD="/etc/lighttpd/.htpasswd"
HTPASSWD_SETUP="${HTPASSWD}"
MODAUTH="/lib/mod_auth.so"
AUTOSTART="/etc/config/rc.d/hmpasswd.sh"

start() {
	echo "Starting hmpasswd"
	logger -t homematic -p user.info "starting hmpasswd"
	echo "OK"
}

stop() {
	echo "Stopping hmpasswd"
	logger -t homematic -p user.info "stopping hmpasswd"
	echo "OK"
}

uninstall() {
	mount -o remount,rw /
	mount -o remount,rw /usr/local
	if [ -e "${CONF}" ]; then
		if [ -e "${CONF}.bak" ]; then
			cp "${CONF}.bak" "${CONF}"
			rm "${CONF}.bak"
			rm "${HTPASSWD_SETUP}"
			rm "${MODAUTH}"
			rm "${AUTOSTART}"
			PID=`ps afx | grep lighttpd_ssl | grep -v grep | awk '{print $1}'`
			kill "${PID}"
			/usr/sbin/lighttpd -f /etc/lighttpd/lighttpd_ssl.conf
		fi
	fi
	logger -t homematic -p user.info "uninstalled hmpasswd"
	mount -o remount,ro /usr/local
	mount -o remount,ro /
}

info() {
	echo "Info: Author: <a href=\"mailto:rh+homematic@hrdns.de\">Richard Huelsberg</a><br>"
	echo "Info: Homepage: <a target=\"_blank\" href=\"https://www.hrdns.de\">HRdns.de</a><br>"
	echo "Name: HMpasswd"
	echo "Version: 0.0.1"
	echo "Operations: uninstall"
	echo "Update: https://raw.githubusercontent.com/sgc-fireball/hmpasswd/master/VERSION"
}

case "$1" in
	""|start)
		start
		;;
	stop)
		stop
		;;
	reload|restart)
		stop
		sleep 2
		start
		;;
	info)
		info
		;;
	uninstall)
		uninstall
		;;
esac
