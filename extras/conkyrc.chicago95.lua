-- help: https://antixlinux.com/forum-archive/solved-is-this-possible-battery-warning-time-to-sh-t4510.html


-- note1: default conky in slackware has problems showing the correct RAM consumption, hence the shell workaround
-- note2: conky config derived from bunsenlabs. Thank you BL Team!
-- note3: this config will call a batt-low-check.sh script. Make sure to set it up or remove it if
-- you dont need this!

-- To run, conky -c ~/path/to/conkyrc.chicago95.lua

conky.config = {
  -- Settings

  background = true,
  use_xft = true,
  font = 'Helvetica:size=9',
  font1 = 'Helvetica:bold:size=9',
  xftalpha = 1.0,
  update_interval = 1.0,
  total_run_times = 0,
  own_window = true,
  own_window_transparent = false,
  --own_window_argb_visual = true,
  --own_window_argb_value = 180,
  own_window_type = 'override', --normal
  own_window_hints = 'undecorated,below,skip_taskbar,skip_pager,sticky',
  own_window_class = 'Conky',
  own_window_title = 'Conky',
  own_window_colour = '008080',
  double_buffer = true,
  minimum_width = 180,
  minimum_height = 5, -- width | height
  maximum_width = 180,
  draw_shades = false,
  draw_borders = true,
  border_inner_margin = 10,
  border_width = 0,
  draw_graph_borders = true,
  default_color = 'C0C0C0',
  draw_outline = false,
  default_shade_color = '000000',
  default_outline_color = 'ffffff',
  alignment = 'bottom_right',
  gap_x = 5,
  gap_y = 22,
  no_buffers = true,
  uppercase = false,
  cpu_avg_samples = 2,
  override_utf8_locale = true,
  color1 = 'dbdbdb',
  color2 = 'bdbdbd',
  color3 = 'ababab',
  -- Arch blue
  color4 = '#1793D0',
  -- Green
  color5 = '#8FEB8F',
  -- Red
  color6 = '#F45F45',
  -- Gentoo Purple
  color7 = '#7A5ADA',
  top_name_width = 15,
  text_buffer_size = 1024,
  imlib_cache_size = 0,
  show_graph_scale = false,
  show_graph_range = false,
  short_units = true,
  use_spacer = 'none',
  if_up_strictness = 'address',
  -- dual monitors?
  -- xinerama_head = 2
};

conky.text = [[
${font1}${execi 3600 cat /etc/slackware-version}${font} ${alignr} ${kernel} ${machine}
${hr}
Host:${alignr}${nodename_short}
Uptime:${alignr}${uptime_short}
CPU:${alignr 5}${cpu cpu0}%
RAM:${alignr}${exec free -mh | awk '/Mem:/ { print $3 }' | cut -d'i' -f1} / ${memmax}
Swap:${alignr}${swap} / ${swapmax}

${font1}DISK ${hr}${font}
Read: ${diskio_read /dev/sda} ${alignr} Write: ${diskio_write /dev/sda}
/boot: ${fs_size /boot}${alignr}${fs_used_perc /boot}%
/home: ${fs_size /home}${alignr}${fs_used_perc /home}%
/: ${fs_size /}${alignr}${fs_used_perc /}%${color}

${font1}BATTERY ${hr}${font}
BAT: ${battery_percent BAT0}% ${alignr} AC: ${acpiacadapter}

${if_match "${acpiacadapter}"=="off-line"}\
${execi 10 batt-low-check.sh}\
${endif}
]];
