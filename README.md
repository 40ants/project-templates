<a id="x-2840ANTS-PROJECT-TEMPLATES-DOCS-2FINDEX-3A-40README-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

# 40ants-project-templates

<a id="40-ants-project-templates-asdf-system-details"></a>

## 40ANTS-PROJECT-TEMPLATES ASDF System Details

* Version: 0.1.0

* Description: A bunch of Mystic templates to create `CL` library, web-project, `API` microservice and `CLI` command.

* Licence: Unlicense

* Author: Alexander Artemenko <svetlyak.40wt@gmail.com>

* Homepage: [https://40ants.com/project-templates/][863f]

* Bug tracker: [https://github.com/40ants/project-templates/issues][8fc2]

* Source control: [GIT][41d7]

[![](https://github-actions.40ants.com/40ants/project-templates/matrix.svg?only=ci.run-tests)][ca1d]

![](http://quickdocs.org/badge/40ants-project-templates.svg)

<a id="x-2840ANTS-PROJECT-TEMPLATES-DOCS-2FINDEX-3A-3A-40INSTALLATION-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

## Installation

You can install this library from Quicklisp, but you want to receive updates quickly, then install it from Ultralisp.org:

```
(ql-dist:install-dist "http://dist.ultralisp.org/"
                      :prompt nil)
(ql:quickload :40ants-project-templates)
```
<a id="x-2840ANTS-PROJECT-TEMPLATES-DOCS-2FINDEX-3A-3A-40USAGE-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

## Usage

```
CL-USER> (mystic:list-templates)
(#<40ANTS-PROJECT-TEMPLATES/REBLOCKS-APP:REBLOCKS-APP-TEMPLATE {7010EACC03}>
 #<40ANTS-PROJECT-TEMPLATES/LIBRARY:LIBRARY-TEMPLATE {7010EACC23}>)

CL-USER> (first *)
#<40ANTS-PROJECT-TEMPLATES/REBLOCKS-APP:REBLOCKS-APP-TEMPLATE {7010EACC03}>

CL-USER> (mystic:render *
                        (list :name "my-web-app"
                              :author "John Doe")
                        #P"/tmp/my-web-app/")
```
Optionally, you can give `:REQUEST-ALL-OPTIONS-P` T argument to force Mystic to ask about all template option including optional.

This library provides following template classes:

* [`library-template`][a2ba]

* [`reblocks-app-template`][9624]

<a id="x-2840ANTS-PROJECT-TEMPLATES-DOCS-2FINDEX-3A-3A-40TEMPLATES-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

## Templates

<a id="x-2840ANTS-PROJECT-TEMPLATES-DOCS-2FINDEX-3A-3A-40LIBRARY-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### CL Library

<a id="x-2840ANTS-PROJECT-TEMPLATES-2FLIBRARY-3ALIBRARY-TEMPLATE-20CLASS-29"></a>

#### [class](639c) `40ants-project-templates/library:library-template` (qlfile-mixin clpm-mixin docs-mixin ci-mixin rove-tests-mixin gitignore-mixin file-mixin)

<a id="options"></a>

##### Options

* `:AUTHOR` - Author. Required. The project author's name.

* `:NAME` - Name. Required. The project's name.

* `:DESCRIPTION` - Description. A short, one-line description of the project.

* `:DOC-THEME` - Documentation Theme. A theme name in the form of the fully specified symbol name (as a string). Example: 40ants-doc-theme-40ants:40ants-theme.

* `:EMAIL` - Email. The project author's email.

* `:GITHUB` - GitHub `URL`. The project's `URL` on the GitHub.

* `:HOMEPAGE` - Homepage. `URL` of the project's homepage.

* `:LICENSE` - License. Default: "`BSD`". The project's license string, e.g. '`MIT`', '`GPL`v3'.

<a id="x-2840ANTS-PROJECT-TEMPLATES-2FLIBRARY-3AMAKE-CORE-FILE-20GENERIC-FUNCTION-29"></a>

#### [generic-function](ae15) `40ants-project-templates/library:make-core-file` template

Should return a file object, which creates main lisp file.

Use [`make-file`][659a] function to create a [`mystic.template.file:file`][a919] object.

<a id="x-2840ANTS-PROJECT-TEMPLATES-2FLIBRARY-3AMAKE-SYSTEM-FILE-20GENERIC-FUNCTION-29"></a>

#### [generic-function](64f4) `40ants-project-templates/library:make-system-file` template

Should return a file object, which creates `{{ name }}.asd` file.

<a id="x-2840ANTS-PROJECT-TEMPLATES-DOCS-2FINDEX-3A-3A-40REBLOCKS-APP-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### Reblocks Web App

<a id="x-2840ANTS-PROJECT-TEMPLATES-2FREBLOCKS-APP-3AREBLOCKS-APP-TEMPLATE-20CLASS-29"></a>

#### [class](46bc) `40ants-project-templates/reblocks-app:reblocks-app-template` (library-template)

This template creates a Reblocks web application with a few simple widgets.

Other behaviour is inherited from [`library-template`][a2ba]

<a id="x-2840ANTS-PROJECT-TEMPLATES-DOCS-2FINDEX-3A-3A-40MIXINS-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

## Mixins

<a id="x-2840ANTS-PROJECT-TEMPLATES-DOCS-2FINDEX-3A-3A-40CI-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### CI

<a id="x-2840ANTS-PROJECT-TEMPLATES-2FMIXIN-2FCI-3ACI-MIXIN-20CLASS-29"></a>

#### [class](0569) `40ants-project-templates/mixin/ci:ci-mixin` (file-mixin)

Adds docs based on 40ants-docs.

<a id="x-2840ANTS-PROJECT-TEMPLATES-DOCS-2FINDEX-3A-3A-40CLPM-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### CLPM

<a id="x-2840ANTS-PROJECT-TEMPLATES-2FMIXIN-2FCLPM-3ACLPM-MIXIN-20CLASS-29"></a>

#### [class](69e3) `40ants-project-templates/mixin/clpm:clpm-mixin` (file-mixin)

Adds clpmfile into the root of the project.

<a id="x-2840ANTS-PROJECT-TEMPLATES-DOCS-2FINDEX-3A-3A-40DOCS-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### Docs

<a id="x-2840ANTS-PROJECT-TEMPLATES-2FMIXIN-2FDOCS-3ADOCS-MIXIN-20CLASS-29"></a>

#### [class](913e) `40ants-project-templates/mixin/docs:docs-mixin` (file-mixin)

Adds docs based on 40ants-docs.

<a id="x-2840ANTS-PROJECT-TEMPLATES-DOCS-2FINDEX-3A-3A-40GITIGNORE-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### Gitignore

<a id="x-2840ANTS-PROJECT-TEMPLATES-2FMIXIN-2FGITIGNORE-3AGITIGNORE-MIXIN-20CLASS-29"></a>

#### [class](7e39) `40ants-project-templates/mixin/gitignore:gitignore-mixin` ()

Adds .gitignore into the root of the project.

<a id="x-2840ANTS-PROJECT-TEMPLATES-2FMIXIN-2FGITIGNORE-3A-2APATTERNS-2A-20-28VARIABLE-29-29"></a>

#### [variable](d748) `40ants-project-templates/mixin/gitignore:*patterns*` ("*~" ".#*" ".*.~undo-tree~")

Default list of patterns which returned by [`patterns-to-ignore`][fcc9] generic function.

<a id="x-2840ANTS-PROJECT-TEMPLATES-2FMIXIN-2FGITIGNORE-3APATTERNS-TO-IGNORE-20GENERIC-FUNCTION-29"></a>

#### [generic-function](de00) `40ants-project-templates/mixin/gitignore:patterns-to-ignore` template

Should return a list of patterns to add to .gitignore. Default method takes them from [`*patterns*`][0c07] variable.

<a id="x-2840ANTS-PROJECT-TEMPLATES-DOCS-2FINDEX-3A-3A-40QLFILE-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### Qlfile

<a id="x-2840ANTS-PROJECT-TEMPLATES-2FMIXIN-2FQLFILE-3AQLFILE-MIXIN-20CLASS-29"></a>

#### [class](9417) `40ants-project-templates/mixin/qlfile:qlfile-mixin` (file-mixin)

Adds qlfile into the root of the project.

<a id="x-2840ANTS-PROJECT-TEMPLATES-2FMIXIN-2FQLFILE-3AQLFILE-PIECES-20GENERIC-FUNCTION-29"></a>

#### [generic-function](cbcb) `40ants-project-templates/mixin/qlfile:qlfile-pieces` template

Returns a list of strings which will be concatentated to build a qlfile.

<a id="x-2840ANTS-PROJECT-TEMPLATES-DOCS-2FINDEX-3A-3A-40ROVE-TESTS-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### Rove Tests

<a id="x-2840ANTS-PROJECT-TEMPLATES-2FMIXIN-2FROVE-TESTS-3AROVE-TESTS-MIXIN-20CLASS-29"></a>

#### [class](ba39) `40ants-project-templates/mixin/rove-tests:rove-tests-mixin` (file-mixin)

Adds tests based on Rove.

<a id="x-2840ANTS-PROJECT-TEMPLATES-DOCS-2FINDEX-3A-3A-40UTILS-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

## Utilities

<a id="x-28MYSTIC-2ETEMPLATE-2EFILE-3AFILE-MIXIN-20CLASS-29"></a>

### [class](b20e) `mystic.template.file:file-mixin` (template)

A Mystic template mixin for rendering a list of files using Mustache.

<a id="x-28MYSTIC-2ETEMPLATE-2EFILE-3AFILE-20CLASS-29"></a>

### [class](79e4) `mystic.template.file:file` ()

A file.

<a id="x-28MYSTIC-2ETEMPLATE-2EFILE-3AFILE-CONTENT-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-20MYSTIC-2ETEMPLATE-2EFILE-3AFILE-29-29"></a>

### [reader](befc) `mystic.template.file:file-content` (file) (:content)

The file's contents, a Mustache template string.

<a id="x-28MYSTIC-2ETEMPLATE-2EFILE-3AFILE-PATH-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-20MYSTIC-2ETEMPLATE-2EFILE-3AFILE-29-29"></a>

### [reader](1051) `mystic.template.file:file-path` (file) (:path)

The path to the file relative to the directory,
a Mustache template string.

<a id="x-28MYSTIC-2ETEMPLATE-2EFILE-3AMAKE-FILE-20FUNCTION-29"></a>

### [function](e949) `mystic.template.file:make-file` system-name path output-path-template

<a id="x-2840ANTS-PROJECT-TEMPLATES-2FUTILS-3AENSURE-TEMPLATE-DOCSTRING-HAS-OPTIONS-DESCRIPTION-20FUNCTION-29"></a>

### [function](90ea) `40ants-project-templates/utils:ensure-template-docstring-has-options-description` CLASS-NAME &KEY (TITLE "## Options")

Appends options description to the documentation string of a given template class.

Options are sorted by their keyword argument name but "required" go before optional.

Wrap this function call with `EVAL-WHEN` if calling it as a toplevel form.


[863f]: https://40ants.com/project-templates/
[a2ba]: https://40ants.com/project-templates/#x-2840ANTS-PROJECT-TEMPLATES-2FLIBRARY-3ALIBRARY-TEMPLATE-20CLASS-29
[0c07]: https://40ants.com/project-templates/#x-2840ANTS-PROJECT-TEMPLATES-2FMIXIN-2FGITIGNORE-3A-2APATTERNS-2A-20-28VARIABLE-29-29
[fcc9]: https://40ants.com/project-templates/#x-2840ANTS-PROJECT-TEMPLATES-2FMIXIN-2FGITIGNORE-3APATTERNS-TO-IGNORE-20GENERIC-FUNCTION-29
[9624]: https://40ants.com/project-templates/#x-2840ANTS-PROJECT-TEMPLATES-2FREBLOCKS-APP-3AREBLOCKS-APP-TEMPLATE-20CLASS-29
[a919]: https://40ants.com/project-templates/#x-28MYSTIC-2ETEMPLATE-2EFILE-3AFILE-20CLASS-29
[659a]: https://40ants.com/project-templates/#x-28MYSTIC-2ETEMPLATE-2EFILE-3AMAKE-FILE-20FUNCTION-29
[41d7]: https://github.com/40ants/project-templates
[ca1d]: https://github.com/40ants/project-templates/actions
[79e4]: https://github.com/40ants/project-templates/blob/114df1daf7ded2b76efcdce284920db8f9c29b8d/.qlot/dists/ultralisp/software/roswell-mystic-20230314045148/templates/mixins/file/file.lisp#L18
[1051]: https://github.com/40ants/project-templates/blob/114df1daf7ded2b76efcdce284920db8f9c29b8d/.qlot/dists/ultralisp/software/roswell-mystic-20230314045148/templates/mixins/file/file.lisp#L19
[befc]: https://github.com/40ants/project-templates/blob/114df1daf7ded2b76efcdce284920db8f9c29b8d/.qlot/dists/ultralisp/software/roswell-mystic-20230314045148/templates/mixins/file/file.lisp#L24
[b20e]: https://github.com/40ants/project-templates/blob/114df1daf7ded2b76efcdce284920db8f9c29b8d/.qlot/dists/ultralisp/software/roswell-mystic-20230314045148/templates/mixins/file/file.lisp#L30
[e949]: https://github.com/40ants/project-templates/blob/114df1daf7ded2b76efcdce284920db8f9c29b8d/.qlot/dists/ultralisp/software/roswell-mystic-20230314045148/templates/mixins/file/file.lisp#L49
[639c]: https://github.com/40ants/project-templates/blob/114df1daf7ded2b76efcdce284920db8f9c29b8d/src/library.lisp#L30
[64f4]: https://github.com/40ants/project-templates/blob/114df1daf7ded2b76efcdce284920db8f9c29b8d/src/library.lisp#L83
[ae15]: https://github.com/40ants/project-templates/blob/114df1daf7ded2b76efcdce284920db8f9c29b8d/src/library.lisp#L91
[0569]: https://github.com/40ants/project-templates/blob/114df1daf7ded2b76efcdce284920db8f9c29b8d/src/mixin/ci.lisp#L11
[69e3]: https://github.com/40ants/project-templates/blob/114df1daf7ded2b76efcdce284920db8f9c29b8d/src/mixin/clpm.lisp#L11
[913e]: https://github.com/40ants/project-templates/blob/114df1daf7ded2b76efcdce284920db8f9c29b8d/src/mixin/docs.lisp#L16
[7e39]: https://github.com/40ants/project-templates/blob/114df1daf7ded2b76efcdce284920db8f9c29b8d/src/mixin/gitignore.lisp#L13
[d748]: https://github.com/40ants/project-templates/blob/114df1daf7ded2b76efcdce284920db8f9c29b8d/src/mixin/gitignore.lisp#L18
[de00]: https://github.com/40ants/project-templates/blob/114df1daf7ded2b76efcdce284920db8f9c29b8d/src/mixin/gitignore.lisp#L25
[9417]: https://github.com/40ants/project-templates/blob/114df1daf7ded2b76efcdce284920db8f9c29b8d/src/mixin/qlfile.lisp#L25
[cbcb]: https://github.com/40ants/project-templates/blob/114df1daf7ded2b76efcdce284920db8f9c29b8d/src/mixin/qlfile.lisp#L30
[ba39]: https://github.com/40ants/project-templates/blob/114df1daf7ded2b76efcdce284920db8f9c29b8d/src/mixin/rove-tests.lisp#L11
[46bc]: https://github.com/40ants/project-templates/blob/114df1daf7ded2b76efcdce284920db8f9c29b8d/src/reblocks-app.lisp#L15
[90ea]: https://github.com/40ants/project-templates/blob/114df1daf7ded2b76efcdce284920db8f9c29b8d/src/utils.lisp#L81
[8fc2]: https://github.com/40ants/project-templates/issues

* * *
###### [generated by [40ANTS-DOC](https://40ants.com/doc/)]
