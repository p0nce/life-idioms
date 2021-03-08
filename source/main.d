module main;

import core.time;

import std.datetime;
import std.array;
import std.stdio;
import std.file;
import std.conv;
import std.string;
import std.algorithm;
import page;


class Idiom
{
public:
    this(string mdFile)
    {
        this.markdownFile = mdFile;
        this._modTime = getLastModificationDate(mdFile);
        this._createTime = getCreationDate(mdFile);
    }

    string title()
    {
        return markdownFile[9..$-3];
    }

    string anchorName()
    {
        dchar[dchar] transTable1 = [' ' : '-'];
        return translate(title(), transTable1);
    }

    SysTime getLastModificationDate(string mdFile)
    {
        try
        {
            import dateparser;
            import std.process;
            auto git = execute(["git", "log", "-1", "--format=%cd", mdFile]);
            if (git.status != 0)
                throw new Exception("Couldn't get last mod with git");

            string dateStr = strip(chomp(git.output));
            SysTime mod = parse(dateStr);
            return mod;
        }
        catch(Exception e)
        {
            // Usualy happens when the idiom is not yet commited
            return Clock.currTime();
        }
    }

    SysTime getCreationDate(string mdFile)
    {
        try
        {
            import dateparser;
            import std.process;
            auto git = execute(["git", "log", "--format=%aD", "--reverse", "--follow", mdFile]);
            if (git.status != 0)
                throw new Exception("Couldn't get creation time with git");

            string[] outputs = splitLines(git.output);
            if (outputs.length < 1)
                throw new Exception("Couldn't get creation time with git");

            string dateStr = strip(chomp(outputs[0]));
            SysTime mod = parse(dateStr);
            return mod;
        }
        catch(Exception e)
        {
            // Usualy happens when the idiom is not yet commited
            return Clock.currTime();
        }
    }

    SysTime modTime()
    {
        return _modTime;
    }

    SysTime createTime()
    {
        return _createTime;
    }

    string lastModifiedString()
    {
        if (_modTime.year == _createTime.year
            && _modTime.month == _createTime.month
            && _modTime.day == _createTime.day)
            return format("Created %s", _createTime.toFriendlyString());
        return format("Modified %s, created %s", _modTime.toFriendlyString(), _createTime.toFriendlyString());
    }

private:
    string markdownFile;
    SysTime _modTime;
    SysTime _createTime;

}

void main(string[] args)
{
    Idiom[] idioms;

    // finds all idioms by enumarating Markdown
    auto mdFiles = filter!`endsWith(a.name,".md")`(dirEntries("articles",SpanMode.depth));
    foreach(md; mdFiles)
        idioms ~= new Idiom(md);

    // Sort tips by last change time
    bool sortByLastChange = true;
    if (sortByLastChange)
        idioms = sort!"a.modTime > b.modTime"(idioms).array;

    auto page = new Page("index.html");

    with(page)
        {
            writeln("<!DOCTYPE html>");
            push("html");
                push("head");

                    writeln("<meta charset=\"utf-8\">");
                    writeln("<meta name=\"description\" content=\"this.self, personal log.\">");
                    push("style", "type=\"text/css\"  media=\"all\" ");
                        appendRawFile("reset.css");
                        appendRawFile("common.css");
                        appendRawFile("hybrid.css");
                    pop();
                    writeln("<link href='//fonts.googleapis.com/css?family=Inconsolata' rel='stylesheet' type='text/css'>");

                    push("title");
                    write("this.self - A personal log");
                    pop;
                pop;
                push("body");
                    writeln("<script src=\"highlight.pack.js\"></script>");
                    writeln("<script>hljs.initHighlightingOnLoad();</script>");

                    push("header");
                        push("img", "id=\"logo\" src=\"d-logo.svg\"");
                        pop;

                        push("div", "id=\"title-container\"");
                            push("div", "id=\"title\"");
                                writeln("this.self");
                                write("<br>");
                                push("div", "id=\"sub-title\"");
                                    write("Where shit hits the fans.");
                                pop;
                            pop();
                        pop;
                    pop;

                    push("nav");
                        foreach(idiom; idioms)
                        {
                            push("div", `class="item-nav"`);
                                push("a", "href=\"#" ~ idiom.anchorName() ~ "\"");
                                    writeln(idiom.title());
                                pop;
                                push("span", `style=" color:rgb(158,158,158); font-size: 0.7em; float: right;"`);
                                    writeln(" " ~ idiom.lastModifiedString());
                                pop;
                            pop;
                        }
                    pop;

                    push("div", "class=\"container\"");
                        foreach(idiom; idioms)
                        {
                            push("a", "name=\"" ~ idiom.anchorName() ~ "\"");
                            pop;
                            push("div", "class=\"idiom\"");
                                push("a", "class=\"permalink\" href=\"#" ~ idiom.anchorName() ~ "\"");
                                    writeln("Link");
                                pop;
                                appendMarkdown(idiom.markdownFile);
                            pop;
                        }
                    pop;

                    push("footer");

                      
                    pop;
                pop;
            pop;
        }
}

string toFriendlyString(SysTime time)
{
    string result;
    int day = time.day;
    int month = time.month;
    int year = time.year;

    static immutable string[12] months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    result ~= months[month-1];
    result ~= " ";

    result ~= to!string(time.day);
    result ~= `<span class="sub">`;
    if (day == 1)
        result ~= "st";
    else if (day == 2)
        result ~= "nd";
    else if (day == 3)
        result ~= "rd";
    else
        result ~= "th";
    result ~= "</span>";
    result ~= " ";

    result ~= to!string(year);
    return result;
}
