//= link_tree ../images
//= link_directory ../stylesheets .css
//= link_tree ../../javascript .js
//= link_tree ../../../vendor/javascript .js
//= link popper.js
//= link bootstrap.min.js

{
  "background_color": "white",
  "description": "Style, Share, & Connect | Experience style in community",
  "display": "fullscreen",
  "name": "MeetWear",
  "icons": [
    <% files = Dir.entries(Rails.root.join("app/assets/images/icons/")).select {|f| !File.directory? f} %>
    <% files.each_with_index do |file, index| %>
      <% match = file.match(/.+-(?<size>\d{2,3}x\d{2,3}).png/) %>
      {
        "src": "<%= image_path "icons/#{file}" %>",
        "sizes": "<%= match && match[:size] %>",
        "type": "image/png"
      }<%= "," unless (files.size - 1) == index %>
    <% end %>
  ]
}
