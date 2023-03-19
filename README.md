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

This library provides following template classes:

* [`library-template`][a2ba]

* [`reblocks-app-template`][9624]

To create new projects out of these templates, use functions [`create-library`][560f] and [`create-reblocks-app`][7346]:

```
CL-USER> (40ants-project-templates:create-reblocks-app
          #P"/tmp/my-web-app/"
          "my-web-app"
          "My experimental web application")
```
Optionally, you can give `:REQUEST-ALL-OPTIONS-P` T argument to force Mystic to ask about all template option including optional.

Also, you can use more generic `MYSTIC:RENDER` function and pass arguments as a list:

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
<a id="x-2840ANTS-PROJECT-TEMPLATES-DOCS-2FINDEX-3A-3A-40TEMPLATES-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

## Templates

<a id="x-2840ANTS-PROJECT-TEMPLATES-DOCS-2FINDEX-3A-3A-40LIBRARY-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### CL Library

<a id="x-2840ANTS-PROJECT-TEMPLATES-2FLIBRARY-3ALIBRARY-TEMPLATE-20CLASS-29"></a>

#### [class](b874) `40ants-project-templates/library:library-template` (qlfile-mixin clpm-mixin docs-mixin ci-mixin rove-tests-mixin gitignore-mixin file-mixin)

Mystic template to create a Common Lisp library with documentation, tests and continuous integration.

Use [`40ants-project-templates:create-library`][560f] function to generate a skeleton for a new `CL` library.

<a id="included-mixins"></a>

##### Included mixins

* [`qlfile-mixin`][c335]

* [`clpm-mixin`][f9c4]

* [`docs-mixin`][333e]

* [`ci-mixin`][5153]

* [`rove-tests-mixin`][2215]

* [`gitignore-mixin`][cb6d]

<a id="options"></a>

##### Options

* `:AUTHOR` - Author. **Required**. The project author's name.

* `:NAME` - Name. **Required**. The project's name.

* `:DESCRIPTION` - Description. A short, one-line description of the project.

* `:DOC-THEME` - Documentation Theme. A theme name in the form of the fully specified symbol name (as a string). Example: 40ants-doc-theme-40ants:40ants-theme.

* `:EMAIL` - Email. The project author's email.

* `:GITHUB` - GitHub `URL`. The project's `URL` on the GitHub.

* `:HOMEPAGE` - Homepage. `URL` of the project's homepage.

* `:LICENSE` - License. Default: "`BSD`". The project's license string, e.g. '`MIT`', '`GPL`v3'.

<a id="x-2840ANTS-PROJECT-TEMPLATES-3ACREATE-LIBRARY-20FUNCTION-29"></a>

#### [function](2781) `40ants-project-templates:create-library` directory-path name description &key request-all-options

Creates Common Lisp library in the specified directory.

Pass `:REQUEST-ALL-OPTIONS` T to fill all optional options or use more generic
call to `MYSTIC:RENDER` function to pass any options you like as a list.

<a id="x-2840ANTS-PROJECT-TEMPLATES-2FLIBRARY-3AMAKE-CORE-FILE-20GENERIC-FUNCTION-29"></a>

#### [generic-function](f2fa) `40ants-project-templates/library:make-core-file` template

Should return a file object, which creates main lisp file.

Use [`make-file`][659a] function to create a [`mystic.template.file:file`][a919] object.

<a id="x-2840ANTS-PROJECT-TEMPLATES-2FLIBRARY-3AMAKE-SYSTEM-FILE-20GENERIC-FUNCTION-29"></a>

#### [generic-function](23f1) `40ants-project-templates/library:make-system-file` template

Should return a file object, which creates `{{ name }}.asd` file.

<a id="x-2840ANTS-PROJECT-TEMPLATES-DOCS-2FINDEX-3A-3A-40REBLOCKS-APP-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### Reblocks Web App

<a id="x-2840ANTS-PROJECT-TEMPLATES-2FREBLOCKS-APP-3AREBLOCKS-APP-TEMPLATE-20CLASS-29"></a>

#### [class](0ce0) `40ants-project-templates/reblocks-app:reblocks-app-template` (library-template)

This template creates a Reblocks web application with a few simple widgets.

Other behaviour is inherited from [`library-template`][a2ba].

Use [`40ants-project-templates:create-reblocks-app`][7346] function to generate a skeleton
for a new web service.

<a id="options"></a>

##### Options

* `:AUTHOR` - Author. **Required**. The project author's name.

* `:NAME` - Name. **Required**. The project's name.

* `:DESCRIPTION` - Description. A short, one-line description of the project.

* `:DOC-THEME` - Documentation Theme. A theme name in the form of the fully specified symbol name (as a string). Example: 40ants-doc-theme-40ants:40ants-theme.

* `:EMAIL` - Email. The project author's email.

* `:GITHUB` - GitHub `URL`. The project's `URL` on the GitHub.

* `:HOMEPAGE` - Homepage. `URL` of the project's homepage.

* `:LICENSE` - License. Default: "`BSD`". The project's license string, e.g. '`MIT`', '`GPL`v3'.

<a id="x-2840ANTS-PROJECT-TEMPLATES-3ACREATE-REBLOCKS-APP-20FUNCTION-29"></a>

#### [function](39a9) `40ants-project-templates:create-reblocks-app` directory-path name description &key request-all-options

Creates Common Lisp web application in the specified directory.

Pass `:REQUEST-ALL-OPTIONS` T to fill all optional options or use more generic
call to `MYSTIC:RENDER` function to pass any options you like as a list.

<a id="x-2840ANTS-PROJECT-TEMPLATES-DOCS-2FINDEX-3A-3A-40MIXINS-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

## Mixins

<a id="x-2840ANTS-PROJECT-TEMPLATES-DOCS-2FINDEX-3A-3A-40CI-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### CI

<a id="x-2840ANTS-PROJECT-TEMPLATES-2FMIXIN-2FCI-3ACI-MIXIN-20CLASS-29"></a>

#### [class](14e3) `40ants-project-templates/mixin/ci:ci-mixin` (file-mixin)

Adds docs based on 40ants-docs.

<a id="x-2840ANTS-PROJECT-TEMPLATES-DOCS-2FINDEX-3A-3A-40CLPM-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### CLPM

<a id="x-2840ANTS-PROJECT-TEMPLATES-2FMIXIN-2FCLPM-3ACLPM-MIXIN-20CLASS-29"></a>

#### [class](ffaf) `40ants-project-templates/mixin/clpm:clpm-mixin` (file-mixin)

Adds clpmfile into the root of the project.

<a id="x-2840ANTS-PROJECT-TEMPLATES-DOCS-2FINDEX-3A-3A-40DOCS-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### Docs

<a id="x-2840ANTS-PROJECT-TEMPLATES-2FMIXIN-2FDOCS-3ADOCS-MIXIN-20CLASS-29"></a>

#### [class](8737) `40ants-project-templates/mixin/docs:docs-mixin` (file-mixin)

Adds docs based on 40ants-docs.

<a id="x-2840ANTS-PROJECT-TEMPLATES-DOCS-2FINDEX-3A-3A-40GITIGNORE-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### Gitignore

<a id="x-2840ANTS-PROJECT-TEMPLATES-2FMIXIN-2FGITIGNORE-3AGITIGNORE-MIXIN-20CLASS-29"></a>

#### [class](c3ed) `40ants-project-templates/mixin/gitignore:gitignore-mixin` ()

Adds .gitignore into the root of the project.

<a id="x-2840ANTS-PROJECT-TEMPLATES-2FMIXIN-2FGITIGNORE-3A-2APATTERNS-2A-20-28VARIABLE-29-29"></a>

#### [variable](a0a3) `40ants-project-templates/mixin/gitignore:*patterns*` ("*~" ".#*" ".*.~undo-tree~")

Default list of patterns which returned by [`patterns-to-ignore`][fcc9] generic function.

<a id="x-2840ANTS-PROJECT-TEMPLATES-2FMIXIN-2FGITIGNORE-3APATTERNS-TO-IGNORE-20GENERIC-FUNCTION-29"></a>

#### [generic-function](7bf8) `40ants-project-templates/mixin/gitignore:patterns-to-ignore` template

Should return a list of patterns to add to .gitignore. Default method takes them from [`*patterns*`][0c07] variable.

<a id="x-2840ANTS-PROJECT-TEMPLATES-DOCS-2FINDEX-3A-3A-40QLFILE-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### Qlfile

<a id="x-2840ANTS-PROJECT-TEMPLATES-2FMIXIN-2FQLFILE-3AQLFILE-MIXIN-20CLASS-29"></a>

#### [class](1f90) `40ants-project-templates/mixin/qlfile:qlfile-mixin` (file-mixin)

Adds qlfile into the root of the project.

<a id="x-2840ANTS-PROJECT-TEMPLATES-2FMIXIN-2FQLFILE-3AQLFILE-PIECES-20GENERIC-FUNCTION-29"></a>

#### [generic-function](f5e0) `40ants-project-templates/mixin/qlfile:qlfile-pieces` template

Returns a list of strings which will be concatentated to build a qlfile.

<a id="x-2840ANTS-PROJECT-TEMPLATES-DOCS-2FINDEX-3A-3A-40ROVE-TESTS-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

### Rove Tests

<a id="x-2840ANTS-PROJECT-TEMPLATES-2FMIXIN-2FROVE-TESTS-3AROVE-TESTS-MIXIN-20CLASS-29"></a>

#### [class](3776) `40ants-project-templates/mixin/rove-tests:rove-tests-mixin` (file-mixin)

Adds tests based on Rove.

<a id="x-2840ANTS-PROJECT-TEMPLATES-DOCS-2FINDEX-3A-3A-40UTILS-2040ANTS-DOC-2FLOCATIVES-3ASECTION-29"></a>

## Utilities

<a id="x-28MYSTIC-2ETEMPLATE-2EFILE-3AFILE-MIXIN-20CLASS-29"></a>

### [class](2ee7) `mystic.template.file:file-mixin` (template)

A Mystic template mixin for rendering a list of files using Mustache.

<a id="x-28MYSTIC-2ETEMPLATE-2EFILE-3AFILE-20CLASS-29"></a>

### [class](a38e) `mystic.template.file:file` ()

A file.

<a id="x-28MYSTIC-2ETEMPLATE-2EFILE-3AFILE-CONTENT-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-20MYSTIC-2ETEMPLATE-2EFILE-3AFILE-29-29"></a>

### [reader](d6a9) `mystic.template.file:file-content` (file) (:content)

The file's contents, a Mustache template string.

<a id="x-28MYSTIC-2ETEMPLATE-2EFILE-3AFILE-PATH-20-2840ANTS-DOC-2FLOCATIVES-3AREADER-20MYSTIC-2ETEMPLATE-2EFILE-3AFILE-29-29"></a>

### [reader](f016) `mystic.template.file:file-path` (file) (:path)

The path to the file relative to the directory,
a Mustache template string.

<a id="x-28MYSTIC-2ETEMPLATE-2EFILE-3AMAKE-FILE-20FUNCTION-29"></a>

### [function](c82e) `mystic.template.file:make-file` system-name path output-path-template

<a id="x-2840ANTS-PROJECT-TEMPLATES-2FUTILS-3AENSURE-TEMPLATE-DOCSTRING-HAS-OPTIONS-DESCRIPTION-20FUNCTION-29"></a>

### [function](1a0c) `40ants-project-templates/utils:ensure-template-docstring-has-options-description` CLASS-NAME &KEY (TITLE "## Options")

Appends options description to the documentation string of a given template class.

Options are sorted by their keyword argument name but "required" go before optional.

Wrap this function call with `EVAL-WHEN` if calling it as a toplevel form.

Warning, this function trims all leading whitespaces from lines of original
template class docstrings.


[863f]: https://40ants.com/project-templates/
[a2ba]: https://40ants.com/project-templates/#x-2840ANTS-PROJECT-TEMPLATES-2FLIBRARY-3ALIBRARY-TEMPLATE-20CLASS-29
[5153]: https://40ants.com/project-templates/#x-2840ANTS-PROJECT-TEMPLATES-2FMIXIN-2FCI-3ACI-MIXIN-20CLASS-29
[f9c4]: https://40ants.com/project-templates/#x-2840ANTS-PROJECT-TEMPLATES-2FMIXIN-2FCLPM-3ACLPM-MIXIN-20CLASS-29
[333e]: https://40ants.com/project-templates/#x-2840ANTS-PROJECT-TEMPLATES-2FMIXIN-2FDOCS-3ADOCS-MIXIN-20CLASS-29
[0c07]: https://40ants.com/project-templates/#x-2840ANTS-PROJECT-TEMPLATES-2FMIXIN-2FGITIGNORE-3A-2APATTERNS-2A-20-28VARIABLE-29-29
[cb6d]: https://40ants.com/project-templates/#x-2840ANTS-PROJECT-TEMPLATES-2FMIXIN-2FGITIGNORE-3AGITIGNORE-MIXIN-20CLASS-29
[fcc9]: https://40ants.com/project-templates/#x-2840ANTS-PROJECT-TEMPLATES-2FMIXIN-2FGITIGNORE-3APATTERNS-TO-IGNORE-20GENERIC-FUNCTION-29
[c335]: https://40ants.com/project-templates/#x-2840ANTS-PROJECT-TEMPLATES-2FMIXIN-2FQLFILE-3AQLFILE-MIXIN-20CLASS-29
[2215]: https://40ants.com/project-templates/#x-2840ANTS-PROJECT-TEMPLATES-2FMIXIN-2FROVE-TESTS-3AROVE-TESTS-MIXIN-20CLASS-29
[9624]: https://40ants.com/project-templates/#x-2840ANTS-PROJECT-TEMPLATES-2FREBLOCKS-APP-3AREBLOCKS-APP-TEMPLATE-20CLASS-29
[560f]: https://40ants.com/project-templates/#x-2840ANTS-PROJECT-TEMPLATES-3ACREATE-LIBRARY-20FUNCTION-29
[7346]: https://40ants.com/project-templates/#x-2840ANTS-PROJECT-TEMPLATES-3ACREATE-REBLOCKS-APP-20FUNCTION-29
[a919]: https://40ants.com/project-templates/#x-28MYSTIC-2ETEMPLATE-2EFILE-3AFILE-20CLASS-29
[659a]: https://40ants.com/project-templates/#x-28MYSTIC-2ETEMPLATE-2EFILE-3AMAKE-FILE-20FUNCTION-29
[41d7]: https://github.com/40ants/project-templates
[ca1d]: https://github.com/40ants/project-templates/actions
[a38e]: https://github.com/40ants/project-templates/blob/b9b65869a5e499602d63f44b55858cafff9d20f5/.qlot/dists/ultralisp/software/roswell-mystic-20230314045148/templates/mixins/file/file.lisp#L18
[f016]: https://github.com/40ants/project-templates/blob/b9b65869a5e499602d63f44b55858cafff9d20f5/.qlot/dists/ultralisp/software/roswell-mystic-20230314045148/templates/mixins/file/file.lisp#L19
[d6a9]: https://github.com/40ants/project-templates/blob/b9b65869a5e499602d63f44b55858cafff9d20f5/.qlot/dists/ultralisp/software/roswell-mystic-20230314045148/templates/mixins/file/file.lisp#L24
[2ee7]: https://github.com/40ants/project-templates/blob/b9b65869a5e499602d63f44b55858cafff9d20f5/.qlot/dists/ultralisp/software/roswell-mystic-20230314045148/templates/mixins/file/file.lisp#L30
[c82e]: https://github.com/40ants/project-templates/blob/b9b65869a5e499602d63f44b55858cafff9d20f5/.qlot/dists/ultralisp/software/roswell-mystic-20230314045148/templates/mixins/file/file.lisp#L49
[2781]: https://github.com/40ants/project-templates/blob/b9b65869a5e499602d63f44b55858cafff9d20f5/src/core.lisp#L20
[39a9]: https://github.com/40ants/project-templates/blob/b9b65869a5e499602d63f44b55858cafff9d20f5/src/core.lisp#L36
[b874]: https://github.com/40ants/project-templates/blob/b9b65869a5e499602d63f44b55858cafff9d20f5/src/library.lisp#L30
[23f1]: https://github.com/40ants/project-templates/blob/b9b65869a5e499602d63f44b55858cafff9d20f5/src/library.lisp#L85
[f2fa]: https://github.com/40ants/project-templates/blob/b9b65869a5e499602d63f44b55858cafff9d20f5/src/library.lisp#L93
[14e3]: https://github.com/40ants/project-templates/blob/b9b65869a5e499602d63f44b55858cafff9d20f5/src/mixin/ci.lisp#L11
[ffaf]: https://github.com/40ants/project-templates/blob/b9b65869a5e499602d63f44b55858cafff9d20f5/src/mixin/clpm.lisp#L11
[8737]: https://github.com/40ants/project-templates/blob/b9b65869a5e499602d63f44b55858cafff9d20f5/src/mixin/docs.lisp#L16
[c3ed]: https://github.com/40ants/project-templates/blob/b9b65869a5e499602d63f44b55858cafff9d20f5/src/mixin/gitignore.lisp#L13
[a0a3]: https://github.com/40ants/project-templates/blob/b9b65869a5e499602d63f44b55858cafff9d20f5/src/mixin/gitignore.lisp#L18
[7bf8]: https://github.com/40ants/project-templates/blob/b9b65869a5e499602d63f44b55858cafff9d20f5/src/mixin/gitignore.lisp#L25
[1f90]: https://github.com/40ants/project-templates/blob/b9b65869a5e499602d63f44b55858cafff9d20f5/src/mixin/qlfile.lisp#L25
[f5e0]: https://github.com/40ants/project-templates/blob/b9b65869a5e499602d63f44b55858cafff9d20f5/src/mixin/qlfile.lisp#L30
[3776]: https://github.com/40ants/project-templates/blob/b9b65869a5e499602d63f44b55858cafff9d20f5/src/mixin/rove-tests.lisp#L11
[0ce0]: https://github.com/40ants/project-templates/blob/b9b65869a5e499602d63f44b55858cafff9d20f5/src/reblocks-app.lisp#L15
[1a0c]: https://github.com/40ants/project-templates/blob/b9b65869a5e499602d63f44b55858cafff9d20f5/src/utils.lisp#L91
[8fc2]: https://github.com/40ants/project-templates/issues

* * *
###### [generated by [40ANTS-DOC](https://40ants.com/doc/)]
