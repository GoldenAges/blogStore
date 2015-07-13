#### 插件
* All Autocomplete,
* AutoFileName,
* BracketHighlighter,
* ConvertToUTF8,
* CSScomb,
* DocBlockr,
* Emmet,
* FileDiffs,
* Javascript Beautify,
* jQuery,
* Markdown HTML Preview,
* Markdown Preview,
* MarkdownEditing,
* Package Control,
* PHPIntel,
* sublimelint,
* SublimeLinter,
* WordPress,

##在Preference->settings->user添加相关配置
"auto_complete_triggers":
    [
        {
            "characters": "<",
            "selector": "text.html"
        },
        {
            "characters": "/",
            "selector": "string.quoted.double.html,string.quoted.single.html, source.css"
        }
    ],
//光标所在行高亮
"highlight_line": true,
//使用Unix的换行符
"default_line_ending": "unix",
//4个空格代表缩进
"translate_tabs_to_spaces": true,
"tab_size": 4,
//保存时去掉每行行尾空格
"trim_trailing_white_space_on_save": true

##在Preference->Package Settings->DocBlockr->Settings-user添加如下内容

{
    "jsdocs_extra_tags": ["","@since ${1:[version]}","@see ${1:[reference_function_name()]}","@author ${1:YourName}", "@date {{date}}",""]
}

