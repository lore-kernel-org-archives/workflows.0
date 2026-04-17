Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FAB36F43E;
	Fri, 17 Apr 2026 06:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776406287; cv=none; b=DoUJydRX1krZTuDTIQtO7jC94IsbF3cVRassVVOPtbDn22MpGzdndPC/MRc78a9WpSzRemuA5ufryEhCVob7rCoh7pH+EyBLo363a4+uhdHoGUHGCFTLYE+kh5myW8HpFLW1YN9+ifhmt4FzS4QQ8b0cBHk85aGlku28LbR0zfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776406287; c=relaxed/simple;
	bh=2EHIpNiSQOvDao9ENEGwgn3WieRzrgdPXVweOZ5ti+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EE37wX+EudKZaXXnYKAGE+zhh+QukbC/JNQnvm9CoFPOgAj8F2hda9sKIdxBP4pfqr0n8VxwYllxCWu2FLIGbedgITL4AMDul2g11sohr0viXbSuytt60/uQ+nj9JLO/op74pTZykCrPqu8vq5C+XFReR3VPSeibhUg6tlSlTqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rS9uuY2C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rS9uuY2C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 729AAC2BCC9;
	Fri, 17 Apr 2026 06:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776406287;
	bh=2EHIpNiSQOvDao9ENEGwgn3WieRzrgdPXVweOZ5ti+I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rS9uuY2CAFiLuwezRToKsBFgA7JIJ2URqKSokuTjPjWcEqP42XF+WUaV9bEH/5w6Z
	 WJ+9HxQLzquMKIJu9ML+LvjvAXoq5Bib8HDZQ3X03w+TauwHsePYZS2wZJJ10q/pna
	 sa0HkobyEpQcJV524+jrkdOH+l3C9rsmFJZhN+ldZbnAcAkCrerWudncU4E9iP2h49
	 vJbEQhwa6yDnfsaV0OEvNd/mQI1WtWZ9P9e61os4FEUYMwqH8tNo5+yIhs8jVSvJFY
	 BUc2M2SIsYxlhZgjizl7gkSScW+BpI3CCpi/9NAQi0dWNQdzu8PeB9/Q/VJ7QdQYLS
	 6V5vDiz0Wqz/A==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wDcQH-0000000H8t5-344q;
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
Subject: [PATCH v2 11/11] docs: maintainers_include: parse MAINTAINERS just once
Date: Fri, 17 Apr 2026 08:11:21 +0200
Message-ID: <85da1a310479306c712260a74ce805be6aff2df2.1776405189.git.mchehab+huawei@kernel.org>
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

Change the logic to parse MAINTAINERS file content just once,
while still allowing using it multiple times.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/maintainers_include.py | 61 +++++++--------------
 1 file changed, 21 insertions(+), 40 deletions(-)

diff --git a/Documentation/sphinx/maintainers_include.py b/Documentation/sphinx/maintainers_include.py
index ae52e8198750..436e7ac42ffc 100755
--- a/Documentation/sphinx/maintainers_include.py
+++ b/Documentation/sphinx/maintainers_include.py
@@ -37,14 +37,13 @@ def ErrorString(exc):  # Shamelessly stolen from docutils
 
 __version__  = '1.0'
 
-app_dir = "."
+maint_parser = None
 
 class MaintainersParser:
     """Parse MAINTAINERS file(s) content"""
 
-    def __init__(self, path):
-        global app_dir
-
+    def __init__(self, app_dir, path):
+        self.path = path
         self.profile_toc = set()
         self.profile_entries = {}
 
@@ -67,7 +66,6 @@ class MaintainersParser:
         subsystem_name = None
 
         base_dir, doc_dir, sphinx_dir = app_dir.partition("Documentation")
-        print("BASE DIR", base_dir)
 
         for line in open(path):
             # Have we reached the end of the preformatted Descriptions text?
@@ -105,8 +103,6 @@ class MaintainersParser:
                 else:
                     entry = "/" + entry
 
-                print(f"{name}: entry: {entry} FULL: {full_name} path: {path}")
-
                 if "*" in entry:
                     for e in glob(entry):
                         self.profile_toc.add(e)
@@ -217,14 +213,17 @@ class MaintainersInclude(Include):
     """MaintainersInclude (``maintainers-include``) directive"""
     required_arguments = 0
 
-    def emit(self, path):
+    def emit(self):
         """Parse all the MAINTAINERS lines into ReST for human-readability"""
+        global maint_parser
 
-        output = MaintainersParser(path).output
+        path = maint_parser.path
+        output = maint_parser.output
 
         # For debugging the pre-rendered results...
         #print(output, file=open("/tmp/MAINTAINERS.rst", "w"))
 
+        self.state.document.settings.record_dependencies.add(path)
         self.state_machine.insert_input(statemachine.string2lines(output), path)
 
     def run(self):
@@ -232,19 +231,8 @@ class MaintainersInclude(Include):
         if not self.state.document.settings.file_insertion_enabled:
             raise self.warning('"%s" directive disabled.' % self.name)
 
-        # Walk up source path directories to find Documentation/../
-        path = self.state_machine.document.attributes['source']
-        path = os.path.realpath(path)
-        tail = path
-        while tail != "Documentation" and tail != "":
-            (path, tail) = os.path.split(path)
-
-        # Append "MAINTAINERS"
-        path = os.path.join(path, "MAINTAINERS")
-
         try:
-            self.state.document.settings.record_dependencies.add(path)
-            lines = self.emit(path)
+            lines = self.emit()
         except IOError as error:
             raise self.severe('Problems with "%s" directive path:\n%s.' %
                       (self.name, ErrorString(error)))
@@ -254,16 +242,17 @@ class MaintainersInclude(Include):
 class MaintainersProfile(Include):
     required_arguments = 0
 
-    def emit(self, path):
+    def emit(self):
         """Parse all the MAINTAINERS lines looking for profile entries"""
+        global maint_parser
 
-        maint = MaintainersParser(path)
+        path = maint_parser.path
 
         #
         # Produce a list with all maintainer profiles, sorted by subsystem name
         #
         output = ""
-        for profile, entry in sorted(maint.profile_entries.items()):
+        for profile, entry in sorted(maint_parser.profile_entries.items()):
             if entry.startswith("http"):
                 output += f"- `{profile} <{entry}>`_\n"
             else:
@@ -276,13 +265,12 @@ class MaintainersProfile(Include):
         output += "\n.. toctree::\n"
         output += "   :hidden:\n\n"
 
-        for fname in maint.profile_toc:
+        for fname in maint_parser.profile_toc:
             output += f"   {fname}\n"
 
         output += "\n"
 
-        print(output)
-
+        self.state.document.settings.record_dependencies.add(path)
         self.state_machine.insert_input(statemachine.string2lines(output), path)
 
     def run(self):
@@ -290,19 +278,8 @@ class MaintainersProfile(Include):
         if not self.state.document.settings.file_insertion_enabled:
             raise self.warning('"%s" directive disabled.' % self.name)
 
-        # Walk up source path directories to find Documentation/../
-        path = self.state_machine.document.attributes['source']
-        path = os.path.realpath(path)
-        tail = path
-        while tail != "Documentation" and tail != "":
-            (path, tail) = os.path.split(path)
-
-        # Append "MAINTAINERS"
-        path = os.path.join(path, "MAINTAINERS")
-
         try:
-            self.state.document.settings.record_dependencies.add(path)
-            lines = self.emit(path)
+            lines = self.emit()
         except IOError as error:
             raise self.severe('Problems with "%s" directive path:\n%s.' %
                       (self.name, ErrorString(error)))
@@ -310,13 +287,17 @@ class MaintainersProfile(Include):
         return []
 
 def setup(app):
-    global app_dir
+    global maint_parser
 
     #
     # NOTE: we're using os.fspath() here because of a Sphinx warning:
     #   RemovedInSphinx90Warning: Sphinx 9 will drop support for representing paths as strings. Use "pathlib.Path" or "os.fspath" instead.
     #
     app_dir = os.fspath(app.srcdir)
+    srctree = os.path.abspath(os.environ["srctree"])
+    path = os.path.join(srctree, "MAINTAINERS")
+
+    maint_parser = MaintainersParser(app_dir, path)
 
     app.add_directive("maintainers-include", MaintainersInclude)
     app.add_directive("maintainers-profile-toc", MaintainersProfile)
-- 
2.53.0

