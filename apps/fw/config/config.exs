# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Customize the firmware. Uncomment all or parts of the following
# to add files to the root filesystem or modify the firmware
# archive.

config :ui, UiWeb.Endpoint,
  http: [port: 4000],
  url: [host: "localhost", port: 4000],
  secret_key_base: "5anANO9+ZHmmuMIKX2qjzeUc+BFRPDi0ZIOhBBL5DC9eINgTYUDXcSXztbxLUfi1",
  root: Path.dirname(__DIR__),
  server: true,
  render_errors: [view: UiWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Nerves.PubSub],
  code_reloader: false

config :logger, level: :debug

# config :nerves, :firmware,
#   rootfs_overlay: "rootfs_overlay",
#   fwup_conf: "config/fwup.conf"

# Use bootloader to start the main application. See the bootloader
# docs for separating out critical OTP applications such as those
# involved with firmware updates.
config :bootloader,
  init: [
    :nerves_network
  ],
  app: :fw

config :nerves_network,
  regulatory_domain: "US"

# Import target specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
# Uncomment to use target specific configurations

# import_config "#{Mix.Project.config[:target]}.exs"
import_config "config.secret.exs"
