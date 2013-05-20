# MojoHel - Twitter BootStrap form builder customized for Mojolicious

---

## Description

[MojoHel](http://mojohel.dokechin.com) is the drag and drop type form building tool customized for Mojolicious.
This product had forked from [Bootstrap Form Builder](http://bootstrap-forms.heroku.com/).
The Bootstrap Form Builer can output HTML source from the form you configured, on the other MojoHel
has additional function to convert HTML source to the Mojolicious template file format having sufix ep.
You can use the outputed ep source to paste your application template files, so you are
able to configure forms very quickly and easily.

## Example

### mojo generate app

Mojolicious has command to create a application skelton, C<mojo generate app>.

    mojo generate app SampleApp::Web
    
    sample_app_web/
    |-- lib
    |   `-- SampleApp
    |       |-- Web
    |       |   `-- Example.pm
    |       `-- Web.pm
    |-- log
    |-- public
    |   `-- index.html
    |-- script
    |   `-- sample_app_web
    |-- t
    |   `-- basic.t
    `-- templates
        |-- example
        |   `-- welcome.html.ep
        `-- layouts
            `-- default.html.ep

### mojo generate bootstrap

Convinient CPAN module is exists for using Twitter BootStrap in Mojolicious, 
[Mojolicious::Command::generate::bootstrap](https://metacpan.org/module/Mojolicious::Command::generate::bootstrap),
After module installed by cpanm command, and you can deploy Twitter Bootstrap library into your Mojolicous-App by the command.

    cpanm Mojolicious::Command::generate::bootstrap
    cd sample_app_web
    mojo generate bootstrap
    
    sample_app_web/
    |-- lib
    |   `-- SampleApp
    |       |-- Web
    |       |   `-- Example.pm
    |       `-- Web.pm
    |-- log
    |-- public
    |   |-- css
    |   |   `-- bootstrap.min.css
    |   |-- img
    |   |   |-- glyphicons-halflings.png
    |   |   `-- glyphicons-halflings-white.png
    |   |-- index.html
    |   `-- js
    |       `-- bootstrap.min.js
    |-- script
    |   `-- sample_app_web
    |-- t
    |   `-- basic.t
    `-- templates
        |-- example
        |   `-- welcome.html.ep
        `-- layouts
            |-- bootstrap.html.ep
            `-- default.html.ep

Twitter Bootstrap library files is bootstrap.min.css and 2 png files, and bootstrap.min.js file.
In the directory layouts, bootstrap.html.ep is the layout file that contains bootstrap library paths.

### Renaming the layout helper argument

When you want to use Bootstrap, Renaming layout helper argument from default to bootstrap.

    templates/example/welcome.html.ep

    % layout 'default'; # Renaming to bootstrap
    % title 'Welcome';

### Build forms by MojoHel and copy code

Build forms using [MojoHel](http://mojohel.dokechin.com/index.html) by drag and drop operations.
After you create form, select a Rendered(ep) tab, copy the rendered code, paste to your template file.

### Coding form validator logic

I created sample Mojolicious application in gitbhub. Please refer [This](https://github.com/dokechin/formapp).
This source includes validator code sample.

MojoHel rendered code contains code to display error messages.

    % if ($self->stash->{error_messages}) {
    <ul>
    % for my $message ( @{$self->stash->{error_messages}} ) {
    <li><%= $message %></li>
    % }
    </ul>


And contains code to notice error's field.

    <div class ="control-group <% if ($self->stash->{errors} && $self->stash->{errors}->{"textinput"}) {%><%= "error" %><% } %>">

If you set these parameters, error_message array refrence and errors hash refrence in the controller, validator result will be rendered.

