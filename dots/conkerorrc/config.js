url_completion_use_bookmarks = true ;
url_remoting_fn = load_url_in_new_buffer;
homepage = "https://duckduckgo.com";


// load download buffers in the background in the current
// window, instead of in new windows.
download_buffer_automatic_open_target = OPEN_NEW_BUFFER_BACKGROUND;


// default directory for downloads and shell commands.
cwd = get_home_directory();
cwd.append("Downloads");
session_pref("browser.download.manager.closeWhenDone", true);

view_source_use_external_editor = true;
editor_shell_command = "/Applications/Emacs.app/Contents/MacOS/bin-x86_64-10_9/emacsclient";
set_protocol_handler("mailto", make_file("~/Applications/mailto"));

define_webjump("ddg", "https://duckduckgo.com/?q=%s");
define_webjump("soundcloud", "https://soundcloud.com");
define_webjump("telegram", "https://web.telegram.org");
define_webjump("reddit", "https://reddit.com/");
define_webjump("/r/destinythegame", "https://reddit.com/r/destinythegame");
define_webjump("/r/emacs", "https://reddit.com/r/emacs");

define_key(text_keymap, "C-c i", "edit-current-field-in-external-editor");
