Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFB83C5522;
	Mon, 27 Apr 2026 13:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294820; cv=none; b=qaunytOQY7kW9/jZSUz0UNie2CsxeU2jLRHpaPMdQZ5/vCIUVOdD9i1fv8yw5i0TtZer0TlMkjRlgQ6iww21E5Pr267wmgBJ2BIaM7doB75sw6i+eQsk7uo3LkNUz/baj4phm979ikb2Ov3i7kh4lD4JdmnJt+ZFMC5PQoMSPd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294820; c=relaxed/simple;
	bh=2EHIpNiSQOvDao9ENEGwgn3WieRzrgdPXVweOZ5ti+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rz6aXpwj7E1d9S+xfAYVlo7TSvHAhSMf1ujfDG1UCPUUqdkR/tpOseWehXLnQJ24acFi3D2cgzMiS74b0LRdb+R8KjhT++czGaeSf8u/ZzRQzlj0MrWFpGQmg9GEs8fG1EvYj9aiTIeDLwC1vJxCHrLTgaYRnbcMRQwcm6FXs5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XoHzOXyt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XoHzOXyt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3139C2BCB4;
	Mon, 27 Apr 2026 13:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777294819;
	bh=2EHIpNiSQOvDao9ENEGwgn3WieRzrgdPXVweOZ5ti+I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XoHzOXytyzqgCwFjACv78UpHahmHq9v2mqJUBZP9+jZKzRWTtm77kC1qU7nmEgmAg
	 ZeiVxMV3f6oqjYUUDdiWofAPvmDWK+1Zp8c2ZiQcUf709pbwlaM5UXuY0rE7mdoncr
	 rAzvSu38KQErdiu/bdm0Ns6ZnaM5v9gRSca5KOA+ywzbMev558uOr1bjn1eqxYhadX
	 yzH0BVOfGnfCP+V3CWMpNK7N/EqPGFFJ7mRKfsEojLzI9xym981qPLJ/Cn5cRffiGd
	 JHN2er1e9U6aBuDn8lANTLXg6tYrQClE/v70il4uQAqIhi7NEERmqVanHErXQwjO87
	 GGV8Q0rmj/dwA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1wHLZR-0000000BxG6-4Afv;
	Mon, 27 Apr 2026 15:00:17 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	workflows@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v3 12/12] docs: maintainers_include: parse MAINTAINERS just once
Date: Mon, 27 Apr 2026 15:00:12 +0200
Message-ID: <3a01afc58defa4eb92df709b517392ef550f81b2.1777294623.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1777294623.git.mchehab+huawei@kernel.org>
References: <cover.1777294623.git.mchehab+huawei@kernel.org>
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

