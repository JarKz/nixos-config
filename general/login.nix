
{ config, pkgs, ... }:

{
	services.greetd = {
		enable = true;
		settings =  {
			default_session = {
				command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd niri-session";
				user = "greeter";
			};
		};
	};

	# Just lifesaver
	systemd.services.greetd.serviceConfig = {
		Type = "idle";
		StandardInput = "tty";
		StandardOutput = "tty";
		StandardError =  "journal";
		TTYReset = true;
		TTYVHangup = true;
		TTYVTDisallocate = true;
	};
}
