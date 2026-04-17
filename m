Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE40370D6A;
	Fri, 17 Apr 2026 06:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776406287; cv=none; b=dOYQFg28eyrFNZhBsloRFxmmje/qbdSg8AQG27m+wPjvLnF1LTy3GMN5ZP8S1rnbHDbetDi9lfVd1H8I3fUGZP7uU/d9zjiS2GdnsbBnH8iDLuNxrq8Uk/0O+xAVlgz/04XdngyDw90WOZUy3KiMRb+RAiuqByg3juO2ZhzCmjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776406287; c=relaxed/simple;
	bh=9WClNhud4aDzY0l2t1PwxaLHqFpthSUfn2BKHY4i39Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DoR4q2e463bK3UPQ/h9B090xHUjO/9d2A0X8bVJBEzr0R+8Do4p6TIHXq21XrQgXSQfHzV5zB1O9Y7UlhjtRHzdvgbF+bLSXDbbsZJW33y8Ubp4VCZfqSWRw3W8TrIO8gNwGzcSFiVEM+nLUsnSwaCwcrbLDQNkF2KPgZpztImw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F+HpgrRT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F+HpgrRT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 696E9C2BCC6;
	Fri, 17 Apr 2026 06:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776406287;
	bh=9WClNhud4aDzY0l2t1PwxaLHqFpthSUfn2BKHY4i39Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F+HpgrRTpRMSRql/fia/gKDen8vl6CIllj0WRRMBvkvc1+uIGnNblZm3K+v8tO9Hb
	 wfOqqfGlL29weLL/QH0fXrM3H5O5wI7oYspxwWO6fprh4Khww8M0P75N4DtDSPb3VZ
	 nUM2ECviGuw+XUKQFRXLEUFgV/Z7VHLmCjJIJIOSFapDbr6Fhjg3OAUBgjZ2J2a83B
	 ea0GyrbsIsOTWp/DUB0QoJZ+lt0DZEKLEaIunghz22/n8Jlx1lOsC71WrMKTCTGTZj
	 qZUYyDBf68bLa76i3eSEDOxASndJ8tJyJMkmNZRMDzPscNzShDg1TgtAGGZbJTxCbX
	 W4l7xn1FrAq7g==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wDcQH-0000000H8t1-2wzi;
	Fri, 17 Apr 2026 08:11:25 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Dan Williams <djbw@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v2 10/11] docs: maintainers_include: fix support for O=dir
Date: Fri, 17 Apr 2026 08:11:20 +0200
Message-ID: <45d21c9d47c82471b4e35ea743b87bfcd279902f.1776405189.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1776405189.git.mchehab+huawei@kernel.org>
References: <cover.1776405189.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

os.path.relpath() will do the wrong thing with O=dir, as the build
system uses "cd <dir>" internally.

Solve it by using app.srcdir, which, on normal cases, point to
Documentation/, or, when SPHINXDIRS=process, it will be set with
Documentation/process.

While here, remove a dead code while writing maintainer profiles,
as now all entries should have both profile and entry.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Closes: https://lore.kernel.org/linux-doc/88335220-3527-4b1f-9500-417f7ebb7a02@infradead.org/T/#m6854cbd8d30e2c5d3e8c4173bae1c3d6922ff970
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 71 +++++++++++++++------
 1 file changed, 50 insertions(+), 21 deletions(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index 5413c1350bba..ae52e8198750 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -27,15 +27,24 @@ from docutils import statemachine
 from docutils.parsers.rst import Directive
 from docutils.parsers.rst.directives.misc import Include
 
+#
+# Base URL for intersphinx-like links to maintainer profiles
+#
+KERNELDOC_URL = "https://docs.kernel.org/"
+
 def ErrorString(exc):  # Shamelessly stolen from docutils
     return f'{exc.__class__.__name}: {exc}'
 
 __version__  = '1.0'
 
+app_dir = "."
+
 class MaintainersParser:
     """Parse MAINTAINERS file(s) content"""
 
-    def __init__(self, base_path, path):
+    def __init__(self, path):
+        global app_dir
+
         self.profile_toc = set()
         self.profile_entries = {}
 
@@ -57,6 +66,9 @@ class MaintainersParser:
         field_content = ""
         subsystem_name = None
 
+        base_dir, doc_dir, sphinx_dir = app_dir.partition("Documentation")
+        print("BASE DIR", base_dir)
+
         for line in open(path):
             # Have we reached the end of the preformatted Descriptions text?
             if descriptions and line.startswith('Maintainers'):
@@ -76,9 +88,25 @@ class MaintainersParser:
             #
             # Handle profile entries - either as files or as https refs
             #
-            match = re.match(r"P:\s*(Documentation/\S+)\.rst", line)
+            match = re.match(rf"P:\s*({doc_dir})(/\S+)\.rst", line)
             if match:
-                entry = os.path.relpath(match.group(1), base_path)
+                name = "".join(match.groups())
+                entry = os.path.relpath(base_dir + name, app_dir)
+
+                full_name = os.path.join(base_dir, name)
+                path = os.path.relpath(full_name, app_dir)
+                #
+                # When SPHINXDIRS is used, it will try to reference files
+                # outside srctree, causing warnings. To avoid that, point
+                # to the latest official documentation
+                #
+                if path.startswith("../"):
+                    entry = KERNELDOC_URL + match.group(2) + ".html"
+                else:
+                    entry = "/" + entry
+
+                print(f"{name}: entry: {entry} FULL: {full_name} path: {path}")
+
                 if "*" in entry:
                     for e in glob(entry):
                         self.profile_toc.add(e)
@@ -189,10 +217,10 @@ class MaintainersInclude(Include):
     """MaintainersInclude (``maintainers-include``) directive"""
     required_arguments = 0
 
-    def emit(self, base_path, path):
+    def emit(self, path):
         """Parse all the MAINTAINERS lines into ReST for human-readability"""
 
-        output = MaintainersParser(base_path, path).output
+        output = MaintainersParser(path).output
 
         # For debugging the pre-rendered results...
         #print(output, file=open("/tmp/MAINTAINERS.rst", "w"))
@@ -213,11 +241,10 @@ class MaintainersInclude(Include):
 
         # Append "MAINTAINERS"
         path = os.path.join(path, "MAINTAINERS")
-        base_path = os.path.dirname(self.state.document.document.current_source)
 
         try:
             self.state.document.settings.record_dependencies.add(path)
-            lines = self.emit(base_path, path)
+            lines = self.emit(path)
         except IOError as error:
             raise self.severe('Problems with "%s" directive path:\n%s.' %
                       (self.name, ErrorString(error)))
@@ -227,27 +254,20 @@ class MaintainersInclude(Include):
 class MaintainersProfile(Include):
     required_arguments = 0
 
-    def emit(self, base_path, path):
+    def emit(self, path):
         """Parse all the MAINTAINERS lines looking for profile entries"""
 
-        maint = MaintainersParser(base_path, path)
+        maint = MaintainersParser(path)
 
         #
         # Produce a list with all maintainer profiles, sorted by subsystem name
         #
         output = ""
-
-        for profile, entry in maint.profile_entries.items():
+        for profile, entry in sorted(maint.profile_entries.items()):
             if entry.startswith("http"):
-                if profile:
-                    output += f"- `{profile} <{entry}>`_\n"
-                else:
-                    output += f"- `<{entry}>_`\n"
+                output += f"- `{profile} <{entry}>`_\n"
             else:
-                if profile:
-                    output += f"- :doc:`{profile} <{entry}>`\n"
-                else:
-                    output += f"- :doc:`<{entry}>`\n"
+                output += f"- :doc:`{profile} <{entry}>`\n"
 
         #
         # Create a hidden TOC table with all profiles. That allows adding
@@ -261,6 +281,8 @@ class MaintainersProfile(Include):
 
         output += "\n"
 
+        print(output)
+
         self.state_machine.insert_input(statemachine.string2lines(output), path)
 
     def run(self):
@@ -277,11 +299,10 @@ class MaintainersProfile(Include):
 
         # Append "MAINTAINERS"
         path = os.path.join(path, "MAINTAINERS")
-        base_path = os.path.dirname(self.state.document.document.current_source)
 
         try:
             self.state.document.settings.record_dependencies.add(path)
-            lines = self.emit(base_path, path)
+            lines = self.emit(path)
         except IOError as error:
             raise self.severe('Problems with "%s" directive path:\n%s.' %
                       (self.name, ErrorString(error)))
@@ -289,6 +310,14 @@ class MaintainersProfile(Include):
         return []
 
 def setup(app):
+    global app_dir
+
+    #
+    # NOTE: we're using os.fspath() here because of a Sphinx warning:
+    #   RemovedInSphinx90Warning: Sphinx 9 will drop support for representing paths as strings. Use "pathlib.Path" or "os.fspath" instead.
+    #
+    app_dir = os.fspath(app.srcdir)
+
     app.add_directive("maintainers-include", MaintainersInclude)
     app.add_directive("maintainers-profile-toc", MaintainersProfile)
     return dict(
-- 
2.53.0

